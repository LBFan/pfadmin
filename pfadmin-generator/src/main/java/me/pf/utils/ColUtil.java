package me.pf.utils;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;


/**
 * @author :  PF_23
 * @Description sql字段转java
 * @date : 2019/13/07.
 */

public class ColUtil {
    /**
     * 转换mysql数据类型为java数据类型
     *
     * @param type
     * @return
     */
    public static String cloToJava(String type) {
        Configuration config = getConfig();
        return config.getString(type, "unknowType");
    }

    /**
     * 获取配置信息
     */
    public static PropertiesConfiguration getConfig() {
        try {
            return new PropertiesConfiguration("generator.properties");
        } catch (ConfigurationException e) {
            e.printStackTrace();
        }
        return null;
    }
}

