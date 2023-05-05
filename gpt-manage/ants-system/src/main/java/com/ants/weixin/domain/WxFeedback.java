package com.ants.weixin.domain;

import com.ants.common.annotation.Excel;
import com.ants.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 反馈管理对象 wx_feedback
 * 
 * @author ants
 * @date 2023-03-13
 */
public class WxFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** openid */
    @Excel(name = "openid")
    private String openid;

    /** 反馈内容 */
    @Excel(name = "反馈内容")
    private String feedback;

    /** 角色 */
    @Excel(name = "角色")
    private String role;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String contact;

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
    public void setFeedback(String feedback) 
    {
        this.feedback = feedback;
    }

    public String getFeedback() 
    {
        return feedback;
    }
    public void setContact(String contact) 
    {
        this.contact = contact;
    }

    public String getContact() 
    {
        return contact;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("openid", getOpenid())
            .append("feedback", getFeedback())
            .append("role", getRole())
            .append("contact", getContact())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
