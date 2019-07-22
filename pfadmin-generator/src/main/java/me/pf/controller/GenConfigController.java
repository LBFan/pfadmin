package me.pf.controller;

import me.pf.domain.GenConfig;
import me.pf.service.GenConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/13/07.
 */
@RestController
@RequestMapping("api")
public class GenConfigController {

    @Autowired
    private GenConfigService genConfigService;

    /**
     * 查询生成器配置
     *
     * @return
     */
    @GetMapping(value = "/genConfig")
    public ResponseEntity get() {
        return new ResponseEntity(genConfigService.find(), HttpStatus.OK);
    }

    @PutMapping(value = "/genConfig")
    public ResponseEntity emailConfig(@Validated @RequestBody GenConfig genConfig) {
        return new ResponseEntity(genConfigService.update(genConfig), HttpStatus.OK);
    }
}

