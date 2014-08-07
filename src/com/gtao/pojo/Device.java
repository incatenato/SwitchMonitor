package com.gtao.pojo;

import javax.persistence.*;

/**
 * Created by root on 14-8-6.
 */
@Entity
public class Device {
    private int id;
    private String deviceName;
    private String deviceIp;
    private String loginName;
    private String loginPass;
    private String enablePass;
    private String configPass;
    private String deviceAddress;
    private String deviceInfo;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "deviceName")
    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    @Column(name = "deviceIp")
    public String getDeviceIp() {
        return deviceIp;
    }

    public void setDeviceIp(String deviceIp) {
        this.deviceIp = deviceIp;
    }

    @Column(name = "loginName")
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "loginPass")
    public String getLoginPass() {
        return loginPass;
    }

    public void setLoginPass(String loginPass) {
        this.loginPass = loginPass;
    }

    @Column(name = "enablePass")
    public String getEnablePass() {
        return enablePass;
    }

    public void setEnablePass(String enablePass) {
        this.enablePass = enablePass;
    }

    @Column(name = "configPass")
    public String getConfigPass() {
        return configPass;
    }

    public void setConfigPass(String configPass) {
        this.configPass = configPass;
    }

    @Column(name = "deviceAddress")
    public String getDeviceAddress() {
        return deviceAddress;
    }

    public void setDeviceAddress(String deviceAddress) {
        this.deviceAddress = deviceAddress;
    }

    @Column(name = "deviceInfo")
    public String getDeviceInfo() {
        return deviceInfo;
    }

    public void setDeviceInfo(String deviceInfo) {
        this.deviceInfo = deviceInfo;
    }

    public Device() {
    }

    public Device(int id, String deviceName, String deviceIp, String loginName, String loginPass, String enablePass, String configPass, String deviceAddress, String deviceInfo) {
        this.id = id;
        this.deviceName = deviceName;
        this.deviceIp = deviceIp;
        this.loginName = loginName;
        this.loginPass = loginPass;
        this.enablePass = enablePass;
        this.configPass = configPass;
        this.deviceAddress = deviceAddress;
        this.deviceInfo = deviceInfo;
    }
}
