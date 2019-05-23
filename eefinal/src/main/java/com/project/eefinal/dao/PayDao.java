package com.project.eefinal.dao;

import com.project.eefinal.model.Pay;

import java.util.List;

public interface PayDao {
    boolean addPay(Pay pay);
    List<Pay> queryPay(Pay pay);
}
