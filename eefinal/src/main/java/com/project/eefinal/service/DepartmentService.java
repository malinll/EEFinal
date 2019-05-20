package com.project.eefinal.service;

import com.project.eefinal.dao.DepartmentDao;
import com.project.eefinal.model.Department;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentService {
    @Resource
    private DepartmentDao departmentDao;

    public boolean addDepartment(Department department){
        return departmentDao.addDepartment(department);
    }

    public boolean delDepartemnt(Integer id){
        return departmentDao.delDepartment(id);
    }

    public boolean updateDepartment(Department department){
        return departmentDao.updateDepartment(department);
    }

    public List<Department> queryDepartments(Department department){
        return departmentDao.queryDepartments(department);
    }
}
