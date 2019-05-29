package com.project.eefinal.service;

import com.project.eefinal.dao.PayDao;
import com.project.eefinal.model.Pay;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PayService {
    @Resource
    private PayDao payDao;

    public boolean addPay(Pay pay){
        return payDao.addPay(pay);
    }

    public List<Pay> queryPay(Pay pay){
        return payDao.queryPay(pay);
    }
}
