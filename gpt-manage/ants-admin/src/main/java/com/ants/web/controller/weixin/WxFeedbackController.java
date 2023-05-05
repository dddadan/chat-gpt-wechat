package com.ants.web.controller.weixin;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ants.common.annotation.Log;
import com.ants.common.core.controller.BaseController;
import com.ants.common.core.domain.AjaxResult;
import com.ants.common.enums.BusinessType;
import com.ants.weixin.domain.WxFeedback;
import com.ants.weixin.service.IWxFeedbackService;
import com.ants.common.utils.poi.ExcelUtil;
import com.ants.common.core.page.TableDataInfo;

/**
 * 反馈管理Controller
 * 
 * @author ants
 * @date 2023-03-13
 */
@RestController
@RequestMapping("/weixin/feedback")
public class WxFeedbackController extends BaseController
{
    @Autowired
    private IWxFeedbackService wxFeedbackService;

    /**
     * 查询反馈管理列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxFeedback wxFeedback)
    {
        startPage();
        List<WxFeedback> list = wxFeedbackService.selectWxFeedbackList(wxFeedback);
        return getDataTable(list);
    }

    /**
     * 导出反馈管理列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:export')")
    @Log(title = "反馈管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WxFeedback wxFeedback)
    {
        List<WxFeedback> list = wxFeedbackService.selectWxFeedbackList(wxFeedback);
        ExcelUtil<WxFeedback> util = new ExcelUtil<WxFeedback>(WxFeedback.class);
        return util.exportExcel(list, "feedback");
    }

    /**
     * 获取反馈管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(wxFeedbackService.selectWxFeedbackById(id));
    }

    /**
     * 新增反馈管理
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:add')")
    @Log(title = "反馈管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxFeedback wxFeedback)
    {
        return toAjax(wxFeedbackService.insertWxFeedback(wxFeedback));
    }

    /**
     * 修改反馈管理
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:edit')")
    @Log(title = "反馈管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxFeedback wxFeedback)
    {
        return toAjax(wxFeedbackService.updateWxFeedback(wxFeedback));
    }

    /**
     * 删除反馈管理
     */
    @PreAuthorize("@ss.hasPermi('weixin:feedback:remove')")
    @Log(title = "反馈管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxFeedbackService.deleteWxFeedbackByIds(ids));
    }
}
