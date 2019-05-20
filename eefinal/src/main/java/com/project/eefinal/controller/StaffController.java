package com.project.eefinal.controller;

import com.project.eefinal.model.Staff;
import com.project.eefinal.service.StaffService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StaffController {
    @Resource
    private StaffService staffService;

    @RequestMapping("staffLogin")
    public String staffLogin(String name, String pass, HttpSession session){
        Staff staff = new Staff();
        staff.setName(name);
        staff.setPass(pass);
        Staff s = staffService.login(staff);
        if(s!=null){
            session.setAttribute("staff",s);
            return "forward:toStaffMain";
        }else {
            return "login";
        }
    }

    @RequestMapping("queryStaffsByPost")
    @ResponseBody
    public List<Staff> queryStaffsByPost(Integer pid){
        Staff staff=new Staff();
        staff.setPid(pid);
        return staffService.queryStaffs(staff);
    }

    @RequestMapping("queryStaffById")
    @ResponseBody
    public Staff queryStaffById(Integer id){
        Staff staff=new Staff();
        staff.setId(id);
        return staffService.queryStaffs(staff).get(0);
    }
}
