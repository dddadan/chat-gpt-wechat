package com.ants.weixin.service;

import java.util.List;
import com.ants.weixin.domain.WxUser;

/**
 * 微信用户Service接口
 * 
 * @author ants
 * @date 2022-10-22
 */
public interface IWxUserService 
{
    /**
     * 查询微信用户
     * 
     * @param id 微信用户ID
     * @return 微信用户
     */
    public WxUser selectWxUserById(Long id);

    /**
     * 查询微信用户列表
     * 
     * @param wxUser 微信用户
     * @return 微信用户集合
     */
    public List<WxUser> selectWxUserList(WxUser wxUser);

    /**
     * 查询学习总数量
     *
     * @param openid openid
     * @return
     */
    Integer selectWxUserListGroupOpenid(String openid);

    /**
     * 新增微信用户
     * 
     * @param wxUser 微信用户
     * @return 结果
     */
    public int insertWxUser(WxUser wxUser);

    /**
     * 修改微信用户
     * 
     * @param wxUser 微信用户
     * @return 结果
     */
    public int updateWxUser(WxUser wxUser);

    /**
     * 修改微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    public int updateWxUserByOpenid(WxUser wxUser);

    /**
     * 批量删除微信用户
     * 
     * @param ids 需要删除的微信用户ID
     * @return 结果
     */
    public int deleteWxUserByIds(Long[] ids);

    /**
     * 删除微信用户信息
     * 
     * @param id 微信用户ID
     * @return 结果
     */
    public int deleteWxUserById(Long id);

    /**
     * 查询有效用户
     *
     * @param openid openid
     * @return 用户
     */
    public WxUser selectWxUserByOpenid(String openid);
}
