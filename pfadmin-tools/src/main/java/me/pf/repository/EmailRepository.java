package me.pf.repository;

import me.pf.domain.EmailConfig;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */

public interface EmailRepository extends JpaRepository<EmailConfig, Long> {
}