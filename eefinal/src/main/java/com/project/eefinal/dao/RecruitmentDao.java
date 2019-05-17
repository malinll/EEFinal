package com.project.eefinal.dao;

import com.project.eefinal.model.Recruitment;

import java.util.List;

public interface RecruitmentDao {
    List<Recruitment> queryRecruitment(Recruitment recruitment);
}
