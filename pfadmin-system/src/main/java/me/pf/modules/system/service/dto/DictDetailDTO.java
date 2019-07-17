package me.pf.modules.system.service.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Data
public class DictDetailDTO implements Serializable {

    private Long id;

    /**
     * 字典标签
     */
    private String label;

    /**
     * 字典值
     */
    private String value;

    /**
     * 排序
     */
    private String sort;
}