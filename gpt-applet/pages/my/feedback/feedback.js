// pages/my/feedback/feedback.js
var app = getApp();
const {
  $Message
} = require('../../../components/base/index');
Page({
  /**
   * 页面的初始数据
   */
  data: {
    contact: '',
    feedback: '',
    records: [],
    isDone: false
  },
  onLoad() {
    this.setData({
      userInfo: app.globalData.userInfo
    });
    this.getRecords();
  },
  getRecords() {
    this.setData({
      isDone: false
    })
    wx.request({
      url: app.globalData.url + 'feedbackList',
      header: {
        AuthorizationToken: wx.getStorageSync('AuthorizationToken')
      },
      success: res=>{
        if( res.data.code == 200 ){
          var records = res.data.data;
          this.setData({
            records: records,
            isDone: true
          });
        }
      }
    })
  },
  submit() {
    if(!this.data.contact) {
      this.showToast("请留下您的联系方式，方便与您沟通", "warning");
      return;
    }
    if(!this.data.feedback) {
      this.showToast("请填写具体内容后再提交", "warning");
      return;
    }
    wx.request({
      url: app.globalData.url + 'feedback',
      data: {
        contact: this.data.contact,
        feedback: this.data.feedback
      },
      header: {
        AuthorizationToken: wx.getStorageSync('AuthorizationToken')
      },
      method: 'POST',
      success: res => {
        if(res.data.code == 200) {
          this.showToast('感谢您的反馈~', 'success');
          this.setData({
            contact: '',
            feedback: ''
          });
          this.getRecords();
        } else {
          this.showToast(res.data.msg, 'warning');
        }
      }
    })
    
  },
  feedbaclInput(e) {
    var feedback = e.detail.value;
    this.setData({
      feedback: feedback
    })
  },
  contactInput(e) {
    var contact = e.detail.value;
    this.setData({
      contact: contact
    })
  },
  showToast(msg, type) {
    $Message({
      content: msg,
      type: type
    });
  }
})