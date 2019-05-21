package com.project.eefinal.service;

import com.project.eefinal.dao.TrainTargetDao;
import com.project.eefinal.model.TrainTarget;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TrainTargetService {
    @Resource
    private TrainTargetDao trainTargetDao;

    public boolean addTrainTarget(TrainTarget trainTarget){
        return trainTargetDao.addTrainTarget(trainTarget);
    }

    public boolean delTrainTarget(TrainTarget trainTarget){
        return trainTargetDao.delTrainTarget(trainTarget);
    }

    public List<TrainTarget> queryTrainTarget(TrainTarget trainTarget){
        return trainTargetDao.queryTrainTarget(trainTarget);
    }
}
