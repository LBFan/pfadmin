package me.pf.modules.system.service.dto;

import lombok.Data;
import me.pf.annotation.Query;

import java.util.Set;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */

@Data
public class DeptQueryCriteria {

    @Query(type = Query.Type.IN, propName = "id")
    private Set<Long> ids;

    @Query(type = Query.Type.INNER_LIKE)
    private String name;

    @Query
    private Boolean enabled;

    @Query
    private Long pid;
}

