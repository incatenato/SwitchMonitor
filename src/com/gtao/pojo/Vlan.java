package com.gtao.pojo;

import javax.persistence.*;

/**
 * Created by root on 14-8-19.
 */
@Entity
public class Vlan {
    private int ID;
    private int VLAN_START;
    private int VLAN_END;
    private String TYPE;
    private String AREA;
    private String NOTE;
    private int DEVICE_ID;

    public Vlan(int ID, int VLAN_START, int VLAN_END, String TYPE, String AREA, String NOTE, int DEVICE_ID) {
        this.ID = ID;
        this.VLAN_START = VLAN_START;
        this.VLAN_END = VLAN_END;
        this.TYPE = TYPE;
        this.AREA = AREA;
        this.NOTE = NOTE;
        this.DEVICE_ID = DEVICE_ID;
    }

    public Vlan() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    @Column(name = "VLAN_START")
    public int getVLAN_START() {
        return VLAN_START;
    }

    public void setVLAN_START(int VLAN_START) {
        this.VLAN_START = VLAN_START;
    }

    @Column(name = "VLAN_END")
    public int getVLAN_END() {
        return VLAN_END;
    }

    public void setVLAN_END(int VLAN_END) {
        this.VLAN_END = VLAN_END;
    }

    @Column(name = "TYPE")
    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    @Column(name = "AREA")
    public String getAREA() {
        return AREA;
    }

    public void setAREA(String AREA) {
        this.AREA = AREA;
    }

    @Column(name = "NOTE")
    public String getNOTE() {
        return NOTE;
    }

    public void setNOTE(String NOTE) {
        this.NOTE = NOTE;
    }

    @Column(name = "DEVICE_ID")
    public int getDEVICE_ID() {
        return DEVICE_ID;
    }

    public void setDEVICE_ID(int DEVICE_ID) {
        this.DEVICE_ID = DEVICE_ID;
    }
}
