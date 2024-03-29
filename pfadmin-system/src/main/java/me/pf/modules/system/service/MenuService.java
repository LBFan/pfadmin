package me.pf.modules.system.service;

import me.pf.modules.system.domain.Menu;
import me.pf.modules.system.service.dto.CommonQueryCriteria;
import me.pf.modules.system.service.dto.MenuDTO;
import me.pf.modules.system.service.dto.RoleSmallDTO;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;
import java.util.Map;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@CacheConfig(cacheNames = "menu")
public interface MenuService {

    /**
     * queryAll
     *
     * @param criteria
     * @return
     */
    @Cacheable(keyGenerator = "keyGenerator")
    List<MenuDTO> queryAll(CommonQueryCriteria criteria);

    /**
     * get
     *
     * @param id
     * @return
     */
    @Cacheable(key = "#p0")
    MenuDTO findById(long id);

    /**
     * create
     *
     * @param resources
     * @return
     */
    @CacheEvict(allEntries = true)
    MenuDTO create(Menu resources);

    /**
     * update
     *
     * @param resources
     */
    @CacheEvict(allEntries = true)
    void update(Menu resources);

    /**
     * delete
     *
     * @param id
     */
    @CacheEvict(allEntries = true)
    void delete(Long id);

    /**
     * permission tree
     *
     * @return
     */
    @Cacheable(key = "'tree'")
    Object getMenuTree(List<Menu> menus);

    /**
     * findByPid
     *
     * @param pid
     * @return
     */
    @Cacheable(key = "'pid:'+#p0")
    List<Menu> findByPid(long pid);

    /**
     * build Tree
     *
     * @param menuDTOS
     * @return
     */
    Map buildTree(List<MenuDTO> menuDTOS);

    /**
     * findByRoles
     *
     * @param roles
     * @return
     */
    List<MenuDTO> findByRoles(List<RoleSmallDTO> roles);

    /**
     * buildMenus
     *
     * @param byRoles
     * @return
     */
    Object buildMenus(List<MenuDTO> byRoles);

    Menu findOne(Long id);
}


