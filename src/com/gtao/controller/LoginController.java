package com.gtao.controller;

import com.gtao.pojo.User;
import com.gtao.service.SwitchService;
import com.gtao.service.SwitchServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.PrintWriter;

/**
 * Login controller.
 * Created by root on 14-7-31.
 */
@Controller
public class LoginController {
    @Autowired
    private SwitchService service;

    /**
     * login function.
     * @param user
     */
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(@ModelAttribute User user,PrintWriter out){
        boolean flag = service.findUser(user);
        if (flag){
            return "index";
        }
        else {
            out.print("failed");
            out.flush();
            out.close();
            return null;
        }
    }

    /**
     * register function.
     * @param user
     */
    @RequestMapping(value = "register")
    public void register(@ModelAttribute User user,PrintWriter out){
        String msg = service.register(user);
        out.print(msg);
        out.flush();
        out.close();
    }
}
