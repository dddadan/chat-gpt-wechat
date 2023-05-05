package com.ants.weixin.domain.gpt.request;

import com.ants.weixin.domain.gpt.MessageVo;

import java.util.List;

public class RequestVo {

    private String model;

    private List<MessageVo> messages;

    private Integer temperature;

    private Integer top_p;

    private Integer n;

    private boolean stream;

    private List<String> stop;

    private Integer max_tokens;

    private Integer presence_penalty;

    private Integer frequency_penalty;

    private Integer logit_bias;

    private String user;

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public List<MessageVo> getMessages() {
        return messages;
    }

    public void setMessages(List<MessageVo> messages) {
        this.messages = messages;
    }

    public Integer getTemperature() {
        return temperature;
    }

    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    public Integer getTop_p() {
        return top_p;
    }

    public void setTop_p(Integer top_p) {
        this.top_p = top_p;
    }

    public Integer getN() {
        return n;
    }

    public void setN(Integer n) {
        this.n = n;
    }

    public boolean isStream() {
        return stream;
    }

    public void setStream(boolean stream) {
        this.stream = stream;
    }

    public List<String> getStop() {
        return stop;
    }

    public void setStop(List<String> stop) {
        this.stop = stop;
    }

    public Integer getMax_tokens() {
        return max_tokens;
    }

    public void setMax_tokens(Integer max_tokens) {
        this.max_tokens = max_tokens;
    }

    public Integer getPresence_penalty() {
        return presence_penalty;
    }

    public void setPresence_penalty(Integer presence_penalty) {
        this.presence_penalty = presence_penalty;
    }

    public Integer getFrequency_penalty() {
        return frequency_penalty;
    }

    public void setFrequency_penalty(Integer frequency_penalty) {
        this.frequency_penalty = frequency_penalty;
    }

    public Integer getLogit_bias() {
        return logit_bias;
    }

    public void setLogit_bias(Integer logit_bias) {
        this.logit_bias = logit_bias;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "RequestVo{" +
                "model='" + model + '\'' +
                ", messages=" + messages +
                ", temperature=" + temperature +
                ", top_p=" + top_p +
                ", n=" + n +
                ", stream=" + stream +
                ", stop=" + stop +
                ", max_tokens=" + max_tokens +
                ", presence_penalty=" + presence_penalty +
                ", frequency_penalty=" + frequency_penalty +
                ", logit_bias=" + logit_bias +
                ", user='" + user + '\'' +
                '}';
    }
}
