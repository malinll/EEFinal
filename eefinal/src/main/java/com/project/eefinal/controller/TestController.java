package com.project.eefinal.controller;

import com.project.eefinal.model.Recruitment;
import com.project.eefinal.model.Resume;
import com.project.eefinal.service.RecruitmentService;
import com.project.eefinal.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TestController {
    @Resource
    private ResumeService resumeService;
    @Resource
    private RecruitmentService recruitmentService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("toCheckResume")
    public String toCheckResume(Integer vid, HttpServletRequest request){
        Resume resume = new Resume();
        resume.setVid(vid);
        List<Resume> resumes = resumeService.queryResumes(resume);
        request.setAttribute("resumes",resumes);
        return "checkResume";
    }

    @RequestMapping("toRecruit")
    public String toRecruit(HttpSession session){
        List<Recruitment> recruitments = recruitmentService.queryRecruitment(new Recruitment());
        session.setAttribute("recruitments",recruitments);
        return "recruit";
    }

    @RequestMapping("toPostResume")
    public String toPostResume(Integer rid, Integer vid,HttpServletRequest request){
        Resume resume = new Resume();
        resume.setVid(vid);
        resumeService.queryResumes(resume);
        List<Resume> resumes = resumeService.queryResumes(resume);
        request.setAttribute("resumes",resumes);
        return "postResume";
    }

    @RequestMapping("/login")
    public String login(String rank){
        if("visitor".equals(rank)){
            return "forward:visitorLogin";
        }else if("staff".equals(rank)){
            return "forward:staffLogin";
        }else{
            return "forward:adminLogin";
        }
    }
}
