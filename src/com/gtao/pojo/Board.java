package com.gtao.pojo;

import javax.persistence.*;

/**
 * Created by root on 14-8-15.
 */
@Entity
public class Board {
    private int ID;
    private int DEVICEID;
    private int BOARDID;
    private int SLOT;
    private String BOARDNAME;
    private String STATUS;
    private String INFO;
    private String SUBTYPE0;
    private String SUBTYPE1;
    private String ONLINESTATUS;

    public Board(int ID, int DEVICEID, int BOARDID, int SLOT, String BOARDNAME, String STATUS, String INFO, String SUBTYPE0, String SUBTYPE1, String ONLINESTATUS) {
        this.ID = ID;
        this.DEVICEID = DEVICEID;
        this.BOARDID = BOARDID;
        this.SLOT = SLOT;
        this.BOARDNAME = BOARDNAME;
        this.STATUS = STATUS;
        this.INFO = INFO;
        this.SUBTYPE0 = SUBTYPE0;
        this.SUBTYPE1 = SUBTYPE1;
        this.ONLINESTATUS = ONLINESTATUS;
    }

    public Board() {

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    @Column(name = "DEVICEID")
    public int getDEVICEID() {
        return DEVICEID;
    }

    public void setDEVICEID(int DEVICEID) {
        this.DEVICEID = DEVICEID;
    }

    @Column(name = "BOARDID")
    public int getBOARD() {
        return BOARDID;
    }

    public void setBOARD(int BOARDID) {
        this.BOARDID = BOARDID;
    }

    @Column(name = "SLOT")
    public int getSLOT() {
        return SLOT;
    }

    public void setSLOT(int SLOT) {
        this.SLOT = SLOT;
    }

    @Column(name = "BOARDNAME")
    public String getBOARDNAME() {
        return BOARDNAME;
    }

    public void setBOARDNAME(String BOARDNAME) {
        this.BOARDNAME = BOARDNAME;
    }

    @Column(name = "STATUS")
    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    @Column(name = "INFO")
    public String getINFO() {
        return INFO;
    }

    public void setINFO(String INFO) {
        this.INFO = INFO;
    }

    @Column(name = "SUBTYPE0")
    public String getSUBTYPE0() {
        return SUBTYPE0;
    }

    public void setSUBTYPE0(String SUBTYPE0) {
        this.SUBTYPE0 = SUBTYPE0;
    }

    @Column(name = "SUBTYPE1")
    public String getSUBTYPE1() {
        return SUBTYPE1;
    }

    public void setSUBTYPE1(String SUBTYPE1) {
        this.SUBTYPE1 = SUBTYPE1;
    }

    @Column(name = "ONLINESTATUS")
    public String getONLINESTATUS() {
        return ONLINESTATUS;
    }

    public void setONLINESTATUS(String ONLINESTATUS) {
        this.ONLINESTATUS = ONLINESTATUS;
    }
}
