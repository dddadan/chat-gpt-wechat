package com.ants.common.utils.token;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;

import java.util.HashMap;
import java.util.Map;

import static com.ants.common.constant.Constants.TOKEN_SECRET;

/**
 * 类描述 jwt工具类
 *
 * @author ants
 * @date 2022/10/27 22:58
 */
public class JWTUtils {

    /**
     * 生成token
     *
     * @param openid
     * @return
     */
    public static String sign(String openid) {
        try {
            //秘钥及加密算法
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            //设置头部信息
            Map<String, Object> header = new HashMap<>(2);
            header.put("typ", "JWT");
            header.put("alg", "HS256");
            //携带openid信息，生成签名
            return JWT.create()
                    .withHeader(header)
                    .withClaim("openid", openid)
                    .sign(algorithm);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 解析JWT信息
     *
     * @param token
     * @return openid
     */
    public static String getOpenidByJWT(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT verify = verifier.verify(token);
            String openid = verify.getClaim("openid").asString();
            return openid;
        } catch (Exception e) {
            return null;
        }
    }

}
