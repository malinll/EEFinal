package com.project.eefinal.dao;

import com.project.eefinal.model.TrainTarget;

import java.util.List;

public interface TrainTargetDao {
    boolean addTrainTarget(TrainTarget trainTarget);
    List<TrainTarget> queryTrainTarget(TrainTarget trainTarget);
}
