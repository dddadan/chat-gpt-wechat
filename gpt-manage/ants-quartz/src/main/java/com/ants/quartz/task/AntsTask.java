package com.ants.quartz.task;

import com.alibaba.fastjson.JSON;
import com.ants.common.core.redis.RedisCache;
import com.ants.weixin.domain.WxChat;
import com.ants.weixin.service.IWxChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ants.common.utils.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 定时任务调度测试
 *
 * @author ants
 */
@Component("antsTask")
public class AntsTask {

    private static final Logger logger = LoggerFactory.getLogger(AntsTask.class);

    @Autowired
    private IWxChatService wxChatService;

    public void antsNoParams() {
        List<WxChat> wxChats = wxChatService.queryErrorChats();
        for (WxChat updateWxChat : wxChats) {
            Map<String, Object> res = new HashMap<>();
            // 循环处理每一个对话
            updateWxChat.setErrorFlag(1L);
            wxChatService.updateWxChat(updateWxChat);
            WxChat insertWxChat = new WxChat();
            insertWxChat.setOpenid(updateWxChat.getOpenid());
            insertWxChat.setRole("assistant");
            insertWxChat.setContent("消息未发送成功");
            insertWxChat.setCreateTime(new Date());
            wxChatService.insertWxChat(insertWxChat);
            res.put("insert", insertWxChat);
            res.put("update", updateWxChat);
        }
    }

    public void antsParams(String params) {

    }

    public void antsMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
    }
}
