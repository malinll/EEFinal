package com.project.eefinal.dao;

import com.project.eefinal.model.RewardsPunishment;

import java.util.List;

public interface RewardPunishmentDao {
    boolean addRewardPunishment(RewardsPunishment rewardsPunishment);
    List<RewardsPunishment> queryRewardPunishment(RewardsPunishment rewardsPunishment);
}
