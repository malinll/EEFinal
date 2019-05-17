package com.project.eefinal.controller;

import com.project.eefinal.model.Interview;
import com.project.eefinal.model.Recruitment;
import com.project.eefinal.model.Resume;
import com.project.eefinal.service.InterviewService;
import com.project.eefinal.service.RecruitmentService;
import com.project.eefinal.service.ResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {
    @Resource
    private ResumeService resumeService;
    @Resource
    private RecruitmentService recruitmentService;
    @Resource
    private InterviewService interviewService;

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

    @RequestMapping("toMyPost")
    public String toMyPost(Integer vid,HttpServletRequest request){
        Resume resume=new Resume();
        Interview interview=new Interview();
        Recruitment recruitment=new Recruitment();
        resume.setVid(vid);
        List<Resume> resumes = resumeService.queryResumes(resume);
        List<Integer> resids=new ArrayList<>();
        List<Interview> interviews=new ArrayList<>();
        List<Recruitment> recruitments=new ArrayList<>();
        for (Resume r : resumes) {
            resids.add(r.getId());
        }
        for (Integer resid : resids) {
            interview.setResid(resid);
            List<Interview> iv = interviewService.queryInterviews(interview);
            if(!iv.isEmpty()){
                interviews.addAll(iv);
            }
        }
        for (Interview i : interviews) {
            recruitment.setId(i.getRid());
            List<Recruitment> r = recruitmentService.queryRecruitment(recruitment);
            if(!r.isEmpty()){
                recruitments.addAll(r);
            }
        }
        request.setAttribute("interviews",interviews);
        request.setAttribute("recruitments",recruitments);
        return "myPost";
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
