package com.gtao.controller;

import com.gtao.pojo.User;
import com.gtao.service.SwitchService;
import com.gtao.service.SwitchServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
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
    public void login(@ModelAttribute User user,PrintWriter out,HttpServletResponse response){
        boolean flag = service.findUser(user);
        if (flag){
            out.print("success");
            out.flush();
            out.close();
        }
        else {
            out.print("failed");
            out.flush();
            out.close();
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
