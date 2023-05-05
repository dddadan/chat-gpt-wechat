package com.ants.weixin.mapper;

import java.util.List;
import com.ants.weixin.domain.WxFeedback;

/**
 * 反馈管理Mapper接口
 * 
 * @author ants
 * @date 2023-03-13
 */
public interface WxFeedbackMapper 
{
    /**
     * 查询反馈管理
     * 
     * @param id 反馈管理ID
     * @return 反馈管理
     */
    public WxFeedback selectWxFeedbackById(Long id);

    /**
     * 查询反馈管理列表
     * 
     * @param wxFeedback 反馈管理
     * @return 反馈管理集合
     */
    public List<WxFeedback> selectWxFeedbackList(WxFeedback wxFeedback);

    /**
     * 查询反馈管理列表,限制10条
     *
     * @param wxFeedback 反馈管理
     * @return 反馈管理集合
     */
    public List<WxFeedback> selectWxFeedbackListLimit10(WxFeedback wxFeedback);

    /**
     * 新增反馈管理
     * 
     * @param wxFeedback 反馈管理
     * @return 结果
     */
    public int insertWxFeedback(WxFeedback wxFeedback);

    /**
     * 修改反馈管理
     * 
     * @param wxFeedback 反馈管理
     * @return 结果
     */
    public int updateWxFeedback(WxFeedback wxFeedback);

    /**
     * 删除反馈管理
     * 
     * @param id 反馈管理ID
     * @return 结果
     */
    public int deleteWxFeedbackById(Long id);

    /**
     * 批量删除反馈管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteWxFeedbackByIds(Long[] ids);
}
