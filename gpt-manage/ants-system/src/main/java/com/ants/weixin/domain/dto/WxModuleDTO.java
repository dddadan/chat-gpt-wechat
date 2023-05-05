package com.ants.weixin.domain.dto;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class WxModuleDTO {

    /** 主键 */
    private Long moduleId;

    /** 单元名称 */
    private String moduleName;

    /** 单元标签 */
    private String moduleTag;

    /** 排序 */
    private Long moduleIndex;

    /** openid */
    private String openid;

    /** topic对象 */
    private List<WxTopicDTO> wxTopicDTOs;

    public Long getModuleId() {
        return moduleId;
    }

    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getModuleTag() {
        return moduleTag;
    }

    public void setModuleTag(String moduleTag) {
        this.moduleTag = moduleTag;
    }

    public Long getModuleIndex() {
        return moduleIndex;
    }

    public void setModuleIndex(Long moduleIndex) {
        this.moduleIndex = moduleIndex;
    }

    public List<WxTopicDTO> getWxTopicDTOs() {
        return wxTopicDTOs;
    }

    public void setWxTopicDTOs(List<WxTopicDTO> wxTopicDTOs) {
        this.wxTopicDTOs = wxTopicDTOs;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }
}
