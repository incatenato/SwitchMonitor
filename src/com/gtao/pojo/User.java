package com.gtao.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by HP on 14-7-23.
 */
@Entity
public class User implements Serializable {
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

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "userName")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "userPass")
    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "area")
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
