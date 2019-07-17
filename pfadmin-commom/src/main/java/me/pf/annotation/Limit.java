package me.pf.annotation;

import me.pf.aspect.LimitType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * Date on : 2019-07-11.
 *
 * @author PF_23
 */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Limit {

    /**
     * 资源名称，用于描述接口功能
     */
    String name() default "";

    /**
     * 资源 key
     */
    String key() default "";

    /**
     * key prefix
     *
     * @return
     */
    String prefix() default "";

    /**
     * 时间，单位秒
     *
     * @return
     */
    int period();

    /**
     * 限制访问次数
     *
     * @return
     */
    int count();

    /**
     * 限制类型
     *
     * @return
     */
    LimitType limitType() default LimitType.CUSTOMER;
}