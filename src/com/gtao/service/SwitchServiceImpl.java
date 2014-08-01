package com.gtao.service;

import com.gtao.dao.SwitchDAO;
import com.gtao.pojo.User;

import java.util.List;

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
}
