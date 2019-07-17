package me.pf.modules.system.repository;

import me.pf.modules.system.domain.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */

public interface JobRepository extends JpaRepository<Job, Long>, JpaSpecificationExecutor {
}