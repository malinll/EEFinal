package com.project.eefinal.controller;

import com.project.eefinal.model.Staff;
import com.project.eefinal.service.StaffService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class TestController {
    @Resource
    private StaffService staffService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/login")
    public String login(Staff staff){
        if(staffService.login(staff)!=null){
            return "main";
        }else {
            return "index";
        }
    }
}
