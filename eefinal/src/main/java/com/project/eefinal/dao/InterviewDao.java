package com.project.eefinal.dao;

import com.project.eefinal.model.Interview;

import java.util.List;

public interface InterviewDao {
    boolean addInterview(Interview interview);
    boolean updateInterview(Interview interview);
    List<Interview> queryInterviews(Interview interview);
}
