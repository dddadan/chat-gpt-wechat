package com.ants.common.utils.json;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;

import java.util.List;
import java.util.Map;

public class JsonUtil {

    /**
     * 将String转Map
     */
    public static Map<String, Object> stringToMap(String str) {
        return (Map<String, Object>)JSON.parse(str);
    }
}
