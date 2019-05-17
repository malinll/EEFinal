package com.project.eefinal.dao;

import com.project.eefinal.model.Resume;

import java.util.List;

public interface ResumeDao {
    boolean addResume(Resume resume);
    boolean delResume(Integer id);
    boolean updateResume(Resume resume);
    List<Resume> queryResumes(Resume resume);
}
