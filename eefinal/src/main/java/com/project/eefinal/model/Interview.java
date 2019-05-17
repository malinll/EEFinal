package com.project.eefinal.model;

import java.io.Serializable;

public class Interview implements Serializable {
    private Integer id;
    private Integer resid;
    private Integer state;
    private String time;
    private String site;
    private Integer rid;

    public Interview() {
    }

    public Interview(Integer resid, Integer state, String time, String site, Integer rid) {
        this.resid = resid;
        this.state = state;
        this.time = time;
        this.site = site;
        this.rid = rid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getResid() {
        return resid;
    }

    public void setResid(Integer resid) {
        this.resid = resid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }
}
