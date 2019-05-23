package com.project.eefinal.controller;

import com.project.eefinal.model.*;
import com.project.eefinal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class TestController {
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
    private StaffService staffService;
    @Resource
    private TrainService trainService;
    @Resource
    private TrainTargetService trainTargetService;
    @Resource
    private ClockService clockService;
    @Resource
    private RewardPunishmentService rewardPunishmentService;

    @RequestMapping("/")
    public String index(HttpServletRequest request){
        Recruitment recruitment = new Recruitment();
        recruitment.setState(1);
        List<Recruitment> recruitments = recruitmentService.queryRecruitment(recruitment);
        request.setAttribute("recruitments",recruitments);
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

    @RequestMapping("/toMain")
    public String toMain(){
        return "main";
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
        Recruitment recruitment = new Recruitment();
        recruitment.setState(1);
        List<Recruitment> recruitments = recruitmentService.queryRecruitment(recruitment);
        session.setAttribute("recruitments",recruitments);
        return "recruit";
    }

    @RequestMapping("toPostResume")
    public String toPostResume(Integer vid,HttpServletRequest request){
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

    @RequestMapping("toAdminMain")
    public String toAdminMain(HttpServletRequest request){
        Resume resume=new Resume();
        Interview interview=new Interview();
        Recruitment recruitment=new Recruitment();
        List<Interview> interviews=interviewService.queryInterviews(interview);
        List<Recruitment> recruitments=new ArrayList<>();
        List<Resume> resumes=new ArrayList<>();
        for (Interview i : interviews) {
            recruitment.setId(i.getRid());
            List<Recruitment> r = recruitmentService.queryRecruitment(recruitment);
            if(!r.isEmpty()){
                recruitments.addAll(r);
            }
            resume.setId(i.getResid());
            List<Resume> res = resumeService.queryResumes(resume);
            if(!res.isEmpty()){
                resumes.addAll(res);
            }
        }
        request.setAttribute("resumes",resumes);
        request.setAttribute("interviews",interviews);
        request.setAttribute("recruitments",recruitments);
        List<Department> departments = departmentService.queryDepartments(new Department());
        Post post=new Post();
//        post.setDid(departments.get(0).getId());
        List<Post> posts = postService.queryPosts(post);
        request.setAttribute("departments",departments);
        request.setAttribute("posts",posts);
        List<Recruitment> rList = recruitmentService.queryRecruitment(new Recruitment());
        request.setAttribute("rList",rList);
        return "adminMain";
    }

    @RequestMapping("toAdminDep")
    public String toAdminDep(HttpServletRequest request){
        List<Department> departments = departmentService.queryDepartments(new Department());
        Post post=new Post();
        post.setDid(departments.get(0).getId());
        List<Post> posts = postService.queryPosts(post);
        request.setAttribute("departments",departments);
        request.setAttribute("posts",posts);
        return "adminDep";
    }

    @RequestMapping("toStaffMain")
    public String toStaffMain(HttpServletRequest request){
        List<Department> departments = departmentService.queryDepartments(new Department());
        Post post=new Post();
        post.setDid(departments.get(0).getId());
        List<Post> posts = postService.queryPosts(post);
        Staff staff=new Staff();
        staff.setPid(posts.get(0).getId());
        List<Staff> staffs=staffService.queryStaffs(staff);
        request.setAttribute("departments",departments);
        request.setAttribute("posts",posts);
        request.setAttribute("staffs",staffs);
        return "staffMain";
    }

    @RequestMapping("toTrain")
    public String toTrain(HttpServletRequest request){
        List<Staff> staffs = staffService.queryStaffs(new Staff());
        request.setAttribute("staffs",staffs);
        List<Train> trains = trainService.queryTrains(new Train());
        request.setAttribute("trains",trains);
        TrainTarget trainTarget=new TrainTarget();
        List<List<TrainTarget>> trainTargets=new ArrayList<>();
        List<Staff> tt;
        List<List<Staff>> tts=new ArrayList<>();
        Staff staff=new Staff();
        for (Train train : trains) {
            trainTarget.setTrid(train.getId());
            trainTargets.add(trainTargetService.queryTrainTarget(trainTarget));
        }
        for (List<TrainTarget> targets : trainTargets) {
            tt=new ArrayList<>();
            for (TrainTarget target : targets) {
                staff.setId(target.getSid());
                tt.add(staffService.queryStaffs(staff).get(0));
            }
            tts.add(tt);
        }
        request.setAttribute("tt",tts);
        return "train";
    }

    @RequestMapping("toClock")
    public String toClock(Integer sid,HttpServletRequest request){
        Clock clock = new Clock();
        clock.setSid(sid);
        List<Clock> clocks = clockService.queryClock(clock);
        Calendar cal=Calendar.getInstance();
        for (Clock c : clocks) {
            cal.setTime(c.getTime());
            if (cal.get(Calendar.DATE)== Calendar.getInstance().get(Calendar.DATE) &&
                    cal.get(Calendar.MONTH)==Calendar.getInstance().get(Calendar.MONTH)){
                if (c.getState()==1){
                    request.setAttribute("to",c);
                }else {
                    request.setAttribute("off",c);
                }
            }
        }
        return "clock";
    }

    @RequestMapping("toAdminPay")
    public String toAdminPay(HttpServletRequest request){
        RewardsPunishment rp=new RewardsPunishment();
        int num;
        List<Staff> staffs = staffService.queryStaffs(new Staff());
        List<Integer> rps=new ArrayList<>();
        for (Staff staff : staffs) {
            num=0;
            rp.setSid(staff.getId());
            List<RewardsPunishment> rewardsPunishments = rewardPunishmentService.queryRewardPunishment(rp);
            for (RewardsPunishment rewardsPunishment : rewardsPunishments) {
                if(rewardsPunishment.getState()==1){
                    num+=rewardsPunishment.getMoney();
                }else {
                    num-=rewardsPunishment.getMoney();
                }
            }
            rps.add(num);
        }
        request.setAttribute("staffs",staffs);
        request.setAttribute("rps",rps);
        return "adminPay";
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
