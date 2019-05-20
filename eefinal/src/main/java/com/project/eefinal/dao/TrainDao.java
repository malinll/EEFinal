package com.project.eefinal.dao;

import com.project.eefinal.model.Train;

import java.util.List;

public interface TrainDao {
    boolean addTrain(Train train);
    boolean delTrain(Integer id);
    boolean updateTrain(Train train);
    List<Train> queryTrains(Train train);
    Integer lastInsertId();
}
