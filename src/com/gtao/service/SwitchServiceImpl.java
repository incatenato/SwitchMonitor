package com.gtao.service;

import com.gtao.dao.SwitchDAO;
import com.gtao.pojo.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Created by root on 14-7-31.
 */
public class SwitchServiceImpl implements SwitchService{
    private SwitchDAO switchDAO;
    public void setSwitchDAO(SwitchDAO switchDAO) {
        this.switchDAO = switchDAO;
    }

    @Override
    public boolean findUser(User user) {
        List<User> li = switchDAO.nativeFindAll("SELECT * FROM User WHERE userName=? AND userPass=password(?)",
                User.class,new Object[]{user.getUserName(),user.getUserPass()});
        return li.size() > 0 ? true:false;
    }

    @Override
    public String register(User user) {
        boolean flag = this.findUser(user);
        if(!flag){
            switchDAO.save(user);
            return "success";
        }
        else {
            return "failed";
        }
    }

    @Override
    public boolean deviceValidate(Device device) {
        List<Device> list = switchDAO.nativeFindAll("SELECT * FROM Device WHERE deviceIp=?",
                Device.class,new Object[]{device.getDeviceIp()});
        return list.size() > 0 ? true : false;
    }


    @Override
    public String addDevice(Device device) {
        boolean flag = this.deviceValidate(device);
        if (!flag){
            switchDAO.save(device);
            return "success";
        }
        else{
            return "failed";
        }
    }

    @Override
    public List<Device> getDeviceList() {
        List<Device> list = switchDAO.findAll("from Device",Device.class);
        return list;
    }

    @Override
    public Device getDeviceById(int id) {
        return switchDAO.get(Device.class,id);
    }

    @Override
    public String updateDeviceInfo(Device device) {
        boolean flag = this.deviceValidate(device);
        if (!flag){
            switchDAO.update(device);
            //id has no value...todo
            return "success";
        }
        else {
            return "failed";
        }
    }

    @Override
    public String deleteDevice(int id) {
        switchDAO.delete(Device.class,id);
        Device device = this.getDeviceById(id);
        if (device == null){
            return "success";
        }
        else {
            return "failed";
        }
    }

    @Override
    public boolean addBoard(Board board) {
        boolean flag = true;
        try{
            switchDAO.save(board);
        }
        catch (Exception e){
            e.printStackTrace();
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean addVlan(Vlan vlan) {
        boolean flag = true;
        try{
            switchDAO.save(vlan);
        }
        catch (Exception e){
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public List<Vlan> getVlanByDeviceId(int id) {
        return switchDAO.findAll("from Vlan where DEVICE_ID=?",Vlan.class,id);
    }

    @Override
    public void saveOrUpdatePort(Port port) {
        switchDAO.saveOrUpdate(port);
    }

    @Override
    public Vlan getVlanById(int vid) {
        return switchDAO.get(Vlan.class,vid);
    }

    @Override
    public boolean delete(Class t, int id) {
        boolean flag = true;
        try{
            switchDAO.delete(t,id);
        }
        catch (Exception e){
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean insert(Class t) {
        boolean flag = true;
        try{
            switchDAO.save(t);
        }
        catch (Exception e){
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean update(Class t) {
        boolean flag = true;
        try {
            switchDAO.update(t);
        }
        catch (Exception e){
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public Object getById(Class t, int id) {
        return switchDAO.get(t,id);
    }
}
