package com.project.eefinal.dao;

import com.project.eefinal.model.Recruitment;

import java.util.List;

public interface RecruitmentDao {
    boolean addRecruitment(Recruitment recruitment);
    boolean delRecruitment(Integer id);
    boolean updateRecruitment(Recruitment recruitment);
    List<Recruitment> queryRecruitment(Recruitment recruitment);
}
