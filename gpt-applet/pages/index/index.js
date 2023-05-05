// pages/index/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    close: false,
    shadow: false,
    chatList: [{
      image: 'https://www.antsclimb.com/profile/avatar/static/AI3.png',
      name: '问答AI小助手 - 3',
      time: '2023-03-05',
      num: 10,
      message: '你好',
      onLine: true
    }, {
      image: 'https://www.antsclimb.com/profile/avatar/static/AI4.png',
      name: '问答AI小助手 - 4',
      time: '',
      num: undefined,
      message: '问答AI小助手-4即将上线，尽情期待...',
      onLine: false
    }]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad() {
  },

  goChat(e) {
    var index = e.currentTarget.dataset.index;
    if (index == 0) {
      wx.navigateTo({
        url: '/pages/chat/chat',
      })
    } else if (index ==1) {
      wx.showToast({
        title: '问答AI小助手-4即将上线，尽情期待...',
        icon: 'none'
      })
    }
  },

  inputSearch(e) {
    var search = e.detail.value;
    this.setData({
      search: search
    });
    if (this.data.search) {
      this.setData({
        close: true
      })
    } else {
      this.setData({
        close: false
      })
    }
  },

  closeSearch() {
    this.setData({
      search: '',
      close: false
    })
  },

  focusSearch() {
    this.setData({
      shadow: true
    })
  },

  blurSearch() {
    this.setData({
      shadow: false
    })
  },

  // ListTouch触摸开始
  ListTouchStart(e) {
    var onLine = e.currentTarget.dataset.online;
    if( !onLine ) {
      return;
    }
    this.setData({
      ListTouchStart: e.touches[0].pageX
    })
  },

  // ListTouch计算方向
  ListTouchMove(e) {
    var onLine = e.currentTarget.dataset.online;
    if( !onLine ) {
      return;
    }
    this.setData({
      ListTouchDirection: e.touches[0].pageX - this.data.ListTouchStart > 0 ? 'right' : 'left'
    })
  },

  // ListTouch计算滚动
  ListTouchEnd(e) {
    var onLine = e.currentTarget.dataset.online;
    if( !onLine ) {
      return;
    }
    if (this.data.ListTouchDirection =='left'){
      this.setData({
        modalName: e.currentTarget.dataset.target
      })
    } else {
      this.setData({
        modalName: null
      })
    }
    this.setData({
      ListTouchDirection: null
    })
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})