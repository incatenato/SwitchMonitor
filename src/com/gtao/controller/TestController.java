package com.gtao.controller;

import com.gtao.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by HP on 14-7-23.
 */
@Controller
public class TestController {
    /**
     * Static list of users to simulate Database
     */
    private static List<User> userList = new ArrayList<User>();
    //Initialize the list with some data for index screen.
    /*static{
        userList.add(new User("bill","gates"));
        userList.add(new User("steve","jobs"));
        userList.add(new User("micheal","jackson"));
    }*/

    /**
     * Saves the static list of users in model and renders it
     * via freemarker template.
     *
     * @param model
     * @return The index view (FTL)
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(@ModelAttribute("model") ModelMap model){
        model.addAttribute("userList", userList);
        return "index";
    }


    /*@RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(@ModelAttribute("user") User user){
        if (null != user&&null != user.getFirstName()&& null != user.getLastName() && !user.getFirstName().isEmpty()
                && !user.getLastName().isEmpty()) {
            synchronized (userList) {
                userList.add(user);
            }
        }
        System.out.println(user.getFirstName()+user.getLastName()+",,,,,");
        return "redirect:index.jsp";
    }*/
}
