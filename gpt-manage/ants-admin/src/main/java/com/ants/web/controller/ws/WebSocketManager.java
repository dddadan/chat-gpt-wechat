package com.ants.web.controller.ws;

import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

@Component
@ServerEndpoint("/wx/api/websocket/{openid}")
public class WebSocketManager {

    private static final Logger log = LoggerFactory.getLogger(WebSocketManager.class);

    // 与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    // 用户ID
    private String openid;

    // concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<WebSocketManager> webSockets = new CopyOnWriteArraySet<>();

    // 用来存在线连接用户信息
    private static ConcurrentHashMap<String, Session> sessionPool = new ConcurrentHashMap<>();

    /**
     * 链接成功调用的方法
     *
     * @param session session
     * @param openid 用户表示
     */
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "openid") String openid) {
        try {
            session.setMaxIdleTimeout(60 * 60 * 1000);
            this.session = session;
            this.openid = openid;
            webSockets.add(this);
            sessionPool.put(openid, session);
            log.info("【websocket消息】有新的连接，连接列队" + sessionPool.size());
        } catch (Exception e) {
        }
    }

    /**
     * 链接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        try {
            webSockets.remove(this);
            sessionPool.remove(this.openid);
            log.info("【websocket消息】连接断开，总数为:" + webSockets.size());
        } catch (Exception e) {
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端消息
     */
    @OnMessage
    public void onMessage(String message) {
        // log.info("【websocket消息】收到客户端消息:" + message);
    }

    /**
     * 发送错误时的处理
     *
     * @param session session
     * @param error 错误信息
     */
    @OnError
    public void onError(Session session, Throwable error) {
        // log.info("【websocket消息】收到客户端出现错误:" + error);
    }

    /**
     * 此为广播消息
     *
     * @param message 消息内容
     */
    public void sendAllMessage(String message) {
        log.info("【websocket消息】广播消息:" + message);
        for (WebSocketManager webSocket : webSockets) {
            try {
                if (webSocket.session.isOpen()) {
                    webSocket.session.getAsyncRemote().sendText(message);
                }
            } catch (Exception e) {
            }
        }
    }

    /**
     * 此为单点消息
     *
     * @param openid
     * @param message
     */
    public void sendOneMessage(String openid, String message) {
        log.info("openid is {}", openid);
        Session session = sessionPool.get(openid);
        log.info("session is {}", session);
        if (session != null && session.isOpen()) {
            try {
                log.info("【websocket消息】 单点消息:" + message);
                session.getAsyncRemote().sendText(message);
            } catch (Exception e) {
                log.error("【websocket消息】 单点消息发送异常: {}, openid is {}", JSON.toJSONString(e), openid);
            }
        }
    }

    /**
     * 此为单点消息(多人)
     *
     * @param openids 用户标识集合
     * @param message 消息
     */
    public void sendMoreMessage(String[] openids, String message) {
        for (String openid : openids) {
            Session session = sessionPool.get(openid);
            if (session != null && session.isOpen()) {
                try {
                    log.info("【websocket消息】 单点消息:" + message);
                    session.getAsyncRemote().sendText(message);
                } catch (Exception e) {
                }
            }
        }
    }
}
