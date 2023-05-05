package com.ants.common.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 类描述
 *
 * @author ants
 * @date 2022/12/11 15:37
 */
public class FilterStrUtil {

    /**
     * @param number
     * @return
     * @Title : filterNumber
     * @Type : FilterStr
     * @date : 2014年3月12日 下午7:23:03
     * @Description : 过滤出数字
     */
    public static String filterNumber(String number) {
        number = number.replaceAll("[^(0-9)]", "");
        return number;
    }

    /**
     * @param alph
     * @return
     * @Title : filterAlphabet
     * @Type : FilterStr
     * @date : 2014年3月12日 下午7:28:54
     * @Description : 过滤出字母
     */
    public static String filterAlphabet(String alph) {
        alph = alph.replaceAll("[^(A-Za-z)]", "");
        return alph;
    }

    /**
     * @param chin
     * @return
     * @Title : filterChinese
     * @Type : FilterStr
     * @date : 2014年3月12日 下午9:12:37
     * @Description : 过滤出中文
     */
    public static String filterChinese(String chin) {
        chin = chin.replaceAll("[^(\\u4e00-\\u9fa5)]", "");
        return chin;
    }

    /**
     * @param character
     * @return
     * @Title : filter
     * @Type : FilterStr
     * @date : 2014年3月12日 下午9:17:22
     * @Description : 过滤出字母、数字和中文
     */
    public static String filter(String character) {
        character = character.replaceAll("[^(a-zA-Z0-9\\u4e00-\\u9fa5)]", "");
        return character;
    }

    /**
     * @param html
     * @return
     * @Title : filter
     * @Type : FilterStr
     * @date : 2014年3月12日 下午9:17:22
     * @Description : 过滤出字母、数字和中文
     */
    public static String filterHtml(String html) {
        Document document = Jsoup.parse(html);
        String text = document.text();
        text = text.replaceAll("[^(a-zA-Z0-9\\u4e00-\\u9fa5)]", "");
        return text;
    }

    /**
     * @param args
     * @Title : main
     * @Type : FilterStr
     * @date : 2014年3月12日 下午7:18:22
     * @Description :
     */
    public static void main(String[] args) {
        /**
         * 声明字符串you
         */
        String you = "^&^&^you123$%$%你好";
        /**
         * 调用过滤出数字的方法
         */
        you = filterNumber(you);
        /**
         * 打印结果
         */
        System.out.println("过滤出数字：" + you);

        /**
         * 声明字符串hai
         */
        String hai = "￥%……4556ahihdjsadhj$%$%你好吗wewewe";
        /**
         * 调用过滤出字母的方法
         */
        hai = filterAlphabet(hai);
        /**
         * 打印结果
         */
        System.out.println("过滤出字母：" + hai);

        /**
         * 声明字符串dong
         */
        String dong = "$%$%$张三34584yuojk李四@#￥#%%￥……%&";
        /**
         * 调用过滤出中文的方法
         */
        dong = filterChinese(dong);
        /**
         * 打印结果
         */
        System.out.println("过滤出中文：" + dong);

        /**
         * 声明字符串str
         */
        String str = "$%$%$张三34584yuojk李四@#￥#%%￥……%&";
        /**
         * 调用过滤出字母、数字和中文的方法
         */
        str = filter(str);
        /**
         * 打印结果
         */
        System.out.println("过滤出字母、数字和中文：" + str);

    }

}