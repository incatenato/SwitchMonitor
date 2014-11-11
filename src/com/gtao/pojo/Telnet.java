package com.gtao.pojo;

import javax.persistence.*;

/**
 * Created by root on 14-9-28.
 */
@Entity
public class Telnet {
    private int ID;
    private int DEVICE_ID;
    private String TELNET_STATUS;
    private String HOSTS;

    public Telnet() {
    }

    public Telnet(int ID, int DEVICE_ID, String TELNET_STATUS, String HOSTS) {
        this.ID = ID;
        this.DEVICE_ID = DEVICE_ID;
        this.TELNET_STATUS = TELNET_STATUS;
        this.HOSTS = HOSTS;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    @Column(name = "DEVICE_ID")
    public int getDEVICE_ID() {
        return DEVICE_ID;
    }

    public void setDEVICE_ID(int DEVICE_ID) {
        this.DEVICE_ID = DEVICE_ID;
    }

    @Column(name = "TELNET_STATUS")
    public String getTELNET_STATUS() {
        return TELNET_STATUS;
    }

    public void setTELNET_STATUS(String TELNET_STATUS) {
        this.TELNET_STATUS = TELNET_STATUS;
    }

    @Column(name = "HOSTS")
    public String getHOSTS() {
        return HOSTS;
    }

    public void setHOSTS(String HOSTS) {
        this.HOSTS = HOSTS;
    }
}
