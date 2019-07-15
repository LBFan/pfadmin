package me.pf.service.dto;

import lombok.Data;
import me.pf.annotation.Query;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */
@Data
public class QiniuQueryCriteria {

    @Query(type = Query.Type.INNER_LIKE)
    private String key;
}

