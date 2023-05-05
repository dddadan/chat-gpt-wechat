package com.ants.search.domain;

import com.ants.common.annotation.Excel;
import com.ants.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;

/**
 * 考试题目对象 ants_exam
 * 
 * @author ants
 * @date 2023-01-08
 */
public class AntsExam extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long examId;

    /** 题目 */
    @Excel(name = "题目")
    private String examTitle;

    /** 题目内容 */
    @Excel(name = "题目内容")
    private String examTitleContent;

    /** 题目内容类型（1富文本题型，2代码题型，3富文本代码题型） */
    @Excel(name = "题目内容类型", readConverterExp = "1=富文本题型，2代码题型，3富文本代码题型")
    private String examContentType;

    /** 类型（1单选，2多选，3判断） */
    @Excel(name = "类型", readConverterExp = "1=单选，2多选，3判断")
    private String examType;

    /** 题目排序 */
    @Excel(name = "题目排序")
    private Integer examIndex;

    /** 题目解析 */
    @Excel(name = "题目解析")
    private String examAnalysis;

    /** 答错率 */
    @Excel(name = "答错率")
    private Integer examErrorRate;

    private List<AntsExamOption> antsExamOptions;

    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setExamTitle(String examTitle) 
    {
        this.examTitle = examTitle;
    }

    public String getExamTitle() 
    {
        return examTitle;
    }
    public void setExamTitleContent(String examTitleContent) 
    {
        this.examTitleContent = examTitleContent;
    }

    public String getExamTitleContent() 
    {
        return examTitleContent;
    }
    public void setExamContentType(String examContentType)
    {
        this.examContentType = examContentType;
    }

    public String getExamContentType()
    {
        return examContentType;
    }
    public void setExamType(String examType)
    {
        this.examType = examType;
    }

    public String getExamType()
    {
        return examType;
    }
    public void setExamIndex(Integer examIndex)
    {
        this.examIndex = examIndex;
    }

    public Integer getExamIndex() 
    {
        return examIndex;
    }
    public void setExamAnalysis(String examAnalysis) 
    {
        this.examAnalysis = examAnalysis;
    }

    public String getExamAnalysis() 
    {
        return examAnalysis;
    }
    public void setExamErrorRate(Integer examErrorRate) 
    {
        this.examErrorRate = examErrorRate;
    }

    public Integer getExamErrorRate() 
    {
        return examErrorRate;
    }

    public List<AntsExamOption> getAntsExamOptions() {
        return antsExamOptions;
    }

    public void setAntsExamOptions(List<AntsExamOption> antsExamOptions) {
        this.antsExamOptions = antsExamOptions;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("examId", getExamId())
            .append("examTitle", getExamTitle())
            .append("examTitleContent", getExamTitleContent())
            .append("examContentType", getExamContentType())
            .append("examType", getExamType())
            .append("examIndex", getExamIndex())
            .append("examAnalysis", getExamAnalysis())
            .append("examErrorRate", getExamErrorRate())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
