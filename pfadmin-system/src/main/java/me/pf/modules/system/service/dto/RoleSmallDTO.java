package me.pf.modules.system.service.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Data
public class RoleSmallDTO implements Serializable {

    private Long id;

    private String name;

    private Integer level;

    private String dataScope;
}

