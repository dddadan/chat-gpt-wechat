package com.ants.weixin.domain.gpt.response;

import com.ants.weixin.domain.gpt.MessageVo;

public class ChoiceVo {

    private MessageVo message;

    private String finish_reason;

    private Integer index;

    public MessageVo getMessage() {
        return message;
    }

    public void setMessage(MessageVo message) {
        this.message = message;
    }

    public String getFinish_reason() {
        return finish_reason;
    }

    public void setFinish_reason(String finish_reason) {
        this.finish_reason = finish_reason;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    @Override
    public String toString() {
        return "ChoiceVo{" +
                "message=" + message +
                ", finish_reason='" + finish_reason + '\'' +
                ", index=" + index +
                '}';
    }
}
