package com.project.eefinal.controller;

import com.project.eefinal.model.Interview;
import com.project.eefinal.model.Resume;
import com.project.eefinal.model.Visitor;
import com.project.eefinal.service.InterviewService;
import com.project.eefinal.service.ResumeService;
import com.project.eefinal.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class VisitorController {
    @Resource
    private VisitorService visitorService;
    @Resource
    private ResumeService resumeService;
    @Resource
    private InterviewService interviewService;

    @RequestMapping("/visitorLogin")
    public String visitorLogin(Visitor visitor, HttpSession session){
        Visitor v = visitorService.login(visitor);
        if(v!=null){
           session.setAttribute("visitor",v);
           return "main";
       }else {
           return "login";
       }
    }

    @RequestMapping("/register")
    public String register(Visitor visitor){
        if(visitorService.addVisitor(visitor)){
            return "login";
        }else {
            return "register";
        }
    }
    @RequestMapping("checkVisitorName")
    public void checkVisitorName(String name, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        Visitor visitor = visitorService.checkVisitorName(name);
        if(visitor==null){
            response.getWriter().write("<font color='green'>&emsp;<strong>√</strong>该用户名可用</font>,true");
        }else {
            response.getWriter().write("<font color='red'>&emsp;<strong>×</strong>该用户名已存在</font>,false");
        }
    }

    @RequestMapping("addResume")
    public String addResume(Resume resume){
        resumeService.addResume(resume);
        return "main";
    }

    @RequestMapping("delResume")
    public String delResume(Integer id){
        resumeService.delResume(id);
        return "forward:toCheckResume";
    }

    @RequestMapping("updateResume")
    public String updateResume(Resume resume){
        resumeService.updateResume(resume);
        return "forward:toCheckResume";
    }

    @RequestMapping("pr")
    public String postResume(Integer resid,Integer rid){
        Interview interview = new Interview();
        interview.setResid(resid);
        interview.setRid(rid);
        interview.setState(0);
        interviewService.addInterview(interview);
        return "forward:toRecruit";
    }

    @RequestMapping("confirmInterview")
    public String confirmInterview(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(13);
        interviewService.updateInterview(i);
        return "forward:toMyPost";
    }

    @RequestMapping("cancelInterview")
    public String cancelInterview(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(14);
        interviewService.updateInterview(i);
        return "forward:toMyPost";
    }


}
