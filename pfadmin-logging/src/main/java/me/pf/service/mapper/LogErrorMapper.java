package me.pf.service.mapper;

import me.pf.domain.Log;
import me.pf.mapper.EntityMapper;
import me.pf.service.dto.LogErrorDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.springframework.stereotype.Repository;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */
@Mapper(componentModel = "spring",uses = {},unmappedTargetPolicy = ReportingPolicy.IGNORE)
@Repository
public interface LogErrorMapper extends EntityMapper<LogErrorDTO, Log> {
}