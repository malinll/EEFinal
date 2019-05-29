package com.project.eefinal.controller;

import com.project.eefinal.model.*;
import com.project.eefinal.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
    @Resource
    private StaffService staffService;
    @Resource
    private PayService payService;
    @Resource
    private RewardPunishmentService rewardPunishmentService;
    @Resource
    private ClockService clockService;

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
    public String inviteToInterview(Integer iid,String time,String site){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(11);
        i.setTime(time.replace("T"," "));
        i.setSite(site);
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
    public String hire(Integer iid,Integer resid,Integer rid){
        Interview interview=new Interview();
        interview.setId(iid);
        List<Interview> interviews = interviewService.queryInterviews(interview);
        Interview i = interviews.get(0);
        i.setState(15);
        interviewService.updateInterview(i);

        Resume resume=new Resume();
        resume.setId(resid);
        Resume res = resumeService.queryResumes(resume).get(0);
        Recruitment recruitment=new Recruitment();
        recruitment.setId(rid);
        Recruitment r = recruitmentService.queryRecruitment(recruitment).get(0);
        Staff staff=new Staff();
        staff.setPid(r.getPid());
        staff.setName(res.getName());
        staff.setPass(res.getPhone().toString());
        staff.setGender(res.getGender());
        staff.setBirth(res.getBirth());
        staff.setNation(res.getNation());
        staff.setNativePlace(res.getNativePlace());
        staff.setPhone(res.getPhone());
        staff.setAddress(res.getAddress());
        staff.setEmail(res.getEmail());
        staff.setState(0);
        staff.setMoney(r.getPay());
        staffService.addStaff(staff);

        return "forward:toAdminMain";
    }

    @RequestMapping("addDep")
    public String addDep(Department department){
        //重名判断
        boolean flag=true;
        List<Department> departments = departmentService.queryDepartments(new Department());
        for (Department d : departments) {
            if(department.getName().equals(d.getName())){
                flag=false;
                break;
            }
        }
        if(flag){
            department.setDate(new Date());
            departmentService.addDepartment(department);
        }
        return "forward:toAdminDep";
    }

    @RequestMapping("updateDep")
    public String updateDep(Department department){
        //重名判断
        boolean flag=true;
        List<Department> departments = departmentService.queryDepartments(new Department());
        for (Department d : departments) {
            if(department.getName().equals(d.getName())){
                flag=false;
                break;
            }
        }
        if(flag){
            departmentService.updateDepartment(department);
        }
        return "forward:toAdminDep";
    }

    @RequestMapping("delDep")
    public String delDep(Integer id){
        boolean flag=true;
        Post post=new Post();
        Staff staff=new Staff();
        post.setDid(id);
        List<Post> posts = postService.queryPosts(post);
        for (Post p : posts) {
            staff.setPid(p.getId());
            if(staffService.queryStaffs(staff).size()!=0){
                flag=false;
                break;
            }
        }
        if(flag){
            departmentService.delDepartemnt(id);
            postService.delPost(post);
        }
        return "forward:toAdminDep";
    }

    @RequestMapping("addPost")
    public String addPost(Post post){
        //重名判断
        boolean flag=true;
        List<Post> posts = postService.queryPosts(new Post());
        for (Post p : posts) {
            if(post.getName().equals(p.getName())){
                flag=false;
                break;
            }
        }
        if(flag) {
            postService.addPost(post);
        }
        return "forward:toAdminDep";
    }

    @RequestMapping("updatePost")
    public String updatePost(Post post){
        //重名判断
        boolean flag=true;
        List<Post> posts = postService.queryPosts(new Post());
        for (Post p : posts) {
            if(post.getName().equals(p.getName())){
                flag=false;
                break;
            }
        }
        if(flag) {
            postService.updatePost(post);
        }
        return "forward:toAdminDep";
    }

    @RequestMapping("delPost")
    public String delPost(Integer id){
        Staff staff=new Staff();
        staff.setPid(id);
        Post post=new Post();
        if(staffService.queryStaffs(staff)==null){
            post.setId(id);
            postService.delPost(post);
        }
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
        Integer pid = recruitment.getPid();
        Post post=new Post();
        post.setId(pid);
        Post p = postService.queryPosts(post).get(0);
        recruitment.setJob(p.getName());
        Integer did = recruitment.getDid();
        Department department= new Department();
        department.setId(did);
        Department d = departmentService.queryDepartments(department).get(0);
        recruitment.setCompany(d.getName());
        recruitment.setState(1);
        recruitmentService.addRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("updateRec")
    public String updateRec(Recruitment recruitment){
        Integer pid = recruitment.getPid();
        Post post=new Post();
        post.setId(pid);
        Post p = postService.queryPosts(post).get(0);
        recruitment.setJob(p.getName());
        Integer did = recruitment.getDid();
        Department department= new Department();
        department.setId(did);
        Department d = departmentService.queryDepartments(department).get(0);
        recruitment.setCompany(d.getName());
        recruitment.setState(1);
        recruitmentService.updateRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("repealRec")
    public String repealRec(Recruitment recruitment){
        recruitment.setState(0);
        recruitmentService.updateRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("delRec")
    public String delRec(Integer id){
        recruitmentService.delRecruitment(id);
        return "forward:toAdminMain";
    }

    @RequestMapping("recruitDraft")
    public String recruitDraft(Recruitment recruitment){
        Integer pid = recruitment.getPid();
        Post post=new Post();
        post.setId(pid);
        Post p = postService.queryPosts(post).get(0);
        recruitment.setJob(p.getName());
        Integer did = recruitment.getDid();
        Department department= new Department();
        department.setId(did);
        Department d = departmentService.queryDepartments(department).get(0);
        recruitment.setCompany(d.getName());
        recruitment.setState(0);
        recruitmentService.addRecruitment(recruitment);
        return "forward:toAdminMain";
    }

    @RequestMapping("addTrain")
    public String addTrain(Train train,String datetime,Integer[] staff) {
        train.setState(1);
        train.setTime(datetime.replace("T"," "));
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

    @RequestMapping("delTrain")
    public String delTrain(Integer id){
        trainService.delTrain(id);
        TrainTarget trainTarget=new TrainTarget();
        trainTarget.setTrid(id);
        trainTargetService.delTrainTarget(trainTarget);
        return "forward:toTrain";
    }

    @RequestMapping("updateTrain")
    public String updateTrain(Train train,String datetime,Integer[] staff) {
        train.setState(1);
        train.setTime(datetime.replace("T"," "));
        trainService.updateTrain(train);
        Integer trid = train.getId();
        TrainTarget trainTarget =new TrainTarget();
        trainTarget.setTrid(trid);
        trainTargetService.delTrainTarget(trainTarget);
        for (int i = 0; i < staff.length; i++) {
            trainTarget.setSid(staff[i]);
            trainTargetService.addTrainTarget(trainTarget);
        }
        return "forward:toTrain";
    }

    @RequestMapping("trainDraft")
    public String trainDraft(Train train,String datetime,Integer[] staff) {
        train.setState(0);
        train.setTime(datetime.replace("T"," "));
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

    @RequestMapping("changeState")
    public String changeState(Staff staff){
        if(staff.getId()!=null){
            staff.setState(1);
            staffService.updateStaff(staff);
        }
        return "forward:toAdminSM";
    }

    @RequestMapping("fire")
    public String fire(Staff staff){
        if(staff.getId()!=null){
            staff.setState(2);
            staffService.updateStaff(staff);
        }
        return "forward:toAdminSM";
    }

    @RequestMapping("changePost")
    public String changePost(Staff staff){
        staffService.updateStaff(staff);
        return "forward:toAdminSM";
    }

    @RequestMapping("payoff")
    public String payoff(Pay pay){
        int month = Calendar.getInstance().get(Calendar.MONTH);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        pay.setTime(year+"-"+month);
        payService.addPay(pay);
        return "forward:toAdminPay";
    }

    @RequestMapping("agreeReconsider")
    public String agreeReconsider(RewardsPunishment rewardsPunishment, Integer index, HttpSession session){
        List<RewardsPunishment> rps = (List<RewardsPunishment>) session.getAttribute("reconsider");
        int i=index;
        rps.remove(i);
        session.setAttribute("reconsider",rps);
        rewardsPunishment.setTime(new Date());
        rewardPunishmentService.addRewardPunishment(rewardsPunishment);
        return "forward:toAdminPay";
    }

    @RequestMapping("queryClockByMonth2")
    @ResponseBody
    public List<Clock> queryClockByMonth2(int month,int id){
        Clock clock=new Clock();
        clock.setSid(id);
        List<Clock> clocks = clockService.queryClock(clock);
        List<Clock> cs=new ArrayList<>();
        Calendar cal=Calendar.getInstance();
        for (Clock c : clocks) {
            cal.setTime(c.getTime());
            if(cal.get(Calendar.MONTH)==month-1){
                cs.add(c);
            }
        }
        return cs;
    }


    @RequestMapping("addRP")
    public String addRP(RewardsPunishment rewardsPunishment){
        rewardsPunishment.setTime(new Date());
        rewardPunishmentService.addRewardPunishment(rewardsPunishment);
        return "forward:toAdminSM";
    }
}
