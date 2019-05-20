package com.project.eefinal.controller;

import com.project.eefinal.model.*;
import com.project.eefinal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {
    @Resource
    private ResumeService resumeService;
    @Resource
    private RecruitmentService recruitmentService;
    @Resource
    private InterviewService interviewService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private PostService postService;
    @Resource
    private TrainService trainService;
    @Resource
    private TrainTargetService trainTargetService;

    @RequestMapping("adminLogin")
    public String adminLogin(String name, String pass, HttpServletRequest request){
        if("admin".equals(name) && "admin".equals(pass)){
            return "forward:toAdminMain";
        }
        return "login";
    }

    @RequestMapping("adminCheckResume")
    public String adminCheckResume(Integer iid,Integer resid,HttpServletRequest request){
        Resume resume=new Resume();
        Interview interview=new Interview();
        resume.setId(resid);
        interview.setId(iid);
        List<Resume> resumes = resumeService.queryResumes(resume);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(1);
        interviewService.updateInterview(i);
        request.setAttribute("resume",resumes.get(0));
        request.setAttribute("iid",iid);
        return "adminCheckResume";
    }

    @RequestMapping("inviteToInterview")
    public String inviteToInterview(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(11);
        interviewService.updateInterview(i);
        return "forward:toAdminMain";
    }

    @RequestMapping("resumeReject")
    public String resumeReject(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(2);
        interviewService.updateInterview(i);
        return "forward:toAdminMain";
    }

    @RequestMapping("interviewReject")
    public String interviewReject(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(12);
        interviewService.updateInterview(i);
        return "forward:toAdminMain";
    }

    @RequestMapping("hire")
    public String hire(Integer iid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(15);
        interviewService.updateInterview(i);
        return "forward:toAdminMain";
    }

    @RequestMapping("addDep")
    public String addDep(Department department){
        department.setDate(new Date());
        departmentService.addDepartment(department);
        return "forward:toAdminDep";
    }

    @RequestMapping("updateDep")
    public String updateDep(Department department){
        departmentService.updateDepartment(department);
        return "forward:toAdminDep";
    }

    @RequestMapping("delDep")
    public String delDep(Integer id){
        //未判断该部门是否有员工
        departmentService.delDepartemnt(id);
        return "forward:toAdminDep";
    }

    @RequestMapping("addPost")
    public String addPost(Post post){
        postService.addPost(post);
        return "forward:toAdminDep";
    }

    @RequestMapping("updatePost")
    public String updatePost(Post post){
        postService.updatePost(post);
        return "forward:toAdminDep";
    }

    @RequestMapping("delPost")
    public String delPost(Integer id){
        //未判断该职位是否有员工
        postService.delPost(id);
        return "forward:toAdminDep";
    }



    @RequestMapping("queryPostsByDep")
    @ResponseBody
    public List<Post> queryPostsByDep(Integer did){
        Post post=new Post();
        post.setDid(did);
        return postService.queryPosts(post);
    }

    @RequestMapping("addRecruit")
    public String addRecruit(Recruitment recruitment){
        System.out.println(recruitment.getCompany());
        System.out.println(recruitment.getDescription());
        recruitment.setState(1);
        recruitmentService.addRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("recruitDraft")
    public String recruitDraft(Recruitment recruitment){
        recruitment.setState(0);
        recruitmentService.addRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("addTrain")
    public String addTrain(Train train,Integer[] staff){
        train.setState(1);
        trainService.addTrain(train);
        Integer trid = trainService.lastInsertId();
        TrainTarget trainTarget=new TrainTarget();
        trainTarget.setTrid(trid);
        for (int i = 0; i < staff.length; i++) {
            trainTarget.setSid(staff[i]);
            trainTargetService.addTrainTarget(trainTarget);
        }
        return "forward:toTrain";
    }

    @RequestMapping("trainDraft")
    public String trainDraft(Train train,Integer[] staff){
        train.setState(0);
        trainService.addTrain(train);
        for (int i = 0; i < staff.length; i++) {

        }
        return "forward:toTrain";
    }
}
