package com.project.eefinal.model;

import java.io.Serializable;

public class Recruitment implements Serializable {
    private Integer id;
    private String job;
    private String company;
    private Integer pay;
    private String area;
    private String description;
    private String quality;
    private Integer state;

    public Recruitment() {
    }

    public Recruitment(String job, String company, Integer pay, String area, String description, String quality, Integer state) {
        this.job = job;
        this.company = company;
        this.pay = pay;
        this.area = area;
        this.description = description;
        this.quality = quality;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getPay() {
        return pay;
    }

    public void setPay(Integer pay) {
        this.pay = pay;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
