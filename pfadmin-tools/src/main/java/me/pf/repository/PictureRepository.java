package me.pf.repository;

import me.pf.domain.Picture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/15/07.
 */

public interface PictureRepository extends JpaRepository<Picture, Long>, JpaSpecificationExecutor {
}