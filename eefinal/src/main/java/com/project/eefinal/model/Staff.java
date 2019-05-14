package com.project.eefinal.model;

public class Staff {
    private Integer id;
    private String name;
    private String pass;

    public Staff() {
    }

    public Staff(String name, String pass) {
        this.name = name;
        this.pass = pass;
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

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
