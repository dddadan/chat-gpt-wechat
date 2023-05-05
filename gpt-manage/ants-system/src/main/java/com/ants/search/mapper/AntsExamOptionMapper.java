package com.ants.search.mapper;

import java.util.List;
import com.ants.search.domain.AntsExamOption;

/**
 * 题目选项Mapper接口
 * 
 * @author ants
 * @date 2023-01-08
 */
public interface AntsExamOptionMapper 
{
    /**
     * 查询题目选项
     * 
     * @param optionId 题目选项ID
     * @return 题目选项
     */
    public AntsExamOption selectAntsExamOptionById(Long optionId);

    /**
     * 查询题目选项列表
     * 
     * @param antsExamOption 题目选项
     * @return 题目选项集合
     */
    public List<AntsExamOption> selectAntsExamOptionList(AntsExamOption antsExamOption);

    /**
     * 新增题目选项
     * 
     * @param antsExamOption 题目选项
     * @return 结果
     */
    public int insertAntsExamOption(AntsExamOption antsExamOption);

    /**
     * 修改题目选项
     * 
     * @param antsExamOption 题目选项
     * @return 结果
     */
    public int updateAntsExamOption(AntsExamOption antsExamOption);

    /**
     * 删除题目选项
     * 
     * @param optionId 题目选项ID
     * @return 结果
     */
    public int deleteAntsExamOptionById(Long optionId);

    /**
     * 批量删除题目选项
     * 
     * @param optionIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteAntsExamOptionByIds(Long[] optionIds);
}
