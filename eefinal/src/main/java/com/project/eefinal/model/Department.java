package com.project.eefinal.model;

import java.io.Serializable;
import java.util.Date;

public class Department implements Serializable {
    private Integer id;
    private String name;
    private Date date;

    public Department() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
