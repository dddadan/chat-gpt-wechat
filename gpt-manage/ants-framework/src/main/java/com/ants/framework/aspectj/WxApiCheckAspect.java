package com.ants.framework.aspectj;

import com.ants.common.annotation.WxApiCheck;
import com.ants.common.utils.token.JWTUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;

import static com.ants.common.constant.Constants.AUTHORIZATION_TOKEN;

/**
 * 对外接口验证处理
 * 
 * @author ants
 */
@Aspect
@Component
public class WxApiCheckAspect
{
    private static final Logger log = LoggerFactory.getLogger(WxApiCheckAspect.class);

    // 配置织入点
    @Pointcut("@annotation(com.ants.common.annotation.WxApiCheck)")
    public void wxApiCheckPointCut()
    {
    }

    /**
     * 方法开始前校验当前用户
     */
    @Before(value = "wxApiCheckPointCut()")
    public void doBefore() {

    }

    @Around("@annotation(wxApiCheck)")
    public Object around(ProceedingJoinPoint proceedingJoinPoint, WxApiCheck wxApiCheck) throws Throwable {
        // 获取当前请求头
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        // 获取token
        String token = request.getHeader(AUTHORIZATION_TOKEN);
        // 解析openid
        String openid = JWTUtils.getOpenidByJWT(token);
        //方法入参
        Object inParam = proceedingJoinPoint.getArgs()[0];
        //反射获取入参bean的字段
        Field field = inParam.getClass().getDeclaredField("openid");
        field.setAccessible(true);
        //设置值
        field.set(inParam, openid);
        //继续调用方法本体执行
        return proceedingJoinPoint.proceed();
    }
}
