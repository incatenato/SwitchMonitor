package com.gtao.service;

import com.gtao.pojo.User;

/**
 * Created by root on 14-7-31.
 */
public interface SwitchService {
    public boolean findUser(User user);
    public String register(User user);
}
