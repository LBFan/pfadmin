package me.pf;

import me.pf.utils.SpringContextHolder;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author : PF_23
 * date :
 */

@EnableAsync
@SpringBootApplication
@EnableTransactionManagement
public class PfadminSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(PfadminSystemApplication.class, args);

//        SpringApplication application = new SpringApplication(PfadminSystemApplication.class);
//        application.setBanner((environment, sourceClass, out) -> {
//            // 打印logo
//            System.out.println("");
//                });
//        application.setBannerMode(Banner.Mode.CONSOLE);
//        application.run(args);
    }

    @Bean
    public SpringContextHolder springContextHolder() {
        return new SpringContextHolder();
    }

}
