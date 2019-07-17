package me.pf.modules.quartz.repository;

import me.pf.modules.quartz.domain.QuartzLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */

public interface QuartzLogRepository  extends JpaRepository<QuartzLog,Long>, JpaSpecificationExecutor {

}