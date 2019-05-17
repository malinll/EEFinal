package com.project.eefinal.service;

import com.project.eefinal.dao.InterviewDao;
import com.project.eefinal.model.Interview;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InterviewService {
    @Resource
    private InterviewDao interviewDao;

    public boolean addInterview(Interview interview){
        return interviewDao.addInterview(interview);
    }

    public boolean updateInterview(Interview interview){
        return interviewDao.updateInterview(interview);
    }

    public List<Interview> queryInterviews(Interview interview){
        return interviewDao.queryInterviews(interview);
    }
}
