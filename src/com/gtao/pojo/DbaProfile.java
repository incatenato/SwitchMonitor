package com.gtao.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigInteger;

/**
 * Created by root on 14-11-6.
 */
@Entity
public class DbaProfile {
    private int ID;
    private int PROFILE_ID;
    private int DTYPE;
    private String COMPENSATION;
    private BigInteger FIX;
    private BigInteger ASSURE;
    private BigInteger MAX;
    private int BIND_TIMES;

    public DbaProfile() {
    }

    public DbaProfile(int ID, int PROFILE_ID, int DTYPE, String COMPENSATION, BigInteger FIX, BigInteger ASSURE, BigInteger MAX, int BIND_TIMES) {
        this.ID = ID;
        this.PROFILE_ID = PROFILE_ID;
        this.DTYPE = DTYPE;
        this.COMPENSATION = COMPENSATION;
        this.FIX = FIX;
        this.ASSURE = ASSURE;
        this.MAX = MAX;
        this.BIND_TIMES = BIND_TIMES;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getPROFILE_ID() {
        return PROFILE_ID;
    }

    public void setPROFILE_ID(int PROFILE_ID) {
        this.PROFILE_ID = PROFILE_ID;
    }

    public int getDTYPE() {
        return DTYPE;
    }

    public void setDTYPE(int DTYPE) {
        this.DTYPE = DTYPE;
    }

    public String getCOMPENSATION() {
        return COMPENSATION;
    }

    public void setCOMPENSATION(String COMPENSATION) {
        this.COMPENSATION = COMPENSATION;
    }

    public BigInteger getFIX() {
        return FIX;
    }

    public void setFIX(BigInteger FIX) {
        this.FIX = FIX;
    }

    public BigInteger getASSURE() {
        return ASSURE;
    }

    public void setASSURE(BigInteger ASSURE) {
        this.ASSURE = ASSURE;
    }

    public BigInteger getMAX() {
        return MAX;
    }

    public void setMAX(BigInteger MAX) {
        this.MAX = MAX;
    }

    public int getBIND_TIMES() {
        return BIND_TIMES;
    }

    public void setBIND_TIMES(int BIND_TIMES) {
        this.BIND_TIMES = BIND_TIMES;
    }
}
