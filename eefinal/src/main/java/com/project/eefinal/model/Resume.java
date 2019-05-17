package com.project.eefinal.model;

import java.io.Serializable;

public class Resume implements Serializable {
    private Integer id;
    private Integer vid;
    private String name;
    private String gender;
    private String birth;
    private String nation;
    private String nativePlace;
    private Long phone;
    private String education;
    private String major;
    private String address;
    private String email;
    private String skills;
    private String assessment;

    public Resume() {
    }

    public Resume(Integer vid, String name, String gender, String birth, String nation, String nativePlace, Long phone, String education, String major, String address, String email, String skills, String assessment) {
        this.vid = vid;
        this.name = name;
        this.gender = gender;
        this.birth = birth;
        this.nation = nation;
        this.nativePlace = nativePlace;
        this.phone = phone;
        this.education = education;
        this.major = major;
        this.address = address;
        this.email = email;
        this.skills = skills;
        this.assessment = assessment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getAssessment() {
        return assessment;
    }

    public void setAssessment(String assessment) {
        this.assessment = assessment;
    }
}
