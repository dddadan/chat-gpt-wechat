package com.ants.weixin.domain.dto;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class WxTopicDTO {

    /** 主键 */
    private Long topicId;

    /** 主题名称 */
    private String topicName;

    /** 主题标签 */
    private String topicTag;

    /** 主题排序 */
    private Long topicIndex;

    /** 主题卡片 */
    private String topicImage;

    /** 题目数量 */
    private Integer subjectNumber;

    /** 题目学习数量 */
    private Integer subjectStudyNumber;

    /** 最后一次学习时间 */
    private Date subjectStudyDate;

    /** 题目总数量 */
    private Integer totalCount;

    /** 学习数量 */
    private Integer studyCount;

    /** 完成学习率 */
    private Integer studyRate;

    /** 最后学习时间 */
    private Date lastStudyTime;

    /** 最后学习时间 */
    private String lastStudyTimeStr;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getStudyCount() {
        return studyCount;
    }

    public void setStudyCount(Integer studyCount) {
        this.studyCount = studyCount;
    }

    public Integer getStudyRate() {
        return studyRate;
    }

    public void setStudyRate(Integer studyRate) {
        this.studyRate = studyRate;
    }

    public Date getLastStudyTime() {
        return lastStudyTime;
    }

    public void setLastStudyTime(Date lastStudyTime) {
        this.lastStudyTime = lastStudyTime;
    }

    public String getLastStudyTimeStr() {
        return lastStudyTimeStr;
    }

    public void setLastStudyTimeStr(String lastStudyTimeStr) {
        this.lastStudyTimeStr = lastStudyTimeStr;
    }

    public Long getTopicId() {
        return topicId;
    }

    public void setTopicId(Long topicId) {
        this.topicId = topicId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getTopicTag() {
        return topicTag;
    }

    public void setTopicTag(String topicTag) {
        this.topicTag = topicTag;
    }

    public Long getTopicIndex() {
        return topicIndex;
    }

    public void setTopicIndex(Long topicIndex) {
        this.topicIndex = topicIndex;
    }

    public String getTopicImage() {
        return topicImage;
    }

    public void setTopicImage(String topicImage) {
        this.topicImage = topicImage;
    }

    public Integer getSubjectNumber() {
        return subjectNumber;
    }

    public void setSubjectNumber(Integer subjectNumber) {
        this.subjectNumber = subjectNumber;
    }

    public Integer getSubjectStudyNumber() {
        return subjectStudyNumber;
    }

    public void setSubjectStudyNumber(Integer subjectStudyNumber) {
        this.subjectStudyNumber = subjectStudyNumber;
    }

    public Date getSubjectStudyDate() {
        return subjectStudyDate;
    }

    public void setSubjectStudyDate(Date subjectStudyDate) {
        this.subjectStudyDate = subjectStudyDate;
    }
}
