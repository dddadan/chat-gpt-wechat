package com.ants.weixin.service;

public interface IWxCommonService {

    /**
     * 校验
     *
     * @param openid
     * @param content
     * @return
     */
    public boolean msgSecCheck(String openid, String content);
}
