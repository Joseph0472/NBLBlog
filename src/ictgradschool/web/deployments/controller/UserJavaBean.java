package ictgradschool.web.deployments.controller;

import java.io.Serializable;

public class UserJavaBean implements Serializable {

    // THIS IS A JAVABEAN NOW

    private Integer id;
    private String username;
    private String password;
    private String passHashBase64;
    private String saltBase64;
    private int numIterations;

    public UserJavaBean(Integer id, String username, String password, String passHashBase64, String saltBase64, int numIterations) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.passHashBase64 = passHashBase64;
        this.saltBase64 = saltBase64;
        this.numIterations = numIterations;
    }

    public UserJavaBean(String username, String passHashBase64, String saltBase64, int numIterations) {
        this.username = username;
        this.passHashBase64 = passHashBase64;
        this.saltBase64 = saltBase64;
        this.numIterations = numIterations;
    }

    public UserJavaBean() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassHashBase64() {
        return passHashBase64;
    }

    public void setPassHashBase64(String passHashBase64) {
        this.passHashBase64 = passHashBase64;
    }

    public String getSaltBase64() {
        return saltBase64;
    }

    public void setSaltBase64(String saltBase64) {
        this.saltBase64 = saltBase64;
    }

    public int getNumIterations() {
        return numIterations;
    }

    public void setNumIterations(int numIterations) {
        this.numIterations = numIterations;
    }

}
