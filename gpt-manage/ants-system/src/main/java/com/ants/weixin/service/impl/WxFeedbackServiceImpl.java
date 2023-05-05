package com.ants.weixin.service.impl;

import java.util.List;
import com.ants.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ants.weixin.mapper.WxFeedbackMapper;
import com.ants.weixin.domain.WxFeedback;
import com.ants.weixin.service.IWxFeedbackService;

/**
 * 反馈管理Service业务层处理
 * 
 * @author ants
 * @date 2023-03-13
 */
@Service
public class WxFeedbackServiceImpl implements IWxFeedbackService 
{
    @Autowired
    private WxFeedbackMapper wxFeedbackMapper;

    /**
     * 查询反馈管理
     * 
     * @param id 反馈管理ID
     * @return 反馈管理
     */
    @Override
    public WxFeedback selectWxFeedbackById(Long id)
    {
        return wxFeedbackMapper.selectWxFeedbackById(id);
    }

    /**
     * 查询反馈管理列表
     * 
     * @param wxFeedback 反馈管理
     * @return 反馈管理
     */
    @Override
    public List<WxFeedback> selectWxFeedbackList(WxFeedback wxFeedback)
    {
        return wxFeedbackMapper.selectWxFeedbackList(wxFeedback);
    }

    /**
     * 查询反馈管理列表,限制10条
     *
     * @param wxFeedback 反馈管理
     * @return 反馈管理集合
     */
    @Override
    public List<WxFeedback> selectWxFeedbackListLimit10(WxFeedback wxFeedback) {
        return wxFeedbackMapper.selectWxFeedbackListLimit10(wxFeedback);
    }

    /**
     * 新增反馈管理
     * 
     * @param wxFeedback 反馈管理
     * @return 结果
     */
    @Override
    public int insertWxFeedback(WxFeedback wxFeedback)
    {
        wxFeedback.setCreateTime(DateUtils.getNowDate());
        return wxFeedbackMapper.insertWxFeedback(wxFeedback);
    }

    /**
     * 修改反馈管理
     * 
     * @param wxFeedback 反馈管理
     * @return 结果
     */
    @Override
    public int updateWxFeedback(WxFeedback wxFeedback)
    {
        wxFeedback.setUpdateTime(DateUtils.getNowDate());
        return wxFeedbackMapper.updateWxFeedback(wxFeedback);
    }

    /**
     * 批量删除反馈管理
     * 
     * @param ids 需要删除的反馈管理ID
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackByIds(Long[] ids)
    {
        return wxFeedbackMapper.deleteWxFeedbackByIds(ids);
    }

    /**
     * 删除反馈管理信息
     * 
     * @param id 反馈管理ID
     * @return 结果
     */
    @Override
    public int deleteWxFeedbackById(Long id)
    {
        return wxFeedbackMapper.deleteWxFeedbackById(id);
    }
}
