package com.project.eefinal.dao;

import com.project.eefinal.model.Clock;

import java.util.List;

public interface ClockDao {
    boolean addClock(Clock clock);
    List<Clock> queryClock(Clock clock);
}
