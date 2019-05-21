package com.project.eefinal.service;

import com.project.eefinal.dao.RewardPunishmentDao;
import com.project.eefinal.model.RewardsPunishment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RewardPunishmentService {
    @Resource
    private RewardPunishmentDao rewardPunishmentDao;

    public boolean addRewardPunishment(RewardsPunishment rewardsPunishment){
        return rewardPunishmentDao.addRewardPunishment(rewardsPunishment);
    }

    public List<RewardsPunishment> queryRewardPunishment(RewardsPunishment rewardsPunishment){
        return rewardPunishmentDao.queryRewardPunishment(rewardsPunishment);
    }
}
