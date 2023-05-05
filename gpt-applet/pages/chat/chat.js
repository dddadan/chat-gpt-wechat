// index.js
// 获取应用实例
const app = getApp();
const {
  $Message
} = require('../../components/base/index');
const {
  formatTime
} = require('../../utils/util');
Page({
  data: {
    userInfo: {},
    hasUserInfo: false,
    InputBottom: 0,
    loading: false,
    message: '',
    talkList: [],
    pageLoading: true,
    scrollFlag: true,
    isCanDraw: false,
    isFirst: true
  },
  onLoad() {
    if (this.data.isFirst) {
      this.doLogin();
      this.setData({
        isFirst: false
      });
    }
  },
  onShow() {
    if (this.data.isFirst) {
      return;
    }
    // 如果不是load阶段，需要重新刷新页面的聊天记录，防止用户跳出页面后再返回,此时要保障用户最新的消息不是等待状态
    wx.request({
      url: app.globalData.url + 'chatStatus',
      header: {
        AuthorizationToken: this.data.AuthorizationToken || wx.getStorageSync('AuthorizationToken')
      },
      method: 'GET',
      success: res => {
        if (res.data.code == 200) {
          var flag = res.data.data;
          if (flag && !this.data.isFirst) {
            // 逻辑处理
            this.initRecord(this.data.AuthorizationToken, false);
          }
        }
      }
    })
  },
  initScroll() {
    if (this.data.scrollFlag) {
      wx.pageScrollTo({
        scrollTop: 9999999999,
        duration: 0
      });
    }
  },
  InputFocus(e) {
    this.setData({
      InputBottom: e.detail.height
    })
  },
  InputBlur(e) {
    this.setData({
      InputBottom: 0
    })
  },
  doLogin() {
    wx.login({
      success: res => {
        wx.request({
          url: app.globalData.url + 'getCode',
          data: {
            code: res.code
          },
          success: result => {
            if (result.data.code == 200) {
              var data = result.data.data;
              var openid = data.openid;
              var userInfo = data.userInfo;
              var hasUserInfo = data.hasUserInfo;
              var AuthorizationToken = data.AuthorizationToken;
              if (hasUserInfo && userInfo) {
                wx.setStorageSync('AuthorizationToken', AuthorizationToken);
                this.setData({
                  openid: openid,
                  userInfo: JSON.parse(userInfo),
                  AuthorizationToken: AuthorizationToken,
                  hasUserInfo: hasUserInfo
                });
              } else {
                this.showToast("账号被禁用", "warning");
                this.setData({
                  openid: openid,
                  userInfo: userInfo ? JSON.parse(userInfo) : {},
                  AuthorizationToken: AuthorizationToken,
                  hasUserInfo: hasUserInfo
                })
              }
              app.globalData.openid = openid;
              app.globalData.userInfo = this.data.userInfo;
              app.globalData.hasUserInfo = hasUserInfo;
              if (openid) {
                // 逻辑处理
                this.initRecord(AuthorizationToken, true);
              };
            } else if (result.data.code == 500) {
              this.showToast(result.data.msg, "warning");
            } else {
              this.showToast("网络异常...", "warning");
            }
          },
          fail: () => {
            this.showToast("网络异常...", "warning");
          }
        })
      },
      fail: () => {
        this.showToast("网络异常...", "warning");
      }
    })
  },
  showToast(msg, type) {
    $Message({
      content: msg,
      type: type
    });
  },
  initConnectSocket() {
    wx.connectSocket({
      url: app.globalData.wsUrl + this.data.openid,
      fail: res => {
        this.initConnectSocket();
      }
    });
  },
  initWebSocket() {
    if (!this.data.openid) {
      return;
    }
    wx.connectSocket({
      url: app.globalData.wsUrl + this.data.openid,
      success: res => {
        // console.log("连接成功");
      },
      fail: res => {
        // console.log("连接失败");
        this.initConnectSocket();
      }
    });
    wx.onSocketOpen(res => {
      // console.log("连接打开", res);
    });
    wx.onSocketError(err => {
      // console.log("连接不上", err);
      this.initConnectSocket();
    });
    wx.onSocketMessage(res => {
      // console.log("接收消息", res);
      var data = JSON.parse(res.data);
      var index = this.data.talkList.length - 2;
      if (!index) {
        return;
      }
      var nextIndex = index + 1;
      var update = data.update;
      var insert = data.insert;
      insert.createTime = this.getHalfTime(insert.createTime);
      var content = insert.content;
      insert.content = '';
      this.setData({
        [`talkList[${index}].id`]: update.id,
        [`talkList[${index}].errorFlag`]: update.errorFlag,
        [`talkList[${nextIndex}]`]: insert,
        loading: false
      });
      this.initScroll();
      var i = 0;
      var time = setInterval(() => {
        var text = content.substring(0, i);
        i++;
        this.setData({
          [`talkList[${nextIndex}].content`]: text,
        });
        if (text.length == content.length) {
          clearInterval(time);
        }
        this.initScroll();
      }, 80);
      this.setData({
        scrollFlag: true
      })
    });
    //心跳检测
    setInterval(() => {
      wx.sendSocketMessage({
        data: 'ping',
        success: res => {
          // console.log("心跳检测成功");
        },
        fail: res => {
          // console.log("重连", res);
          this.initConnectSocket();
        }
      })
    }, 5000);
  },
  onChooseAvatar(e) {
    var avatarUrl = e.detail.avatarUrl;
    // 更新头像，并且设置状态为登录，更新数据库，回传
    var userInfo = this.data.userInfo;
    userInfo.avatarUrl = avatarUrl;
    this.setData({
      userInfo: userInfo,
      hasUserInfo: true
    })
    wx.setStorageSync('AuthorizationToken', this.data.AuthorizationToken);
    wx.uploadFile({
      filePath: avatarUrl,
      name: 'avatarFile',
      url: app.globalData.url + 'saveAvatar',
      header: {
        "AuthorizationToken": wx.getStorageSync('AuthorizationToken')
      }
    })
  },
  inputMsg(e) {
    this.setData({
      message: e.detail.value
    })
  },
  sendMsg() {
    var message = this.data.message;
    if (!message) {
      return;
    }
    this.setData({
      message: '',
      loading: true,
      scrollFlag: true
    })
    var now = formatTime(new Date());
    var nowhalf = this.getHalfTime(now);
    var talkList = this.data.talkList;
    var index = talkList.length;
    talkList.push({
      role: "user",
      content: message,
      createTime: nowhalf
    })
    var nextIndex = index + 1;
    this.setData({
      index: index,
      [`talkList[${index}].role`]: 'user',
      [`talkList[${index}].content`]: message,
      [`talkList[${index}].createTime`]: nowhalf
    });
    this.initScroll();
    var i = 0;
    var time = setInterval(() => {
      var num = i % 3 + 1;
      var text = '...'.substring(0, num);
      i++;
      this.setData({
        [`talkList[${nextIndex}].role`]: 'assistant',
        [`talkList[${nextIndex}].content`]: text,
      });
      if (!this.data.loading) {
        clearInterval(time);
      }
      this.initScroll();
    }, 300);
    // 消息发送到后端处理
    wx.request({
      url: app.globalData.url + 'chat',
      data: {
        role: "user",
        content: message,
        createTime: now,
        loadingContent: ''
      },
      timeout: 60000 * 30,
      header: {
        AuthorizationToken: this.data.AuthorizationToken || wx.getStorageSync('AuthorizationToken')
      },
      method: 'POST',
      success: res => {
        if (res.data.code == 200) {
          console.log("发送成功");
        }
      }
    })
  },
  initRecord(AuthorizationToken, wsFlag) {
    wx.request({
      url: app.globalData.url + 'record',
      data: {
        openid: this.data.openid
      },
      header: {
        AuthorizationToken: AuthorizationToken
      },
      method: 'POST',
      success: res => {
        if (res.data.code == 200) {
          this.setData({
            talkList: []
          });
          var talkList = this.data.talkList;
          var data = res.data.data;
          for (var index in data) {
            var talk = data[index];
            talk.createTime = this.getHalfTime(talk.createTime);
            talkList.push(talk);
          }
          this.setData({
            talkList: talkList,
          }, () => {
            wx.nextTick(() => {
              // 确定没问题去查询数据非最后一条消息给个状态
              var nextIndex = talkList.length;
              if (nextIndex == 0) {
                return;
              }
              if (talkList[talkList.length - 1].role == 'user') {
                var i = 0;
                this.setData({
                  loading: true
                })
                var time = setInterval(() => {
                  var num = i % 3 + 1;
                  var text = '...'.substring(0, num);
                  i++;
                  this.setData({
                    [`talkList[${nextIndex}].role`]: 'assistant',
                    [`talkList[${nextIndex}].content`]: text,
                  });
                  if (!this.data.loading) {
                    clearInterval(time);
                  }
                  this.initScroll();
                }, 300);
              }
              this.initScroll();
              if (wsFlag) {
                this.initWebSocket();
              }
            });
          });
          this.setData({
            pageLoading: false
          })
        }
      }
    })
  },
  getHalfTime(time) {
    var now = formatTime(new Date());
    if (now.split(" ")[0] == time.split(" ")[0]) {
      return time.split(" ")[1].split(":")[0] + ":" + time.split(" ")[1].split(":")[1];
    } else {
      return time;
    }
  },
  copyBtn(e) {
    wx.setClipboardData({
      data: e.currentTarget.dataset.content,
      success: res => {
        wx.hideLoading();
        this.showToast("复制成功", "success");
      }
    })
  },
  touchStart() {
    this.setData({
      scrollFlag: false
    })
  },
  onReachBottom: function () {
    this.setData({
      scrollFlag: true
    })
  },
  onShareAppMessage() {
    return {
      title: '问答AI小助手',
      path: '/pages/index/index',
      imageUrl: '/assets/image/share_screenshots.png'
    }
  },
  share() {
    this.setData({
      isCanDraw: true
    })
  },
  onClose() {
    this.setData({
      isCanDraw: false
    })
  }
});