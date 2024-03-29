package me.pf.modules.monitor.service.impl;

import lombok.extern.slf4j.Slf4j;
import me.pf.modules.monitor.domain.Visits;
import me.pf.modules.monitor.repository.VisitsRepository;
import me.pf.modules.monitor.service.VisitsService;
import me.pf.repository.LogRepository;
import me.pf.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author :  PF_23
 * @Description
 * @date : 2019/16/07.
 */
@Slf4j
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class VisitsServiceImpl implements VisitsService {

    @Autowired
    private VisitsRepository visitsRepository;

    @Autowired
    private LogRepository logRepository;

    @Override
    public void save() {
        LocalDate localDate = LocalDate.now();
        Visits visits = visitsRepository.findByDate(localDate.toString());
        if (visits == null) {
            visits = new Visits();
            visits.setWeekDay(StringUtil.getWeekDay());
            visits.setPvCounts(1L);
            visits.setIpCounts(1L);
            visits.setDate(localDate.toString());
            visitsRepository.save(visits);
        }
    }

    @Override
    public void count(HttpServletRequest request) {
        LocalDate localDate = LocalDate.now();
        Visits visits = visitsRepository.findByDate(localDate.toString());
        visits.setPvCounts(visits.getPvCounts() + 1);
        long ipCounts = logRepository.findIp(localDate.toString(), localDate.plusDays(1).toString());
        visits.setIpCounts(ipCounts);
        visitsRepository.save(visits);
    }

    @Override
    public Object get() {
        Map map = new HashMap();
        LocalDate localDate = LocalDate.now();
        Visits visits = visitsRepository.findByDate(localDate.toString());
        List<Visits> list = visitsRepository.findAllVisits(localDate.minusDays(6).toString(), localDate.plusDays(1).toString());

        long recentVisits = 0, recentIp = 0;
        for (Visits data : list) {
            recentVisits += data.getPvCounts();
            recentIp += data.getIpCounts();
        }
        map.put("newVisits", visits.getPvCounts());
        map.put("newIp", visits.getIpCounts());
        map.put("recentVisits", recentVisits);
        map.put("recentIp", recentIp);
        return map;
    }

    @Override
    public Object getChartData() {
        Map map = new HashMap();
        LocalDate localDate = LocalDate.now();
        List<Visits> list = visitsRepository.findAllVisits(localDate.minusDays(6).toString(), localDate.plusDays(1).toString());
        map.put("weekDays", list.stream().map(Visits::getWeekDay).collect(Collectors.toList()));
        map.put("visitsData", list.stream().map(Visits::getPvCounts).collect(Collectors.toList()));
        map.put("ipData", list.stream().map(Visits::getIpCounts).collect(Collectors.toList()));
        return map;
    }
}

