package com.gtao.service;

import com.gtao.pojo.Device;
import com.gtao.pojo.User;

import java.util.List;

/**
 * Created by root on 14-7-31.
 */
public interface SwitchService {
    public boolean findUser(User user);
    public String register(User user);
    public boolean deviceValidate(Device device);
    public String addDevice(Device device);
    public List<Device> getDeviceList();
    public Device getDeviceById(int id);
    public String updateDeviceInfo(Device device);
    public String deleteDevice(int id);
}
