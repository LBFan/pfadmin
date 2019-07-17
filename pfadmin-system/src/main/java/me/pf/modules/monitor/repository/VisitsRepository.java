package me.pf.modules.monitor.repository;

import me.pf.modules.monitor.domain.Visits;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Component
public interface VisitsRepository extends JpaRepository<Visits, Long> {

    /**
     * findByDate
     *
     * @param date
     * @return
     */
    Visits findByDate(String date);

    /**
     * 获得一个时间段的记录
     *
     * @param date1
     * @param date2
     * @return
     */
    @Query(value = "select * FROM visits where " +
            "create_time between ?1 and ?2", nativeQuery = true)
    List<Visits> findAllVisits(String date1, String date2);
}

