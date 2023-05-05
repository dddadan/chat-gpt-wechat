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
import com.ants.weixin.domain.WxChat;
import com.ants.weixin.service.IWxChatService;
import com.ants.common.utils.poi.ExcelUtil;
import com.ants.common.core.page.TableDataInfo;

/**
 * 微信聊天Controller
 * 
 * @author ants
 * @date 2023-03-05
 */
@RestController
@RequestMapping("/weixin/chat")
public class WxChatController extends BaseController
{
    @Autowired
    private IWxChatService wxChatService;

    /**
     * 查询微信聊天列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxChat wxChat)
    {
        startPage();
        List<WxChat> list = wxChatService.selectWxChatList(wxChat);
        return getDataTable(list);
    }

    /**
     * 导出微信聊天列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:export')")
    @Log(title = "微信聊天", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WxChat wxChat)
    {
        List<WxChat> list = wxChatService.selectWxChatList(wxChat);
        ExcelUtil<WxChat> util = new ExcelUtil<WxChat>(WxChat.class);
        return util.exportExcel(list, "chat");
    }

    /**
     * 获取微信聊天详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(wxChatService.selectWxChatById(id));
    }

    /**
     * 新增微信聊天
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:add')")
    @Log(title = "微信聊天", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxChat wxChat)
    {
        return toAjax(wxChatService.insertWxChat(wxChat));
    }

    /**
     * 修改微信聊天
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:edit')")
    @Log(title = "微信聊天", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxChat wxChat)
    {
        return toAjax(wxChatService.updateWxChat(wxChat));
    }

    /**
     * 删除微信聊天
     */
    @PreAuthorize("@ss.hasPermi('weixin:chat:remove')")
    @Log(title = "微信聊天", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxChatService.deleteWxChatByIds(ids));
    }
}
