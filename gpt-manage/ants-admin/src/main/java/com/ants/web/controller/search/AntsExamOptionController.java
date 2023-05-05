package com.ants.web.controller.search;

import com.ants.common.annotation.Log;
import com.ants.common.core.controller.BaseController;
import com.ants.common.core.domain.AjaxResult;
import com.ants.common.core.page.TableDataInfo;
import com.ants.common.enums.BusinessType;
import com.ants.common.utils.poi.ExcelUtil;
import com.ants.search.domain.AntsExamOption;
import com.ants.search.service.IAntsExamOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题目选项Controller
 * 
 * @author ants
 * @date 2023-01-08
 */
@RestController
@RequestMapping("/search/option")
public class AntsExamOptionController extends BaseController
{
    @Autowired
    private IAntsExamOptionService antsExamOptionService;

    /**
     * 查询题目选项列表
     */
    @PreAuthorize("@ss.hasPermi('search:option:list')")
    @GetMapping("/list")
    public TableDataInfo list(AntsExamOption antsExamOption)
    {
        startPage();
        List<AntsExamOption> list = antsExamOptionService.selectAntsExamOptionList(antsExamOption);
        return getDataTable(list);
    }

    /**
     * 导出题目选项列表
     */
    @PreAuthorize("@ss.hasPermi('search:option:export')")
    @Log(title = "题目选项", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AntsExamOption antsExamOption)
    {
        List<AntsExamOption> list = antsExamOptionService.selectAntsExamOptionList(antsExamOption);
        ExcelUtil<AntsExamOption> util = new ExcelUtil<AntsExamOption>(AntsExamOption.class);
        return util.exportExcel(list, "option");
    }

    /**
     * 获取题目选项详细信息
     */
    @PreAuthorize("@ss.hasPermi('search:option:query')")
    @GetMapping(value = "/{optionId}")
    public AjaxResult getInfo(@PathVariable("optionId") Long optionId)
    {
        return AjaxResult.success(antsExamOptionService.selectAntsExamOptionById(optionId));
    }

    /**
     * 新增题目选项
     */
    @PreAuthorize("@ss.hasPermi('search:option:add')")
    @Log(title = "题目选项", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AntsExamOption antsExamOption)
    {
        return toAjax(antsExamOptionService.insertAntsExamOption(antsExamOption));
    }

    /**
     * 修改题目选项
     */
    @PreAuthorize("@ss.hasPermi('search:option:edit')")
    @Log(title = "题目选项", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AntsExamOption antsExamOption)
    {
        return toAjax(antsExamOptionService.updateAntsExamOption(antsExamOption));
    }

    /**
     * 删除题目选项
     */
    @PreAuthorize("@ss.hasPermi('search:option:remove')")
    @Log(title = "题目选项", businessType = BusinessType.DELETE)
	@DeleteMapping("/{optionIds}")
    public AjaxResult remove(@PathVariable Long[] optionIds)
    {
        return toAjax(antsExamOptionService.deleteAntsExamOptionByIds(optionIds));
    }
}
