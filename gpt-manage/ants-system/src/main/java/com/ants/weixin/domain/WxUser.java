package com.ants.weixin.domain;

import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ants.common.annotation.Excel;
import com.ants.common.core.domain.BaseEntity;

/**
 * 微信用户对象 wx_user
 *
 * @author ants
 * @date 2022-10-22
 */
public class WxUser extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * openid
     */
    private String openid;

    /**
     * 头像
     */
    @Excel(name = "头像")
    private String avatarUrl;

    /**
     * 昵称
     */
    @Excel(name = "昵称")
    private String nickName;

    /**
     * 性别
     */
    @Excel(name = "性别")
    private Integer gender;

    /**
     * 国家
     */
    @Excel(name = "国家")
    private String country;

    /**
     * 省份
     */
    @Excel(name = "省份")
    private String province;

    /**
     * 城市
     */
    @Excel(name = "城市")
    private String city;

    /**
     * 语言
     */
    @Excel(name = "语言")
    private String language;

    /**
     * 是否删除
     */
    @Excel(name = "是否删除")
    private Integer deleteFlag;

    /**
     * 是否禁用
     */
    @Excel(name = "是否禁用")
    private Integer disableFlag;

    /**
     * 最近更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最近更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastLoginTime;

    private String remark;

    @Override
    public String getRemark() {
        return remark;
    }

    @Override
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getOpenid() {
        return openid;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getGender() {
        return gender;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLanguage() {
        return language;
    }

    public void setDeleteFlag(Integer deleteFlag) {
        this.deleteFlag = deleteFlag;
    }

    public Integer getDeleteFlag() {
        return deleteFlag;
    }

    public void setDisableFlag(Integer disableFlag) {
        this.disableFlag = disableFlag;
    }

    public Integer getDisableFlag() {
        return disableFlag;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("openid", getOpenid())
                .append("avatarUrl", getAvatarUrl())
                .append("nickName", getNickName())
                .append("gender", getGender())
                .append("country", getCountry())
                .append("province", getProvince())
                .append("city", getCity())
                .append("language", getLanguage())
                .append("deleteFlag", getDeleteFlag())
                .append("disableFlag", getDisableFlag())
                .append("lastLoginTime", getLastLoginTime())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
