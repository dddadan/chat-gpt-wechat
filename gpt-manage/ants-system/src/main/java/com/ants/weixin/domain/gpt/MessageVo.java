package com.ants.weixin.domain.gpt;

public class MessageVo {

    private String role;

    private String content;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "MessageVo{" +
                "role='" + role + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
