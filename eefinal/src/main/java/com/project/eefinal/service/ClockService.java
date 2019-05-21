package com.project.eefinal.service;

import com.project.eefinal.dao.ClockDao;
import com.project.eefinal.model.Clock;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClockService {
    @Resource
    private ClockDao clockDao;

    public boolean addClock(Clock clock){
        return clockDao.addClock(clock);
    }

    public List<Clock> queryClock(Clock clock){
        return clockDao.queryClock(clock);
    }
}
