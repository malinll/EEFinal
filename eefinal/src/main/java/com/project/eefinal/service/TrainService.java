package com.project.eefinal.service;

import com.project.eefinal.dao.TrainDao;
import com.project.eefinal.model.Train;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TrainService {
    @Resource
    private TrainDao trainDao;

    public boolean addTrain(Train train){
        return trainDao.addTrain(train);
    }

    public boolean delTrain(Integer id){
        return trainDao.delTrain(id);
    }

    public boolean updateTrain(Train train){
        return trainDao.updateTrain(train);
    }

    public List<Train> queryTrains(Train train){
        return trainDao.queryTrains(train);
    }

    public Integer lastInsertId(){
        return trainDao.lastInsertId();
    }
}
