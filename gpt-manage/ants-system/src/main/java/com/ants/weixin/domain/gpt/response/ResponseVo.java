package com.ants.weixin.domain.gpt.response;

import java.util.List;

public class ResponseVo {

    private String id;

    private String object;

    private Long created;

    private String model;

    private UsageVo usage;

    private String error;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    private List<ChoiceVo> choices;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public Long getCreated() {
        return created;
    }

    public void setCreated(Long created) {
        this.created = created;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public UsageVo getUsage() {
        return usage;
    }

    public void setUsage(UsageVo usage) {
        this.usage = usage;
    }

    public List<ChoiceVo> getChoices() {
        return choices;
    }

    public void setChoices(List<ChoiceVo> choices) {
        this.choices = choices;
    }

    @Override
    public String toString() {
        return "ResponseVo{" +
                "id='" + id + '\'' +
                ", object='" + object + '\'' +
                ", created=" + created +
                ", model='" + model + '\'' +
                ", usage=" + usage +
                ", choices=" + choices +
                '}';
    }
}
