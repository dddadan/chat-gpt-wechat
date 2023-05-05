var app = getApp();
Page({
  data: {
    userInfo: {},
    isCanDraw: false,
    count: "-",
    pageLoading: false,
    backgroundImage: '/assets/image/background.jpg'
  },
  onLoad() {
    this.initBackground();
    this.setData({
      userInfo: app.globalData.userInfo
    });
    var AuthorizationToken = wx.getStorageSync('AuthorizationToken');
    if(!AuthorizationToken) {
      this.setData({
        pageLoading: true
      })
    }
  },
  initBackground() {
    var base64 = wx.getFileSystemManager().readFileSync(this.data.backgroundImage, 'base64');
    this.setData({
      backgroundImage: 'data:image/png;base64,' + base64
    });
  },
  onShow() {
    this.setData({
      userInfo: app.globalData.userInfo
    });
    // 请求当前用户的总对话数
    this.getCount();
  },
  getCount() {
    wx.request({
      url: app.globalData.url + 'count',
      header: {
        AuthorizationToken: wx.getStorageSync('AuthorizationToken')
      },
      method: 'GET',
      success: res => {
        if(res.data.code == 200) {
          var count = res.data.data;
          this.setData({
            count: count
          })
        }
      }
    })
  },
  goUser() {
    wx.navigateTo({
      url: './user/user?userInfo=' + JSON.stringify(this.data.userInfo),
    })
  },
  goAbout() {
    wx.navigateTo({
      url: './about/about',
    })
  },
  goFeedback() {
    wx.navigateTo({
      url: './feedback/feedback',
    })
  },
  goLog() {
    wx.navigateTo({
      url: './log/log',
    })
  },
  goShare() {
    this.setData({
      isCanDraw: true
    })
  },
  onClose() {
    this.setData({
      isCanDraw: false
    })
  }
})