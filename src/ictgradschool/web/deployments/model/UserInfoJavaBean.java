package ictgradschool.web.deployments.model;

import java.io.Serializable;
import java.sql.Date;

public class UserInfoJavaBean implements Serializable {
    private String fname;
    private String lname;
    private String emailAddress;
    private String phoneNum;
    private Date dob;
    private String country;
    private String description;
    private String avatarFileName;
    private Integer userid;

    UserInfoJavaBean(String fname, String lname, String emailAddress, String phoneNum, Date dob, String country, String description, String avatarFileName, Integer userid) {
        this.fname = fname;
        this.lname = lname;
        this.emailAddress = emailAddress;
        this.phoneNum = phoneNum;
        this.dob = dob;
        this.country = country;
        this.description = description;
        this.avatarFileName = avatarFileName;
        this.userid = userid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAvatarFileName() {
        return avatarFileName;
    }

    public void setAvatarFileName(String avatarFileName) {
        this.avatarFileName = avatarFileName;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}
