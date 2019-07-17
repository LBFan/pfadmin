package me.pf.modules.system.service.mapper;

import me.pf.mapper.EntityMapper;
import me.pf.modules.system.domain.Menu;
import me.pf.modules.system.service.dto.MenuDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.springframework.stereotype.Repository;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Repository
@Mapper(componentModel = "spring", uses = {}, unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface MenuMapper extends EntityMapper<MenuDTO, Menu> {

}
