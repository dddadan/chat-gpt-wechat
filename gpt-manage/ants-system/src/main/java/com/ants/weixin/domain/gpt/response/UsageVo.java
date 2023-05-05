package com.ants.weixin.domain.gpt.response;

public class UsageVo {

    private Integer prompt_tokens;

    private Integer completion_tokens;

    private Integer total_tokens;

    public Integer getPrompt_tokens() {
        return prompt_tokens;
    }

    public void setPrompt_tokens(Integer prompt_tokens) {
        this.prompt_tokens = prompt_tokens;
    }

    public Integer getCompletion_tokens() {
        return completion_tokens;
    }

    public void setCompletion_tokens(Integer completion_tokens) {
        this.completion_tokens = completion_tokens;
    }

    public Integer getTotal_tokens() {
        return total_tokens;
    }

    public void setTotal_tokens(Integer total_tokens) {
        this.total_tokens = total_tokens;
    }

    @Override
    public String toString() {
        return "UsageVo{" +
                "prompt_tokens=" + prompt_tokens +
                ", completion_tokens=" + completion_tokens +
                ", total_tokens=" + total_tokens +
                '}';
    }
}
