# <center> 蚂蚁AI助手 - ChatGPT聊天开源小程序

<br />

## 蚂蚁AI助手简介🔥🔥🔥

<br />

### 开源微信版ChatGPT，支持文字对话，支持一键分享，毫无保留给个人及企业免费使用。

<br />

* #### 前端采用小程序，Vue和ColorUI
* #### 后端采用Spring Boot、Spring Security、Redis & Jwt
* #### 特别鸣谢[若依](http://www.ruoyi.vip/)、[ColorUI](https://beta3.color-ui.com/)

<br />

## 在线体验⛄⛄⛄

<br />

<img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E6%89%AB%E7%A0%81_1.png" alt="扫码_1" width="200"/>

<br />


## 演示图🌊🌊🌊

<br />

<table>
    <tr>
        <td ><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_1.png" alt="微信_1" width="500px"/></td>
        <td><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_2.png" alt="微信_2"  width="500px"/></td>
        <td><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_3.png" alt="微信_3"  width="500px"/></td>
    </tr>
</table>

<br />

## 开发指南🌈🌈🌈

<br />

### **1. 结构**

<br />

| 目录 | 结构 |
| :---- | :---- |
| gpt-applet | 小程序 |
| gpt-manage | 管理系统后端 |
| gpt-sql | 数据库sql |
| gpt-ui | 管理系统前端 |

<br />

### **2. 核心配置**

<br />

### gpt-manage -> application.yml

<br />

``` yml
# 微信相关配置
wx:
  app:
    id: 微信小程序id
    secret: 微信小程序secret

# ChatGPT相关配置
gpt:
  url: https://api.openai.com/v1/chat/completions
  Authorization: Bearer ChatGPT的API KEY
```

### gpt-applet -> app.js

<br />

``` javascript
globalData: {
  // 本地调试
  url: 'http://localhost:8080/wx/api/',
  wsUrl: 'ws://localhost:8080/wx/api/websocket/'
}
```

### **3. 部署**
``` nginx
worker_processes  2;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    gzip	on;
    gzip_types application/javascript;

    server {
        listen 80 default;
        server_name _;
        return 301 https://www.xxxxx.com;
    }

    server {
        listen       80;
        #请填写绑定证书的域名
        server_name www.xxxxx.com; 
        if ($host != 'www.xxxxx.com'){
            return 301 https://www.xxxxx.com;
        }
        #（第一种）把http的域名请求转成https
        return 301 https://$host$request_uri;
        #（第二种）强制将http的URL重写成https
        rewrite ^(.*) https://$server_name$1 permanent; 
    }

    server {
     #SSL 默认访问端口号为 443
     listen 443 ssl; 
     #请填写绑定证书的域名
     server_name www.xxxxx.com; 
     #请填写证书文件的相对路径或绝对路径
     ssl_certificate www.xxxxx.com.crt; 
     #请填写私钥文件的相对路径或绝对路径
     ssl_certificate_key www.xxxxx.com.key; 
     ssl_session_timeout 5m;
     #请按照以下协议配置
     ssl_protocols TLSv1.2 TLSv1.3; 
     #请按照以下套件配置，配置加密套件，写法遵循 openssl 标准。
     ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE; 
     ssl_prefer_server_ciphers on;

        location /profile/ {
            alias   /web/;
        }

        location / {
            root   /web/gpt;
			try_files $uri $uri/ /index.html;
            index  index.html index.htm;
        }

		location /prod-api/ {
			proxy_set_header Host $http_host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header REMOTE-HOST $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
			proxy_pass http://localhost:8080/;
		}

        location /wx/api/websocket {
            proxy_pass http://localhost:8080/wx/api/websocket;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header X-real-ip $remote_addr;
	        proxy_set_header X-Forwarded-For $remote_addr;
	        proxy_set_header Host $host;
	        proxy_set_header X-Forwarded-Proto   $scheme;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
```

<br/>

## 联系 | 打赏💥💥💥

<br />
<table>
    <tr>
        <td ><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_4.jpg" alt="截图_4" width="500px"/></td>
        <td><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_5.jpg" alt="微信_5"  width="500px"/></td>
        <td><img src="https://github.com/dddadan/chat-gpt-wechat/blob/main/gpt-ui/src/assets/screenshot/%E5%BE%AE%E4%BF%A1_6.jpg" alt="微信_6"  width="500px"/></td>
    </tr>
</table>