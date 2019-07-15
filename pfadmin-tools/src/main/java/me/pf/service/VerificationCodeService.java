package me.pf.service;

import me.pf.domain.VerificationCode;
import me.pf.domain.vo.EmailVo;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */

public interface VerificationCodeService {

    /**
     * 发送邮件验证码
     *
     * @param code
     */
    EmailVo sendEmail(VerificationCode code);

    /**
     * 验证
     *
     * @param code
     */
    void validated(VerificationCode code);
}