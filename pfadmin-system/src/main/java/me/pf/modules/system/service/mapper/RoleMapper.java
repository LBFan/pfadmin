package me.pf.modules.system.service.mapper;

import me.pf.mapper.EntityMapper;
import me.pf.modules.system.domain.Role;
import me.pf.modules.system.service.dto.RoleDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.springframework.stereotype.Repository;


/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Repository
@Mapper(componentModel = "spring", uses = {PermissionMapper.class, MenuMapper.class, DeptMapper.class}, unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface RoleMapper extends EntityMapper<RoleDTO, Role> {

}
