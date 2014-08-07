package com.gtao.controller;

import com.gtao.pojo.User;
import com.gtao.service.SwitchService;
import com.gtao.service.SwitchServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.portlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Login controller.
 * Created by root on 14-7-31.
 */
@Controller
@RequestMapping(value = "user")
public class LoginController {
    @Autowired
    private SwitchService service;

    /**
     * login page.
     * @return view
     */
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     * login function.
     * @param user
     */
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public void login(@ModelAttribute User user,PrintWriter out,HttpSession session){
        boolean flag = service.findUser(user);
        if (flag){
            session.setAttribute("user",user);
            out.print("success");
        }
        else {
            out.print("failed");
        }
        out.flush();
        out.close();
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

    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String indexPage(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user==null){
            return "login";
        }
        else {
            return "index";
        }
    }
}
