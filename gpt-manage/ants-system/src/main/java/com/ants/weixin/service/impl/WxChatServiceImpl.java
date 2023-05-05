package com.ants.weixin.service.impl;

import java.util.List;
import com.ants.common.utils.DateUtils;
import com.ants.common.utils.object.ObjectUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ants.weixin.mapper.WxChatMapper;
import com.ants.weixin.domain.WxChat;
import com.ants.weixin.service.IWxChatService;

/**
 * 微信聊天Service业务层处理
 * 
 * @author ants
 * @date 2023-03-05
 */
@Service
public class WxChatServiceImpl implements IWxChatService
{
    @Autowired
    private WxChatMapper wxChatMapper;

    /**
     * 查询微信聊天
     * 
     * @param id 微信聊天ID
     * @return 微信聊天
     */
    @Override
    public WxChat selectWxChatById(Long id)
    {
        return wxChatMapper.selectWxChatById(id);
    }

    /**
     * 查询微信聊天列表
     * 
     * @param wxChat 微信聊天
     * @return 微信聊天
     */
    @Override
    public List<WxChat> selectWxChatList(WxChat wxChat)
    {
        return wxChatMapper.selectWxChatList(wxChat);
    }

    @Override
    public List<WxChat> selectWxChatToWx(String openid, Integer limit) {
        return wxChatMapper.selectWxChatToWx(openid, limit);
    }

    /**
     * 新增微信聊天
     * 
     * @param wxChat 微信聊天
     * @return 结果
     */
    @Override
    public int insertWxChat(WxChat wxChat)
    {
        return wxChatMapper.insertWxChat(wxChat);
    }

    /**
     * 修改微信聊天
     * 
     * @param wxChat 微信聊天
     * @return 结果
     */
    @Override
    public int updateWxChat(WxChat wxChat)
    {
        wxChat.setUpdateTime(DateUtils.getNowDate());
        return wxChatMapper.updateWxChat(wxChat);
    }

    /**
     * 批量删除微信聊天
     * 
     * @param ids 需要删除的微信聊天ID
     * @return 结果
     */
    @Override
    public int deleteWxChatByIds(Long[] ids)
    {
        return wxChatMapper.deleteWxChatByIds(ids);
    }

    /**
     * 删除微信聊天信息
     * 
     * @param id 微信聊天ID
     * @return 结果
     */
    @Override
    public int deleteWxChatById(Long id)
    {
        return wxChatMapper.deleteWxChatById(id);
    }

    /**
     * 查询某个用户的对话数
     *
     * @param openid
     * @return
     */
    @Override
    public int queryChatCount(String openid) {
        return wxChatMapper.queryChatCount(openid);
    }

    /**
     * 查询某个用户当天的对话数
     *
     * @param openid
     * @return
     */
    @Override
    public int queryChatCountToday(String openid) {
        return wxChatMapper.queryChatCountToday(openid);
    }

    /**
     * 通过openid查询最近一条的消息记录
     *
     * @param openid openid
     * @return 最近一条消息记录
     */
    @Override
    public WxChat queryChatStatus(String openid) {
        return wxChatMapper.queryChatStatus(openid);
    }

    /**
     * 查询30分钟外错误的聊天记录
     *
     * @return 聊天记录
     */
    @Override
    public List<WxChat> queryErrorChats() {
        return wxChatMapper.queryErrorChats();
    }
}
