package com.project.eefinal.dao;

import com.project.eefinal.model.Staff;

public interface StaffDao {
    Staff queryStaffByNameAndPass(Staff staff);
}
