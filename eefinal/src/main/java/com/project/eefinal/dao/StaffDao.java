package com.project.eefinal.dao;

import com.project.eefinal.model.Staff;

import java.util.List;

public interface StaffDao {
    boolean updateStaff(Staff staff);
    List<Staff> queryStaffs(Staff staff);
}
