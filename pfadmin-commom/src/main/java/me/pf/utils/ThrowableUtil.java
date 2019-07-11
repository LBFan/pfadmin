package me.pf.utils;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * Created by : PF
 * Date on : 2019-07-11.
 */

public class ThrowableUtil {

    /**
     * 获取堆栈信息
     * @param throwable
     * @return
     */
    public static String getStackTrace(Throwable throwable){
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        try {
            throwable.printStackTrace(pw);
            return sw.toString();
        } finally {
            pw.close();
        }
    }
}

