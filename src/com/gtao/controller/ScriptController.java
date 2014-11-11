package com.gtao.controller;

import com.gtao.pojo.Device;
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
 * Created by root on 14-8-12.
 */
@Controller
@RequestMapping(value = "script")
public class ScriptController {
    @Autowired
    SwitchService service;

    //todo
    @RequestMapping(value = "displayBoard",method = RequestMethod.POST)
    public void displayServiceBoard(HttpServletResponse resp,PrintWriter out){
        //Device device = service.getDeviceById(id);
        resp.setContentType("text/html;charset=GBK");
        StringBuffer sb = new StringBuffer();
        //test data
        for (int i = 0;i < 3;i++){
            sb.append("<tr>\n" +
                    "<td>"+(i+1)+"</td>\n" +
                    "<td>H802EPBD</td>\n" +
                    "<td>Normal</td>\n" +
                    "<td></td>\n" +
                    "<td></td>\n" +
                    "<td><span class=\"label label-success\">online</span></td>\n" +
                    "</tr>");
        }
        try {
            out = resp.getWriter();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            out.print(sb);
            out.flush();
            out.close();
        }
    }
}
