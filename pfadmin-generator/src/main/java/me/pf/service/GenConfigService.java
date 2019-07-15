package me.pf.service;

import me.pf.domain.GenConfig;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/13/07.
 */
@CacheConfig(cacheNames = "genConfig")
public interface GenConfigService {

    /**
     * find
     *
     * @return
     */
    @Cacheable(key = "'1'")
    GenConfig find();

    /**
     * update
     *
     * @param genConfig
     * @return
     */
    @CacheEvict(allEntries = true)
    GenConfig update(GenConfig genConfig);
}