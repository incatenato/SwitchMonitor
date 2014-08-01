package com.gtao.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * Created by HP on 14-7-23.
 */
public class User {
    @Column()
    private int id;
    private String userName;
    private String userPass;
    private String name;
    private String area;
    public User(){};
    public User(String userName, String userPass,String name,String area){
        this.userName = userName;
        this.userPass = userPass;
        this.name = name;
        this.area = area;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
