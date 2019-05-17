package com.project.eefinal.service;

import com.project.eefinal.dao.ResumeDao;
import com.project.eefinal.model.Resume;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ResumeService {
    @Resource
    private ResumeDao resumeDao;

    public boolean addResume(Resume resume){
        return resumeDao.addResume(resume);
    }

    public boolean delResume(Integer id){
        return resumeDao.delResume(id);
    }

    public boolean updateResume(Resume resume){
        return resumeDao.updateResume(resume);
    }

    public List<Resume> queryResumes(Resume resume){
        return resumeDao.queryResumes(resume);
    }
}
