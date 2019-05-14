package com.project.eefinal.service;

import com.project.eefinal.dao.StaffDao;
import com.project.eefinal.model.Staff;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StaffService {
    @Resource
    private StaffDao staffDao;

    public Staff login(Staff staff){
        return staffDao.queryStaffByNameAndPass(staff);
    }
}
