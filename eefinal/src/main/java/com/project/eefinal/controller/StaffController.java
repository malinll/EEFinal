package com.project.eefinal.controller;

import com.project.eefinal.model.Clock;
import com.project.eefinal.model.RewardsPunishment;
import com.project.eefinal.model.Staff;
import com.project.eefinal.service.ClockService;
import com.project.eefinal.service.RewardPunishmentService;
import com.project.eefinal.service.StaffService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class StaffController {
    @Resource
    private StaffService staffService;
    @Resource
    private ClockService clockService;
    @Resource
    private RewardPunishmentService rewardPunishmentService;

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

    @RequestMapping("goToWork")
    public String goToWork(Integer sid){
        Clock clock = new Clock();
        clock.setSid(sid);
        Date date = new Date();
        Calendar cal=Calendar.getInstance();
        cal.setTime(date);
        clock.setTime(date);
        clock.setState(1);
        if(cal.get(Calendar.HOUR_OF_DAY)<9){
            clock.setLoe(0);
        }else if(cal.get(Calendar.HOUR_OF_DAY)<12){
            RewardsPunishment rp=new RewardsPunishment();
            rp.setSid(sid);
            rp.setMoney(100);
            rp.setState(2);
            rp.setTime(date);
            rp.setReason("迟到");
            rewardPunishmentService.addRewardPunishment(rp);
            clock.setLoe(1);
        }else {
            RewardsPunishment rp=new RewardsPunishment();
            rp.setSid(sid);
            rp.setMoney(300);
            rp.setState(2);
            rp.setTime(date);
            rp.setReason("旷工");
            rewardPunishmentService.addRewardPunishment(rp);
            clock.setLoe(2);
        }
        clockService.addClock(clock);
        return "forward:toClock";
    }

    @RequestMapping("offWork")
    public String offWork(Integer sid){
        Clock clock = new Clock();
        clock.setSid(sid);
        Date date = new Date();
        Calendar cal=Calendar.getInstance();
        cal.setTime(date);
        clock.setTime(date);
        clock.setState(2);
        if(cal.get(Calendar.HOUR_OF_DAY)>=18){
            clock.setLoe(0);
        }else if(cal.get(Calendar.HOUR_OF_DAY)>=15){
            RewardsPunishment rp=new RewardsPunishment();
            rp.setSid(sid);
            rp.setMoney(100);
            rp.setState(2);
            rp.setTime(date);
            rp.setReason("早退");
            rewardPunishmentService.addRewardPunishment(rp);
            clock.setLoe(1);
        }else {
            Clock cl=new Clock();
            List<Clock> clocks = clockService.queryClock(cl);
            for (Clock c : clocks) {
                cal.setTime(c.getTime());
                if (!(cal.get(Calendar.DATE)== Calendar.getInstance().get(Calendar.DATE) &&
                        cal.get(Calendar.MONTH)==Calendar.getInstance().get(Calendar.MONTH) &&
                        c.getState()==1 &&c.getLoe()==2)){
                    RewardsPunishment rp=new RewardsPunishment();
                    rp.setSid(sid);
                    rp.setMoney(300);
                    rp.setState(2);
                    rp.setTime(date);
                    rp.setReason("旷工");
                    rewardPunishmentService.addRewardPunishment(rp);
                    break;
                }
            }
            clock.setLoe(2);
        }
        clockService.addClock(clock);
        return "forward:toClock";
    }
}
