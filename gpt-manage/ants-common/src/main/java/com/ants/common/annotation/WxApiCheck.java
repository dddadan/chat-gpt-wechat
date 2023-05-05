package com.ants.common.annotation;

import com.ants.common.enums.BusinessType;
import com.ants.common.enums.OperatorType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 * 
 * @author ants
 *
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WxApiCheck
{

}
