import request from '@/utils/request'

// 查询微信聊天列表
export function listChat(query) {
  return request({
    url: '/weixin/chat/list',
    method: 'get',
    params: query
  })
}

// 查询微信聊天详细
export function getChat(id) {
  return request({
    url: '/weixin/chat/' + id,
    method: 'get'
  })
}

// 新增微信聊天
export function addChat(data) {
  return request({
    url: '/weixin/chat',
    method: 'post',
    data: data
  })
}

// 修改微信聊天
export function updateChat(data) {
  return request({
    url: '/weixin/chat',
    method: 'put',
    data: data
  })
}

// 删除微信聊天
export function delChat(id) {
  return request({
    url: '/weixin/chat/' + id,
    method: 'delete'
  })
}

// 导出微信聊天
export function exportChat(query) {
  return request({
    url: '/weixin/chat/export',
    method: 'get',
    params: query
  })
}