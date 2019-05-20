package com.project.eefinal.service;

import com.project.eefinal.dao.StaffDao;
import com.project.eefinal.model.Staff;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StaffService {
    @Resource
    private StaffDao staffDao;

    public Staff login(Staff staff){
        List<Staff> s = staffDao.queryStaffs(staff);
        if(s.isEmpty()) {
            return null;
        }
        return s.get(0);
    }

    public boolean updateStaff(Staff staff){
        return staffDao.updateStaff(staff);
    }

    public List<Staff> queryStaffs(Staff staff){
        return staffDao.queryStaffs(staff);
    }
}
