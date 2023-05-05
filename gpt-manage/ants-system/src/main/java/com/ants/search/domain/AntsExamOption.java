package com.ants.search.domain;

import com.ants.common.annotation.Excel;
import com.ants.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 题目选项对象 ants_exam_option
 * 
 * @author ants
 * @date 2023-01-08
 */
public class AntsExamOption extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long optionId;

    /** 题目id */
    @Excel(name = "题目id")
    private Long examId;

    /** 选项标题 */
    @Excel(name = "选项标题")
    private String optionTitle;

    /** 选项内容 */
    @Excel(name = "选项内容")
    private String optionTitleContent;

    /** 选项内容类型（1基础题型，2富文本题型，3代码题型，4富文本代码题型） */
    @Excel(name = "选项内容类型", readConverterExp = "1=基础题型，2富文本题型，3代码题型，4富文本代码题型")
    private String optionContentType;

    /** 选项排序 */
    @Excel(name = "选项排序")
    private Integer optionIndex;

    /** 是否正确（1正确，2错误） */
    @Excel(name = "是否正确", readConverterExp = "1=正确，2错误")
    private String optionIsCorrect;

    public void setOptionId(Long optionId) 
    {
        this.optionId = optionId;
    }

    public Long getOptionId() 
    {
        return optionId;
    }
    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setOptionTitle(String optionTitle) 
    {
        this.optionTitle = optionTitle;
    }

    public String getOptionTitle() 
    {
        return optionTitle;
    }
    public void setOptionTitleContent(String optionTitleContent) 
    {
        this.optionTitleContent = optionTitleContent;
    }

    public String getOptionTitleContent() 
    {
        return optionTitleContent;
    }
    public void setOptionContentType(String optionContentType)
    {
        this.optionContentType = optionContentType;
    }

    public String getOptionContentType()
    {
        return optionContentType;
    }
    public void setOptionIndex(Integer optionIndex) 
    {
        this.optionIndex = optionIndex;
    }

    public Integer getOptionIndex() 
    {
        return optionIndex;
    }
    public void setOptionIsCorrect(String optionIsCorrect)
    {
        this.optionIsCorrect = optionIsCorrect;
    }

    public String getOptionIsCorrect()
    {
        return optionIsCorrect;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("optionId", getOptionId())
            .append("examId", getExamId())
            .append("optionTitle", getOptionTitle())
            .append("optionTitleContent", getOptionTitleContent())
            .append("optionContentType", getOptionContentType())
            .append("optionIndex", getOptionIndex())
            .append("optionIsCorrect", getOptionIsCorrect())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
