package me.pf.modules.system.service.dto;

import lombok.Data;
import me.pf.annotation.Query;

/**
 * @author :  PF_23
 * @Description 公共查询类
 * @date : 2019/16/07.
 */

@Data
public class CommonQueryCriteria {

    @Query(type = Query.Type.INNER_LIKE)
    private String name;
}
