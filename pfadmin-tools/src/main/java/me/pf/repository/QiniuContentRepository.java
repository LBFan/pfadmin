package me.pf.repository;

import me.pf.domain.QiniuContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */

public interface QiniuContentRepository extends JpaRepository<QiniuContent, Long>, JpaSpecificationExecutor {

    /**
     * 根据key查询
     *
     * @param key
     * @return
     */
    QiniuContent findByKey(String key);
}