package com.ants.web.controller.search;

import com.ants.common.annotation.Log;
import com.ants.common.core.controller.BaseController;
import com.ants.common.core.domain.AjaxResult;
import com.ants.common.core.page.TableDataInfo;
import com.ants.common.enums.BusinessType;
import com.ants.common.utils.poi.ExcelUtil;
import com.ants.search.domain.AntsExam;
import com.ants.search.service.IAntsExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 考试题目Controller
 * 
 * @author ants
 * @date 2023-01-08
 */
@RestController
@RequestMapping("/search/exam")
public class AntsExamController extends BaseController
{
    @Autowired
    private IAntsExamService antsExamService;

    /**
     * 查询考试题目列表
     */
    @PreAuthorize("@ss.hasPermi('search:exam:list')")
    @GetMapping("/list")
    public TableDataInfo list(AntsExam antsExam)
    {
        startPage();
        List<AntsExam> list = antsExamService.selectAntsExamList(antsExam);
        return getDataTable(list);
    }

    /**
     * 导出考试题目列表
     */
    @PreAuthorize("@ss.hasPermi('search:exam:export')")
    @Log(title = "考试题目", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AntsExam antsExam)
    {
        List<AntsExam> list = antsExamService.selectAntsExamList(antsExam);
        ExcelUtil<AntsExam> util = new ExcelUtil<AntsExam>(AntsExam.class);
        return util.exportExcel(list, "exam");
    }

    /**
     * 获取考试题目详细信息
     */
    @PreAuthorize("@ss.hasPermi('search:exam:query')")
    @GetMapping(value = "/{examId}")
    public AjaxResult getInfo(@PathVariable("examId") Long examId)
    {
        return AjaxResult.success(antsExamService.selectAntsExamById(examId));
    }

    /**
     * 新增考试题目
     */
    @PreAuthorize("@ss.hasPermi('search:exam:add')")
    @Log(title = "考试题目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AntsExam antsExam)
    {
        return toAjax(antsExamService.insertAntsExam(antsExam));
    }

    /**
     * 修改考试题目
     */
    @PreAuthorize("@ss.hasPermi('search:exam:edit')")
    @Log(title = "考试题目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AntsExam antsExam)
    {
        return toAjax(antsExamService.updateAntsExam(antsExam));
    }

    /**
     * 删除考试题目
     */
    @PreAuthorize("@ss.hasPermi('search:exam:remove')")
    @Log(title = "考试题目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{examIds}")
    public AjaxResult remove(@PathVariable Long[] examIds)
    {
        return toAjax(antsExamService.deleteAntsExamByIds(examIds));
    }
}
