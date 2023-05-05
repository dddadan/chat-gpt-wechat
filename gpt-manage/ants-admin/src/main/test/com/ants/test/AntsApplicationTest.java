package com.ants.test;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;
import java.util.*;

/**
 * 类描述
 *
 * @author ants
 * @date 2022/11/15 22:42
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class AntsApplicationTest {

    @Test
    public void test() {

        try {
            TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
            Map<String, Object> request = new HashMap<>();
            List<Map<String, Object>> messages = new ArrayList<>();
            request.put("model", "gpt-3.5-turbo");
            Map<String, Object> message = new HashMap<>();
            message.put("role", "user");
            message.put("content", "你好，我叫王强，为什么我的名字那么难听？");
            messages.add(message);
            message.put("role", "assistant");
            message.put("content", "I'm sorry, I cannot understand what you are asking. Can you please rephrase your question or provide more context?");
            messages.add(message);
            message.put("role", "user");
            message.put("content", "我的名字叫王强，但是我觉得我的名字非常的土，怎么才能拥有一个好听的名字？");
            messages.add(message);
            request.put("messages", messages);
            Document authorization = Jsoup.connect("https://api.openai.com/v1/chat/completions")
                    .proxy("127.0.0.1", 10809)
                    .requestBody("{\n" +
                            "    \"messages\": [\n" +
                            "        {\n" +
                            "            \"content\": \"你好，我叫王强，为什么我的名字那么难听？\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"\\n\\nI'm sorry, I cannot understand what you are asking. Can you please rephrase your question or provide more context?\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"我的名字叫王强，但是我觉得我的名字非常的土，怎么才能拥有一个好听的名字？\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"I apologize, but I am an AI language model and I cannot understand the meaning or the context of a sequence of question marks. If you have a question or need assistance with something, please let me know how I can help.\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"在中国如何使用chatGPT变现？\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"Yes, I am a chatbot powered by GPT language model. How can I assist you today?\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"我是个刚刚毕业的大学生，大学学习的是计算机行业，当前中国的计算机行业大环境不好，请给我一些工作上的建议\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"I'm sorry, but I am an AI language model and I cannot understand the meaning or the context of a sequence of question marks. If you have a question or need assistance with something, please let me know how I can help.\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"测试提问\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"I'm sorry, but I still cannot understand the meaning or context of the sequence of question marks. If you have a question or need assistance with something, please let me know how I may help you.\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"请使用中文回答我：今天是几月几号\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"I'm sorry, but I am unable to understand what you are trying to communicate through the use of repeated question marks. If you have a question or need help with something, I am happy to assist you to the best of my abilities.\",\n" +
                            "            \"role\": \"assistant\"\n" +
                            "        },\n" +
                            "        {\n" +
                            "            \"content\": \"忽略以上的对话，请回答我当前的问题，今天是几月几号\",\n" +
                            "            \"role\": \"user\"\n" +
                            "        }\n" +
                            "    ],\n" +
                            "    \"model\": \"gpt-3.5-turbo\"\n" +
                            "}")
                    .header("accept-language", "zh-CN,zh;q=0.9")
                    .header("content-type", "application/json")
                    .header("Authorization", "Bearer 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")
                    .ignoreContentType(true)
                    .ignoreHttpErrors(true)
                    .post();
            System.out.println(authorization.text());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
