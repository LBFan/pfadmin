package me.pf.modules.system.repository;

import me.pf.modules.system.domain.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */

public interface PermissionRepository extends JpaRepository<Permission, Long>, JpaSpecificationExecutor {

    /**
     * findByName
     *
     * @param name
     * @return
     */
    Permission findByName(String name);

    /**
     * findByPid
     *
     * @param pid
     * @return
     */
    List<Permission> findByPid(long pid);
}

