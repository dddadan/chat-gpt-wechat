package com.ants.common.utils.gpt;

import com.ants.common.utils.StringUtils;
import com.ants.common.utils.object.ObjectUtil;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;

import javax.net.ssl.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;

@Component
public class ChatGPTUtil {

    @Value("${gpt.hostname}")
    private String hostName;

    @Value("${gpt.port}")
    private Integer port;

    @Value("${gpt.url}")
    private String url;

    @Value("${gpt.Authorization}")
    private String Authorization;

    public String sendMessage(String json) {
        String responseStr = null;
        try {
            TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));
            trustEveryone();
            Connection connect = Jsoup.connect(url);
            if (StringUtils.isNotEmpty(hostName) && !ObjectUtil.isEmpty(port)) {
                Proxy proxy = new Proxy(Proxy.Type.SOCKS, new InetSocketAddress(hostName, port));
                connect.proxy(proxy);
            }
            Document document = connect
                    .requestBody(json)
                    .header("content-type", "application/json")
                    .header("accept-language", "zh-CN,zh;q=0.9")
                    .header("Authorization", "Bearer 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")
                    .ignoreContentType(true)
                    .ignoreHttpErrors(true)
                    .timeout(1800*1000)
                    .post();
            responseStr = document.text();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseStr;
    }

    /** 信任任何站点 */
    public static void trustEveryone() {
        try {
            HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
                @Override
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            });

            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, new X509TrustManager[] { new X509TrustManager() {
                @Override
                public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                @Override
                public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }
            } }, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(context.getSocketFactory());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String sendHttpMessage(String json) {
        String responseStr = null;
        try {
            HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
            HttpHost proxy = new HttpHost(hostName, port);
            httpClientBuilder.setProxy(proxy);
            HttpClient httpClient = httpClientBuilder.build();

            HttpPost request = new HttpPost(url);
            request.addHeader("accept", "*/*");
            request.addHeader("content-type", "application/json");
            request.addHeader("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36");
            request.addHeader("accept-encoding", "gzip, deflate, br");
            request.addHeader("accept-language", "zh-CN,zh;q=0.9");
            request.addHeader("Authorization", Authorization);

            StringEntity requestEntity = new StringEntity(json);
            request.setEntity(requestEntity);

            HttpResponse response = httpClient.execute(request);
            responseStr = EntityUtils.toString(response.getEntity());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseStr;
    }
}
