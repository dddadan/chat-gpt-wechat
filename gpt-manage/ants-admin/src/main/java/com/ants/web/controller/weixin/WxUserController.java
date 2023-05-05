package com.ants.web.controller.weixin;

import java.util.List;

import com.ants.common.base64.Base64Util;
import com.ants.common.utils.StringUtils;
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
import com.ants.weixin.domain.WxUser;
import com.ants.weixin.service.IWxUserService;
import com.ants.common.utils.poi.ExcelUtil;
import com.ants.common.core.page.TableDataInfo;

/**
 * 微信用户Controller
 * 
 * @author ants
 * @date 2022-10-22
 */
@RestController
@RequestMapping("/weixin/user")
public class WxUserController extends BaseController
{
    @Autowired
    private IWxUserService wxUserService;

    /**
     * 查询微信用户列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(WxUser wxUser)
    {
        wxUser.setNickName(Base64Util.textToBase64Str(wxUser.getNickName()));
        startPage();
        List<WxUser> list = wxUserService.selectWxUserList(wxUser);
        for (WxUser user : list) {
            if(StringUtils.isNotEmpty(user.getNickName())) {
                user.setNickName(Base64Util.base64StrToText(user.getNickName()));
            }
            if(StringUtils.isNotEmpty(user.getRemark())) {
                user.setRemark(Base64Util.base64StrToText(user.getRemark()));
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出微信用户列表
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:export')")
    @Log(title = "微信用户", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WxUser wxUser)
    {
        wxUser.setNickName(Base64Util.textToBase64Str(wxUser.getNickName()));
        List<WxUser> list = wxUserService.selectWxUserList(wxUser);
        for (WxUser user : list) {
            if(StringUtils.isNotEmpty(user.getNickName())) {
                user.setNickName(Base64Util.base64StrToText(user.getNickName()));
            }
            if(StringUtils.isNotEmpty(user.getRemark())) {
                user.setRemark(Base64Util.base64StrToText(user.getRemark()));
            }
        }
        ExcelUtil<WxUser> util = new ExcelUtil<WxUser>(WxUser.class);
        return util.exportExcel(list, "user");
    }

    /**
     * 获取微信用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        WxUser wxUser = wxUserService.selectWxUserById(id);
        if(StringUtils.isNotEmpty(wxUser.getNickName())) {
            wxUser.setNickName(Base64Util.base64StrToText(wxUser.getNickName()));
        }
        if(StringUtils.isNotEmpty(wxUser.getRemark())) {
            wxUser.setRemark(Base64Util.base64StrToText(wxUser.getRemark()));
        }
        return AjaxResult.success(wxUser);
    }

    /**
     * 新增微信用户
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:add')")
    @Log(title = "微信用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WxUser wxUser)
    {
        if(StringUtils.isNotEmpty(wxUser.getNickName())) {
            wxUser.setNickName(Base64Util.textToBase64Str(wxUser.getNickName()));
        }
        if(StringUtils.isNotEmpty(wxUser.getRemark())) {
            wxUser.setRemark(Base64Util.textToBase64Str(wxUser.getRemark()));
        }
        return toAjax(wxUserService.insertWxUser(wxUser));
    }

    /**
     * 修改微信用户
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:edit')")
    @Log(title = "微信用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WxUser wxUser)
    {
        if(StringUtils.isNotEmpty(wxUser.getNickName())) {
            wxUser.setNickName(Base64Util.textToBase64Str(wxUser.getNickName()));
        }
        if(StringUtils.isNotEmpty(wxUser.getRemark())) {
            wxUser.setRemark(Base64Util.textToBase64Str(wxUser.getRemark()));
        }
        return toAjax(wxUserService.updateWxUser(wxUser));
    }

    /**
     * 删除微信用户
     */
    @PreAuthorize("@ss.hasPermi('weixin:user:remove')")
    @Log(title = "微信用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wxUserService.deleteWxUserByIds(ids));
    }
}
