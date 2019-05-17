package com.project.eefinal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping("adminLogin")
    public String adminLogin(String name,String pass){
        if("admin".equals(name) && "admin".equals(pass)){
            return "adminMain";
        }
        return "login";

    }
}
