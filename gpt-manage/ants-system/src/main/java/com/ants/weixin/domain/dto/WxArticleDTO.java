package com.ants.weixin.domain.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 类描述
 *
 * @author ants
 * @date 2022/11/5 21:15
 */
public class WxArticleDTO {

    /**
     * 主键
     */
    private Long id;

    /**
     * 文章标题
     */
    private String articleTitle;

    /**
     * 文章内容
     */
    private String articleContent;

    /**
     * 文章图片
     */
    private String articleImage;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 点赞数量
     */
    private Integer starCount;

    /**
     * 收藏
     */
    private Integer collectCount;

    /**
     * 阅读总数量
     */
    private Integer studyTotalCount;

    /**
     * 阅读总数量
     */
    private Integer starTotalCount;

    /**
     * 阅读总数量
     */
    private Integer collectTotalCount;

    /**
     * 是否点赞
     */
    private boolean starFlag;

    /**
     * 是否收藏
     */
    private boolean collectFlag;

    /**
     * openid
     */
    private String openid;

    /**
     * 是否收藏
     */
    private Long startIndex;

    /**
     * 是否收藏
     */
    private Long endIndex;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Integer getStarCount() {
        return starCount;
    }

    public void setStarCount(Integer starCount) {
        this.starCount = starCount;
    }

    public Integer getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(Integer collectCount) {
        this.collectCount = collectCount;
    }

    public String getArticleImage() {
        return articleImage;
    }

    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStudyTotalCount() {
        return studyTotalCount;
    }

    public void setStudyTotalCount(Integer studyTotalCount) {
        this.studyTotalCount = studyTotalCount;
    }

    public Integer getStarTotalCount() {
        return starTotalCount;
    }

    public void setStarTotalCount(Integer starTotalCount) {
        this.starTotalCount = starTotalCount;
    }

    public Integer getCollectTotalCount() {
        return collectTotalCount;
    }

    public void setCollectTotalCount(Integer collectTotalCount) {
        this.collectTotalCount = collectTotalCount;
    }

    public boolean isStarFlag() {
        return starFlag;
    }

    public void setStarFlag(boolean starFlag) {
        this.starFlag = starFlag;
    }

    public boolean isCollectFlag() {
        return collectFlag;
    }

    public void setCollectFlag(boolean collectFlag) {
        this.collectFlag = collectFlag;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public Long getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Long startIndex) {
        this.startIndex = startIndex;
    }

    public Long getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(Long endIndex) {
        this.endIndex = endIndex;
    }
}
