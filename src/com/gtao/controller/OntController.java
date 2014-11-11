package com.gtao.controller;

import com.gtao.service.SwitchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by root on 14-10-30.
 */
@Controller
@RequestMapping(value = "ont")
public class OntController {
    @Autowired
    private SwitchService service;

    @RequestMapping(value = "/get",method = RequestMethod.POST)
    public void getOnt(@RequestParam int deviceId,HttpServletResponse response,PrintWriter out){
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        sb.append("[")
                .append("\"1\",")
                .append("\"fh888888\",")
                .append("\"AAAA-BBBB-CCCC\"],")
                .append("[\"2\",")
                .append("\"fh999999\",")
                .append("\"ZZZZ-XXXX-CCCC\"],")
                .append("[\"3\",")
                .append("\"fh000000\",")
                .append("\"QQQQ-WWWW-EEEE\"]")
                .append("]");
        response.setContentType("text/json;charset=GBK");
        try {
            out = response.getWriter();
            out.print(sb);
            out.flush();
            out.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }
}
