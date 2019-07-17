package me.pf.modules.quartz.utils;

import lombok.extern.slf4j.Slf4j;
import me.pf.utils.SpringContextHolder;
import me.pf.utils.StringUtil;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;

/**
 * @author :  PF_23
 * @Description 执行定时任务
 * @date : 2019/16/07.
 */
@Slf4j
public class QuartzRunnable implements Runnable {

    private Object target;
    private Method method;
    private String params;

    QuartzRunnable(String beanName, String methodName, String params)
            throws NoSuchMethodException, SecurityException {
        this.target = SpringContextHolder.getBean(beanName);
        this.params = params;

        if (StringUtil.isNotBlank(params)) {
            this.method = target.getClass().getDeclaredMethod(methodName, String.class);
        } else {
            this.method = target.getClass().getDeclaredMethod(methodName);
        }
    }

    @Override
    public void run() {
        try {
            ReflectionUtils.makeAccessible(method);
            if (StringUtil.isNotBlank(params)) {
                method.invoke(target, params);
            } else {
                method.invoke(target);
            }
        } catch (Exception e) {
            log.error("定时任务执行失败",e);
        }
    }

}


