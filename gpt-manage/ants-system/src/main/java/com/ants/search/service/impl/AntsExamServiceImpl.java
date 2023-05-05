package com.ants.search.service.impl;

import java.util.List;
import com.ants.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ants.search.mapper.AntsExamMapper;
import com.ants.search.domain.AntsExam;
import com.ants.search.service.IAntsExamService;

/**
 * 考试题目Service业务层处理
 * 
 * @author ants
 * @date 2023-01-08
 */
@Service
public class AntsExamServiceImpl implements IAntsExamService 
{
    @Autowired
    private AntsExamMapper antsExamMapper;

    /**
     * 查询考试题目
     * 
     * @param examId 考试题目ID
     * @return 考试题目
     */
    @Override
    public AntsExam selectAntsExamById(Long examId)
    {
        return antsExamMapper.selectAntsExamById(examId);
    }

    /**
     * 查询考试题目列表
     * 
     * @param antsExam 考试题目
     * @return 考试题目
     */
    @Override
    public List<AntsExam> selectAntsExamList(AntsExam antsExam)
    {
        return antsExamMapper.selectAntsExamList(antsExam);
    }

    /**
     * 新增考试题目
     * 
     * @param antsExam 考试题目
     * @return 结果
     */
    @Override
    public int insertAntsExam(AntsExam antsExam)
    {
        antsExam.setCreateTime(DateUtils.getNowDate());
        return antsExamMapper.insertAntsExam(antsExam);
    }

    /**
     * 修改考试题目
     * 
     * @param antsExam 考试题目
     * @return 结果
     */
    @Override
    public int updateAntsExam(AntsExam antsExam)
    {
        antsExam.setUpdateTime(DateUtils.getNowDate());
        return antsExamMapper.updateAntsExam(antsExam);
    }

    /**
     * 批量删除考试题目
     * 
     * @param examIds 需要删除的考试题目ID
     * @return 结果
     */
    @Override
    public int deleteAntsExamByIds(Long[] examIds)
    {
        return antsExamMapper.deleteAntsExamByIds(examIds);
    }

    /**
     * 删除考试题目信息
     * 
     * @param examId 考试题目ID
     * @return 结果
     */
    @Override
    public int deleteAntsExamById(Long examId)
    {
        return antsExamMapper.deleteAntsExamById(examId);
    }
}
