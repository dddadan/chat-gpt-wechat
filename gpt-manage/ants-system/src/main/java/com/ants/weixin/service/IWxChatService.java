package com.ants.weixin.service;

import java.util.List;
import com.ants.weixin.domain.WxChat;

/**
 * 微信聊天Service接口
 * 
 * @author ants
 * @date 2023-03-05
 */
public interface IWxChatService 
{
    /**
     * 查询微信聊天
     * 
     * @param id 微信聊天ID
     * @return 微信聊天
     */
    public WxChat selectWxChatById(Long id);

    /**
     * 查询微信聊天列表
     * 
     * @param wxChat 微信聊天
     * @return 微信聊天集合
     */
    public List<WxChat> selectWxChatList(WxChat wxChat);

    /**
     * 查询微信聊天记录
     *
     * @param openid openid
     * @param limit 条数
     * @return 微信条件
     */
    public List<WxChat> selectWxChatToWx(String openid, Integer limit);

    /**
     * 新增微信聊天
     * 
     * @param wxChat 微信聊天
     * @return 结果
     */
    public int insertWxChat(WxChat wxChat);

    /**
     * 修改微信聊天
     * 
     * @param wxChat 微信聊天
     * @return 结果
     */
    public int updateWxChat(WxChat wxChat);

    /**
     * 批量删除微信聊天
     * 
     * @param ids 需要删除的微信聊天ID
     * @return 结果
     */
    public int deleteWxChatByIds(Long[] ids);

    /**
     * 删除微信聊天信息
     * 
     * @param id 微信聊天ID
     * @return 结果
     */
    public int deleteWxChatById(Long id);

    /**
     * 查询某个用户的对话数
     *
     * @param openid
     * @return
     */
    public int queryChatCount(String openid);

    /**
     * 查询某个用户当天的对话数
     *
     * @param openid
     * @return
     */
    public int queryChatCountToday(String openid);

    /**
     * 通过openid查询最近一条的消息记录
     *
     * @param openid openid
     * @return 最近一条消息记录
     */
    public WxChat queryChatStatus(String openid);

    /**
     * 查询30分钟外错误的聊天记录
     *
     * @return 聊天记录
     */
    public List<WxChat> queryErrorChats();
}
