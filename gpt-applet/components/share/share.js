Component({
  properties: {
    // 是否开始绘图
    isCanDraw: {
      type: Boolean,
      value: false,
      observer(newVal) {
        newVal && this.handleStartDrawImg()
      }
    },
    // 用户头像昵称信息
    userInfo: {
      type: Object,
      value: {
        avatarUrl: '',
        nickName: ''
      }
    }
  },
  data: {
    imgDraw: {}, // 绘制图片的大对象
    sharePath: '' // 生成的分享图
  },
  methods: {
    handleStartDrawImg() {
      wx.showLoading({
        title: '生成中'
      })
      this.setData({
        imgDraw: {
          width: '750rpx',
          height: '1334rpx',
          background: 'https://www.antsclimb.com/profile/avatar/static/share-bg.png',
          views: [
            {
              type: 'image',
              url: 'https://www.antsclimb.com/profile/avatar/static/share_screenshots.png',
              css: {
                top: '32rpx',
                left: '30rpx',
                right: '32rpx',
                width: '688rpx',
                height: '420rpx',
                borderRadius: '16rpx'
              },
            },
            {
              type: 'image',
              url: this.data.userInfo.avatarUrl || 'https://www.antsclimb.com/profile/avatar/static/AI.png',
              css: {
                top: '404rpx',
                left: '328rpx',
                width: '96rpx',
                height: '96rpx',
                borderWidth: '6rpx',
                borderColor: '#FFF',
                borderRadius: '96rpx'
              }
            },
            {
              type: 'text',
              text: this.data.userInfo.nickName || '问答AI小助手',
              css: {
                top: '532rpx',
                fontSize: '28rpx',
                left: '375rpx',
                align: 'center',
                color: '#3c3c3c'
              }
            },
            {
              type: 'text',
              text: `第 3 代`,
              css: {
                top: '576rpx',
                left: '375rpx',
                align: 'center',
                fontSize: '28rpx',
                color: '#3c3c3c'
              }
            },
            {
              type: 'text',
              text: `问答AI小助手体验版`,
              css: {
                top: '644rpx',
                left: '375rpx',
                maxLines: 1,
                align: 'center',
                fontWeight: 'bold',
                fontSize: '44rpx',
                color: '#3c3c3c'
              }
            },
            {
              type: 'image',
              url: 'https://www.antsclimb.com/profile/avatar/static/QR-code.jpg',
              css: {
                top: '834rpx',
                left: '470rpx',
                width: '200rpx',
                height: '200rpx'
              }
            }
          ]
        }
      })
    },
    onImgErr(e) {
      wx.hideLoading()
      wx.showToast({
        title: '生成分享图失败，请刷新页面重试'
      })
      //通知外部绘制完成，重置isCanDraw为false
      this.triggerEvent('initData') 
    },
    onImgOK(e) {
      wx.hideLoading()
      // 展示分享图
      wx.showShareImageMenu({
        path:  e.detail.path,
        fail: err => {
          // console.log(err);
        }
      })
      this.setData({
        sharePath: e.detail.path,
      })
      //通知外部绘制完成，重置isCanDraw为false
      this.triggerEvent('initData') 
    }
  }
})