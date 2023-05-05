package com.ants.common.exception.user;

import com.ants.common.exception.BaseException;

/**
 * 类描述 微信异常处理
 *
 * @author ants
 * @date 2022/10/27 23:11
 */
public class WxException extends BaseException {

    public WxException(String module, String code, Object[] args, String defaultMessage) {
        super(module, code, args, defaultMessage);
    }

    public WxException(String module, String code, Object[] args) {
        super(module, code, args);
    }

    public WxException(String module, String defaultMessage) {
        super(module, defaultMessage);
    }

    public WxException(String code, Object[] args) {
        super(code, args);
    }

    public WxException(String defaultMessage) {
        super(defaultMessage);
    }
}
