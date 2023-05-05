package com.ants.weixin.domain.dto;

import org.springframework.stereotype.Component;

/**
 * 类描述
 *
 * @author ants
 * @date 2022/10/29 0:53
 */
@Component
public class WxApiCheckDTO {

    /** openid */
    private String openid;

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }
}
