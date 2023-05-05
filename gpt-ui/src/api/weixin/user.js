import request from '@/utils/request'

// 查询微信用户列表
export function listUser(query) {
  return request({
    url: '/weixin/user/list',
    method: 'get',
    params: query
  })
}

// 查询微信用户详细
export function getUser(id) {
  return request({
    url: '/weixin/user/' + id,
    method: 'get'
  })
}

// 新增微信用户
export function addUser(data) {
  return request({
    url: '/weixin/user',
    method: 'post',
    data: data
  })
}

// 修改微信用户
export function updateUser(data) {
  return request({
    url: '/weixin/user',
    method: 'put',
    data: data
  })
}

// 删除微信用户
export function delUser(id) {
  return request({
    url: '/weixin/user/' + id,
    method: 'delete'
  })
}

// 导出微信用户
export function exportUser(query) {
  return request({
    url: '/weixin/user/export',
    method: 'get',
    params: query
  })
}