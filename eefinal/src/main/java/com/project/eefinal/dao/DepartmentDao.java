package com.project.eefinal.dao;

import com.project.eefinal.model.Department;

import java.util.List;

public interface DepartmentDao {
    boolean addDepartment(Department department);
    boolean delDepartment(Integer id);
    boolean updateDepartment(Department department);
    List<Department> queryDepartments(Department department);
}
