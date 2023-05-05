package com.ants.weixin.domain;

import com.ants.common.annotation.Excel;
import com.ants.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 微信聊天对象 wx_chat
 * 
 * @author ants
 * @date 2023-03-05
 */
public class WxChat extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 用户id */
    @Excel(name = "openid")
    private String openid;

    /** 角色 */
    @Excel(name = "角色")
    private String role;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 是否报错 */
    @Excel(name = "是否报错")
    private Long errorFlag;

    /** 耗时 */
    @Excel(name = "耗时")
    private Long duration;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOpenid(String openid)
    {
        this.openid = openid;
    }

    public String getOpenid()
    {
        return openid;
    }
    public void setRole(String role) 
    {
        this.role = role;
    }

    public String getRole() 
    {
        return role;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setErrorFlag(Long errorFlag) 
    {
        this.errorFlag = errorFlag;
    }

    public Long getErrorFlag() 
    {
        return errorFlag;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("openid", getOpenid())
            .append("role", getRole())
            .append("content", getContent())
            .append("errorFlag", getErrorFlag())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
