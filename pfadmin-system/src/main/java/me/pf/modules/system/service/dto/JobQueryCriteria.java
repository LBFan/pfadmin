package me.pf.modules.system.service.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import me.pf.annotation.Query;

import java.util.Set;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Data
@NoArgsConstructor
public class JobQueryCriteria {

    @Query(type = Query.Type.INNER_LIKE)
    private String name;

    @Query
    private Boolean enabled;

    @Query(propName = "id", joinName = "dept")
    private Long deptId;

    @Query(propName = "id", joinName = "dept", type = Query.Type.IN)
    private Set<Long> deptIds;
}

