package com.gtao.pojo;

import javax.persistence.*;

/**
 * Created by root on 14-8-15.
 */
@Entity
public class Port {
    private int ID;
    private int BOARDID;
    private int BOARD;
    private int SLOT;
    private int PORT;
    private String AUTOFIND;

    public Port() {
    }

    public Port(int ID, int BOARDID, int BOARD, int SLOT, int PORT, String AUTOFIND) {

        this.ID = ID;
        this.BOARDID = BOARDID;
        this.BOARD = BOARD;
        this.SLOT = SLOT;
        this.PORT = PORT;
        this.AUTOFIND = AUTOFIND;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    @Column(name = "BOARDID")
    public int getBOARDID() {
        return BOARDID;
    }

    public void setBOARDID(int BOARDID) {
        this.BOARDID = BOARDID;
    }

    @Column(name = "BOARD")
    public int getBOARD() {
        return BOARD;
    }

    public void setBOARD(int BOARD) {
        this.BOARD = BOARD;
    }

    @Column(name = "SLOT")
    public int getSLOT() {
        return SLOT;
    }

    public void setSLOT(int SLOT) {
        this.SLOT = SLOT;
    }

    @Column(name = "PORT")
    public int getPORT() {
        return PORT;
    }

    public void setPORT(int PORT) {
        this.PORT = PORT;
    }

    @Column(name = "AUTOFIND")
    public String getAUTOFIND() {
        return AUTOFIND;
    }

    public void setAUTOFIND(String AUTOFIND) {
        this.AUTOFIND = AUTOFIND;
    }
}