package me.pf.modules.monitor.config;

import me.pf.modules.monitor.service.VisitsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * @author :  PF_23
 * @Description 初始化站点统计
 * @date : 2019/16/07.
 */
@Component
public class VisitsInitialization implements ApplicationRunner {

    @Autowired
    private VisitsService visitsService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        System.out.println("--------------- 初始化站点统计，如果存在今日统计则跳过 ---------------");
        visitsService.save();
        System.out.println("--------------- 初始化站点统计完成 ---------------");
    }
}

