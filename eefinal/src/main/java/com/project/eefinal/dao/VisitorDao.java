package com.project.eefinal.dao;

import com.project.eefinal.model.Visitor;

public interface VisitorDao {
    boolean addVisitor(Visitor visitor);
    Visitor queryVisitor(Visitor visitor);
}
