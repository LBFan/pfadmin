package me.pf.modules.quartz.service.dto;

import lombok.Data;
import me.pf.annotation.Query;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Data
public class JobQueryCriteria {

    @Query(type = Query.Type.INNER_LIKE)
    private String jobName;

    @Query
    private Boolean isSuccess;
}

