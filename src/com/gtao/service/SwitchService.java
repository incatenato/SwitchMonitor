package com.gtao.service;

import com.gtao.pojo.*;

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
    public boolean addBoard(Board board);
    public boolean addVlan(Vlan vlan);
    public List<Vlan> getVlanByDeviceId(int id);
    public void saveOrUpdatePort(Port port);
    public Vlan getVlanById(int vid);
    public boolean delete(Class t,int id);
    public boolean insert(Class t);
    public boolean update(Class t);
    public Object getById(Class t,int id);
}
