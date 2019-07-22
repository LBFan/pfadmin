package me.pf.swagger2;

import com.google.common.base.Predicates;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.List;

/**
 * api页面 /swagger-ui.html
 *
 * @author : PF_23
 * Date on : 2019-07-11.
 */

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    /**
     * jwt.header: Authorization
     */
    @Value("${jwt.header}")
    private String tokenHeader;

    /**
     * true
     */
    @Value("${swagger.enabled}")
    private Boolean enabled;

    @Bean
    public Docket createRestApi() {
        ParameterBuilder ticketPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<Parameter>();
        ticketPar.name(tokenHeader).description("token")
                .modelRef(new ModelRef("string"))
                .parameterType("header")
                .defaultValue("Bearer ")
                .required(true)
                .build();
        pars.add(ticketPar.build());
        return new Docket(DocumentationType.SWAGGER_2)
                .enable(enabled)
                .apiInfo(apiInfo())
                .select()
//                .apis(RequestHandlerSelectors.any())
                .paths(Predicates.not(PathSelectors.regex("/error.*")))
                .build()
                .globalOperationParameters(pars);

    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("pfAdmin接口文档")
                .version("0.0.1-SNAPSHOT")
                .build();
    }
}

