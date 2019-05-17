package com.project.eefinal.service;

import com.project.eefinal.dao.VisitorDao;
import com.project.eefinal.model.Visitor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VisitorService {
    @Resource
    private VisitorDao visitorDao;

    public boolean addVisitor(Visitor visitor){
        return visitorDao.addVisitor(visitor);
    }

    public Visitor login(Visitor visitor){
        return visitorDao.queryVisitor(visitor);
    }

    public Visitor checkVisitorName(String name){
        Visitor visitor = new Visitor();
        visitor.setName(name);
        return visitorDao.queryVisitor(visitor);
    }
}
