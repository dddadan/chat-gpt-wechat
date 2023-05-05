package com.ants.search.service;

import java.util.List;
import com.ants.search.domain.AntsExam;

/**
 * 考试题目Service接口
 * 
 * @author ants
 * @date 2023-01-08
 */
public interface IAntsExamService 
{
    /**
     * 查询考试题目
     * 
     * @param examId 考试题目ID
     * @return 考试题目
     */
    public AntsExam selectAntsExamById(Long examId);

    /**
     * 查询考试题目列表
     * 
     * @param antsExam 考试题目
     * @return 考试题目集合
     */
    public List<AntsExam> selectAntsExamList(AntsExam antsExam);

    /**
     * 新增考试题目
     * 
     * @param antsExam 考试题目
     * @return 结果
     */
    public int insertAntsExam(AntsExam antsExam);

    /**
     * 修改考试题目
     * 
     * @param antsExam 考试题目
     * @return 结果
     */
    public int updateAntsExam(AntsExam antsExam);

    /**
     * 批量删除考试题目
     * 
     * @param examIds 需要删除的考试题目ID
     * @return 结果
     */
    public int deleteAntsExamByIds(Long[] examIds);

    /**
     * 删除考试题目信息
     * 
     * @param examId 考试题目ID
     * @return 结果
     */
    public int deleteAntsExamById(Long examId);
}
