package me.pf.service.impl;

import cn.hutool.core.util.ObjectUtil;
import me.pf.domain.GenConfig;
import me.pf.domain.vo.ColumnInfo;
import me.pf.domain.vo.TableInfo;
import me.pf.exception.BadRequestException;
import me.pf.service.GeneratorService;
import me.pf.utils.GenUtil;
import me.pf.utils.PageUtils;
import me.pf.utils.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/13/07.
 */

@Service
public class GeneratorServiceImpl implements GeneratorService {

    @PersistenceContext
    private EntityManager em;


    @Override
    public Object getTables(String name, int[] startEnd) {
        // 使用预编译防止sql注入
        String sql = "select table_name ,create_time , engine, table_collation, table_comment from information_schema.tables " +
                "where table_schema = (select database()) " +
                "and table_name like ? order by create_time desc";
        Query query = em.createNativeQuery(sql);
        query.setFirstResult(startEnd[0]);
        query.setMaxResults(startEnd[1] - startEnd[0]);
        query.setParameter(1, StringUtil.isNoneBlank(name) ? ("%" + name + "%") : "%%");
        List<Object[]> result = query.getResultList();
        List<TableInfo> tableInfos = new ArrayList<>();
        for (Object[] obj : result) {
            tableInfos.add(new TableInfo(obj[0], obj[1], obj[2], obj[3], ObjectUtil.isNotEmpty(obj[4]) ? obj[4] : "-"));
        }
        Query query1 = em.createNativeQuery("SELECT COUNT(*) from information_schema.tables where table_schema = (select database())");
        Object totslElements = query1.getSingleResult();
        return PageUtils.toPage(tableInfos, totslElements);
    }

    @Override
    public Object getColumns(String name) {
// 使用预编译防止sql注入
        String sql = "select column_name, is_nullable, data_type, column_comment, column_key, extra from information_schema.columns " +
                "where table_name = ? and table_schema = (select database()) order by ordinal_position";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, StringUtils.isNotBlank(name) ? name : null);
        List<Object[]> result = query.getResultList();
        List<ColumnInfo> columnInfos = new ArrayList<>();
        for (Object[] obj : result) {
            columnInfos.add(new ColumnInfo(obj[0], obj[1], obj[2], obj[3], obj[4], obj[5], null, "true"));
        }
        return PageUtils.toPage(columnInfos, columnInfos.size());
    }

    @Override
    public void generator(List<ColumnInfo> columnInfos, GenConfig genConfig, String tableName) {
        if (genConfig.getId() == null) {
            throw new BadRequestException("请先配置生成器");
        }
        try {
            GenUtil.generatorCode(columnInfos, genConfig, tableName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}

