package com.ants.common.utils.object;

import java.util.Collection;
import java.util.Map;

public class ObjectUtil {

    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        }
        if ((obj instanceof String)) {
            return ((String) obj).trim().equals("");
        } else if (obj instanceof Map) {
            return ((Map) obj).isEmpty();
        } else if (obj instanceof Object[]) {
            Object[] object = (Object[]) obj;
            if (object.length == 0) {
                return true;
            }
        } else if (obj instanceof Collection) {
            return ((Collection) obj).isEmpty();
        } else if (obj instanceof CharSequence) {
            return ((CharSequence) obj).length() == 0;
        }
        return false;
    }
}
