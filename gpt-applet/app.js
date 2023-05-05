// app.js
App({
  onLaunch() {
    if (wx.cloud) {
      wx.cloud.init({
        traceUser: true
      })
    }
    wx.getSystemInfo({
      success: e => {
        this.globalData.StatusBar = e.statusBarHeight;
        let capsule = wx.getMenuButtonBoundingClientRect();
        if (capsule) {
          this.globalData.Custom = capsule;
          this.globalData.CustomBar = capsule.bottom + capsule.top - e.statusBarHeight;
        } else {
          this.globalData.CustomBar = e.statusBarHeight + 50;
        }
      }
    })
  },
  globalData: {
    url: 'http://localhost:8080/wx/api/',
    wsUrl: 'ws://localhost:8080/wx/api/websocket/',
    userInfo: null,
    updateUserInfo: {
      avatarUrl: undefined,
      nickName: undefined,
      gender: undefined
    }
  }
})