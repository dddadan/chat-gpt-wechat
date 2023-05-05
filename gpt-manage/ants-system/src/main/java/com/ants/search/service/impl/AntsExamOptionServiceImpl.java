package com.ants.search.service.impl;

import java.util.List;
import com.ants.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ants.search.mapper.AntsExamOptionMapper;
import com.ants.search.domain.AntsExamOption;
import com.ants.search.service.IAntsExamOptionService;

/**
 * 题目选项Service业务层处理
 * 
 * @author ants
 * @date 2023-01-08
 */
@Service
public class AntsExamOptionServiceImpl implements IAntsExamOptionService 
{
    @Autowired
    private AntsExamOptionMapper antsExamOptionMapper;

    /**
     * 查询题目选项
     * 
     * @param optionId 题目选项ID
     * @return 题目选项
     */
    @Override
    public AntsExamOption selectAntsExamOptionById(Long optionId)
    {
        return antsExamOptionMapper.selectAntsExamOptionById(optionId);
    }

    /**
     * 查询题目选项列表
     * 
     * @param antsExamOption 题目选项
     * @return 题目选项
     */
    @Override
    public List<AntsExamOption> selectAntsExamOptionList(AntsExamOption antsExamOption)
    {
        return antsExamOptionMapper.selectAntsExamOptionList(antsExamOption);
    }

    /**
     * 新增题目选项
     * 
     * @param antsExamOption 题目选项
     * @return 结果
     */
    @Override
    public int insertAntsExamOption(AntsExamOption antsExamOption)
    {
        antsExamOption.setCreateTime(DateUtils.getNowDate());
        return antsExamOptionMapper.insertAntsExamOption(antsExamOption);
    }

    /**
     * 修改题目选项
     * 
     * @param antsExamOption 题目选项
     * @return 结果
     */
    @Override
    public int updateAntsExamOption(AntsExamOption antsExamOption)
    {
        antsExamOption.setUpdateTime(DateUtils.getNowDate());
        return antsExamOptionMapper.updateAntsExamOption(antsExamOption);
    }

    /**
     * 批量删除题目选项
     * 
     * @param optionIds 需要删除的题目选项ID
     * @return 结果
     */
    @Override
    public int deleteAntsExamOptionByIds(Long[] optionIds)
    {
        return antsExamOptionMapper.deleteAntsExamOptionByIds(optionIds);
    }

    /**
     * 删除题目选项信息
     * 
     * @param optionId 题目选项ID
     * @return 结果
     */
    @Override
    public int deleteAntsExamOptionById(Long optionId)
    {
        return antsExamOptionMapper.deleteAntsExamOptionById(optionId);
    }
}
