package com.project.eefinal.controller;

import com.project.eefinal.model.Staff;
import com.project.eefinal.service.StaffService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
}
