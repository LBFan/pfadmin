package me.pf.swagger2;

import com.fasterxml.classmate.TypeResolver;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.data.domain.Pageable;
import springfox.documentation.schema.AlternateTypeRule;
import springfox.documentation.schema.AlternateTypeRuleConvention;

import java.util.List;

import static com.google.common.collect.Lists.newArrayList;
import static springfox.documentation.schema.AlternateTypeRules.newRule;

/**
 * 将Pageable转换展示在swagger中
 */
@Configuration
public class SwaggerDataConfig {

    @Bean
    public AlternateTypeRuleConvention pageableConvention(final TypeResolver resolver) {
        return new AlternateTypeRuleConvention() {
            @Override
            public int getOrder() {
                return Ordered.HIGHEST_PRECEDENCE;
            }

            @Override
            public List<AlternateTypeRule> rules() {
                return newArrayList(newRule(resolver.resolve(Pageable.class), resolver.resolve(Page.class)));
            }
        };
    }

    @ApiModel
    static class Page {
        @ApiModelProperty("页码 (0..N)")
        private Integer page;

        @ApiModelProperty("每页显示的数目")
        private Integer size;

        @ApiModelProperty("以下列格式排序标准：property[,asc | desc]。 默认排序顺序为升序。 支持多种排序条件：如：id,asc")
        private List<String> sort;

        public Integer getPage() {
            return page;
        }

        public void setPage(Integer page) {
            this.page = page;
        }

        public Integer getSize() {
            return size;
        }

        public void setSize(Integer size) {
            this.size = size;
        }

        public List<String> getSort() {
            return sort;
        }

        public void setSort(List<String> sort) {
            this.sort = sort;
        }
    }
}