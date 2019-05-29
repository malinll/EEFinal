package com.project.eefinal.model;

import java.io.Serializable;
import java.util.Date;

public class Clock implements Serializable {
    private Integer id;
    private Integer sid;
    private Date time;
    private Integer state;
    private Integer loe;

    public Clock() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getLoe() {
        return loe;
    }

    public void setLoe(Integer loe) {
        this.loe = loe;
    }
}
