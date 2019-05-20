package com.project.eefinal.service;

import com.project.eefinal.dao.RecruitmentDao;
import com.project.eefinal.model.Recruitment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RecruitmentService {
    @Resource
    private RecruitmentDao recruitmentDao;

    public boolean addRecruitment(Recruitment recruitment){
        return recruitmentDao.addRecruitment(recruitment);
    }

    public List<Recruitment> queryRecruitment(Recruitment recruitment){
        return recruitmentDao.queryRecruitment(recruitment);
    }
}
