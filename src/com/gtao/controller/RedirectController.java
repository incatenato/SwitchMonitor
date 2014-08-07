package com.gtao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by root on 14-8-4.
 */
@Controller
public class RedirectController {

    @RequestMapping(value = "/{ftl}/",method = RequestMethod.GET)
    public String redirect(@PathVariable String ftl){
        return ftl;
    }
}
