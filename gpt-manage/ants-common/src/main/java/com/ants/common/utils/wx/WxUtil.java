package com.ants.common.utils.wx;

import com.ants.common.constant.Constants;
import com.ants.common.utils.http.HttpUtil;
import com.ants.common.utils.http.HttpUtils;
import com.ants.common.utils.json.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

public class WxUtil {

    private static final Logger logger = LoggerFactory.getLogger(WxUtil.class);

    /**
     * 通过微信接口请求数据
     *
     * @param appid     微信小程序appid
     * @param appsecret 微信小程序appsecret
     * @return 结果集
     */
    public static Map<String, Object> getJscode2session(String appid, String appsecret, String code) {
        String url = Constants.WX_AUTH_CODE2_SESSION_URL;
        String params = "appid=" + appid + "&secret=" + appsecret + "&js_code=" + code + "&grant_type=authorization_code";
        String result = HttpUtils.sendGet(url, params);
        logger.info("[getJscode2session] this result is {}", result);
        return JsonUtil.stringToMap(result);
    }

    /**
     * 通过微信接口请求access_token
     *
     * @param appid     微信小程序appid
     * @param appsecret 微信小程序appsecret
     * @return 结果集
     */
    public static Map<String, Object> getAccessToken(String appid, String appsecret) {
        String url = Constants.WX_GET_ACCESS_TOKEN_URL;
        String params = "appid=" + appid + "&secret=" + appsecret + "&grant_type=client_credential";
        String result = HttpUtils.sendGet(url, params);
        logger.info("[getAccessToken] this result is {}", result);
        return JsonUtil.stringToMap(result);
    }

    /**
     * 通过微信接口请求文本安全
     *
     * @param access_token accesstoken
     * @param content 文本
     * @param openid openid
     * @return 结果集
     */
    public static Map<String, Object> msgSecCheck(String access_token, String content, String openid) {
        String url = Constants.WX_MSG_SEC_CHECK_URL + "?access_token=" + access_token;
        String params = "{\"content\":\"" + content + "\",\"openid\":\"" + openid + "\",\"version\":2,\"scene\":1}";
        logger.info("[msgSecCheck] this params json is {}", params);
        String result = HttpUtil.postJson(url, params);
        logger.info("[msgSecCheck] this result is {}", result);
        return JsonUtil.stringToMap(result);
    }
}
