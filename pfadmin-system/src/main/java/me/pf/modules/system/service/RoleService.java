package me.pf.modules.system.service;

import me.pf.modules.system.domain.Menu;
import me.pf.modules.system.domain.Role;
import me.pf.modules.system.service.dto.CommonQueryCriteria;
import me.pf.modules.system.service.dto.RoleDTO;
import me.pf.modules.system.service.dto.RoleSmallDTO;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@CacheConfig(cacheNames = "role")
public interface RoleService {

    /**
     * get
     *
     * @param id
     * @return
     */
    @Cacheable(key = "#p0")
    RoleDTO findById(long id);

    /**
     * create
     *
     * @param resources
     * @return
     */
    @CacheEvict(allEntries = true)
    RoleDTO create(Role resources);

    /**
     * update
     *
     * @param resources
     */
    @CacheEvict(allEntries = true)
    void update(Role resources);

    /**
     * delete
     *
     * @param id
     */
    @CacheEvict(allEntries = true)
    void delete(Long id);

    /**
     * key的名称如有修改，请同步修改 UserServiceImpl 中的 update 方法
     * findByUsers_Id
     *
     * @param id
     * @return
     */
    @Cacheable(key = "'findByUsers_Id:' + #p0")
    List<RoleSmallDTO> findByUsers_Id(Long id);

    @Cacheable(keyGenerator = "keyGenerator")
    Integer findByRoles(Set<Role> roles);

    /**
     * updatePermission
     *
     * @param resources
     * @param roleDTO
     */
    @CacheEvict(allEntries = true)
    void updatePermission(Role resources, RoleDTO roleDTO);

    /**
     * updateMenu
     *
     * @param resources
     * @param roleDTO
     */
    @CacheEvict(allEntries = true)
    void updateMenu(Role resources, RoleDTO roleDTO);

    @CacheEvict(allEntries = true)
    void untiedMenu(Menu menu);

    /**
     * queryAll
     *
     * @param pageable
     * @return
     */
    Object queryAll(Pageable pageable);

    /**
     * queryAll
     *
     * @param pageable
     * @param criteria
     * @return
     */
    Object queryAll(CommonQueryCriteria criteria, Pageable pageable);
}

