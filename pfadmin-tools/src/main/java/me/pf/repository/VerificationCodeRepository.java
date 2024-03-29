package me.pf.repository;

import me.pf.domain.VerificationCode;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */

public interface VerificationCodeRepository extends JpaRepository<VerificationCode, Long> {

    /**
     * 获取有效的验证码
     *
     * @param scenes 业务场景，如重置密码，重置邮箱等等
     * @param type
     * @param value
     * @return
     */
    VerificationCode findByScenesAndTypeAndValueAndStatusIsTrue(String scenes, String type, String value);
}