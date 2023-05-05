package com.ants.common.base64;

import com.ants.common.utils.StringUtils;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class Base64Util {

    // Base64 编码与解码
    private static final Base64.Decoder DECODER_64 = Base64.getDecoder();
    private static final Base64.Encoder ENCODER_64 = Base64.getEncoder();

    // 编码、解码格式
    private static final String CODE_FORMATE = "UTF-8";

    /**
     * 1. text明文 转 Base64字符串
     * @param text  明文
     * @return      Base64 字符串
     */
    public static String textToBase64Str(String text) {
        if (StringUtils.isBlank(text)) {
            return text;
        }
        String encodedToStr = null;
        try {
            encodedToStr = ENCODER_64.encodeToString(text.getBytes(CODE_FORMATE));
        } catch (UnsupportedEncodingException e) {
            e.getMessage();
        }
        return encodedToStr;
    }


    /**
     * 2. text的Base64字符串 转 明文
     * @param base64Str text的Base64字符串
     * @return          text明文
     */
    public static String base64StrToText(String base64Str) {
        if (StringUtils.isBlank(base64Str)) {
            return base64Str;
        }
        String byteToText = null;
        try {
            byteToText = new String(DECODER_64.decode(base64Str), CODE_FORMATE);
        } catch (UnsupportedEncodingException e) {
            e.getMessage();
        }
        return byteToText;
    }
}
