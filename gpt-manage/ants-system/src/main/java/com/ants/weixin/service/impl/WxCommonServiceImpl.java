package com.ants.weixin.service.impl;

import com.alibaba.fastjson.JSON;
import com.ants.common.constant.Constants;
import com.ants.common.core.redis.RedisCache;
import com.ants.common.utils.object.ObjectUtil;
import com.ants.common.utils.wx.WxUtil;
import com.ants.weixin.service.IWxCommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 微信通用接口
 *
 * @author ants
 * @date 2022/11/28 0:27
 */
@Service
public class WxCommonServiceImpl implements IWxCommonService {

    private static final Logger logger = LoggerFactory.getLogger(WxCommonServiceImpl.class);

    @Value("${wx.app.id}")
    private String appid;

    @Value("${wx.app.secret}")
    private String appsecret;

    @Autowired
    private RedisCache redisCache;

    @Override
    public boolean msgSecCheck(String openid, String content) {
        String key = "access_token." + openid;
        Object accessTokenObj = redisCache.getCacheObject(key);
        if(ObjectUtil.isEmpty(accessTokenObj)) {
            Map<String, Object> data = WxUtil.getAccessToken(appid, appsecret);
            if(!CollectionUtils.isEmpty(data) && !ObjectUtil.isEmpty(data.get("access_token"))) {
                logger.info("[msgSecCheck] get access_token by url, result is {}", JSON.toJSONString(data));
                accessTokenObj = data.get("access_token");
                // 存储
                redisCache.setCacheObject(key, accessTokenObj,  120, TimeUnit.MINUTES);
            } else {
                return false;
            }
        } else {
            logger.info("[msgSecCheck] get access_token by redis, result is {}", accessTokenObj);
        }
        // 通过access_token判断字符是否合法
        Map<String, Object> data = WxUtil.msgSecCheck(String.valueOf(accessTokenObj), content, openid);
        logger.info("[msgSecCheck] this msg sec check is {}", JSON.toJSONString(data));
        if(data.containsKey("errcode") && Constants.ZORE.equals(String.valueOf(data.get("errcode")))){
            String result = JSON.toJSONString(data);
            if(result.contains("\"label\":100")) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
