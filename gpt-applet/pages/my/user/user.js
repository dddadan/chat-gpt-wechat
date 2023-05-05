// pages/user/user.js
var app = getApp();
const {
  $Message
} = require('../../../components/base/index');

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: undefined,
    textareaBValue: undefined,
    submitFlag: false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.setData({
      userInfo: JSON.parse(options.userInfo)
    })
  },

  selectGender(e) {
    var userInfo = this.data.userInfo;
    userInfo.gender = e.currentTarget.dataset.gender;
    this.setData({
      userInfo: userInfo
    })
  },

  textareaBInput(e) {
    this.setData({
      textareaBValue: e.detail.value
    })
  },

  nickNameInput(e) {
    var userInfo = this.data.userInfo;
    userInfo.nickName = e.detail.value;
    this.setData({
      userInfo: userInfo
    })
  },

  onChooseAvatar(e) {
    var userInfo = this.data.userInfo;
    var avatarUrl = e.detail.avatarUrl;
    userInfo.avatarUrl = avatarUrl;
    this.setData({
      userInfo: userInfo
    })
    wx.uploadFile({
      filePath: avatarUrl,
      name: 'avatarFile',
      url: app.globalData.url + 'saveAvatar',
      header: {
        "AuthorizationToken": wx.getStorageSync('AuthorizationToken')
      },
      success: res=>{
        if(res.statusCode == 200) {
          var data = JSON.parse(res.data);
          app.globalData.userInfo.avatarUrl = data.data;
          this.showToast(data.msg, "success");
        }
      }
    });
  },

  submit() {
    var userInfo = this.data.userInfo;
    if(!userInfo.nickName) {
      this.showToast('昵称不能为空~', 'warning');
      return;
    }
    this.setData({
      submitFlag: true
    })
    wx.request({
      url: app.globalData.url + 'updateUser',
      method: 'POST',
      header: {
        "AuthorizationToken": wx.getStorageSync('AuthorizationToken')
      },
      data: {
        nickName: userInfo.nickName,
        gender: userInfo.gender?userInfo.gender:"0",
        remark: this.data.textareaBValue
      },
      success: res=>{
        if(res.data.code == 200) {
          app.globalData.userInfo.nickName = userInfo.nickName;
          app.globalData.userInfo.gender = userInfo.gender?userInfo.gender:"0";
          app.globalData.userInfo.remark = this.data.textareaBValue;
          this.showToast('更新成功', 'success');
        } else {
          this.showToast(res.data.msg, 'warning');
        }
        this.setData({
          submitFlag: false
        })
      }
    })
  },

  showToast(msg, type) {
    $Message({
      content: msg,
      type: type
    });
  },
})