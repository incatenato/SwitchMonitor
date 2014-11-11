package com.gtao.controller;

import com.gtao.pojo.Device;
import com.gtao.service.SwitchService;
import com.gtao.tool.ScriptHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by root on 14-9-25.
 */
@Controller
@RequestMapping(value = "dba")
public class DbaController {
    @Autowired
    private SwitchService service;

    /**
     * create dba profile.
     * @param deviceId
     * @param pid
     * @param pName
     * @param pType
     * @param pMin
     * @param pMax
     * @param out
     */
    @RequestMapping(value = "/dbaProfile",method = RequestMethod.POST)
    public void createDbaProfile(@RequestParam int deviceId,@RequestParam int pid,@RequestParam String pName,
                                 @RequestParam String pType,@RequestParam int pMin,@RequestParam int pMax,PrintWriter out){
        Device device = service.getDeviceById(deviceId);
        String result = new ScriptHelper().pyExecute("init",new String[]{"1009",device.getDeviceIp(),device.getLoginName(),
                device.getLoginPass(),device.getDeviceName(),String.valueOf(pid),pName,pType,String.valueOf(pMin),
                String.valueOf(pMax)}).toString();
        out.print(result);
        out.flush();
        out.close();
    }

    /**
     * create dba service profile.
     * @param deviceId
     * @param pid
     * @param pName
     * @param eths
     * @param pots
     * @param out
     */
    @RequestMapping(value = "/dbaService",method = RequestMethod.POST)
    public void createDbaServiceProfile(@RequestParam int deviceId,@RequestParam int pid,@RequestParam String pName,
                                        @RequestParam int eths,@RequestParam int pots,PrintWriter out){
        Device device = service.getDeviceById(deviceId);
        String result = new ScriptHelper().pyExecute("init",new String[]{"1011",device.getDeviceIp(),device.getLoginName(),
                device.getLoginPass(),device.getDeviceName(),String.valueOf(pid),pName,String.valueOf(eths),String.valueOf(pots)})
                .toString();
        out.print(result);
        out.flush();
        out.close();
    }

    /**
     * create dba line profile.
     * @param deviceId
     * @param pid
     * @param pName
     * @param out
     */
    @RequestMapping(value = "/dbaLine",method = RequestMethod.POST)
    public void createDbaLineProfile(@RequestParam int deviceId,@RequestParam int pid,@RequestParam String pName,PrintWriter out){
        Device device = service.getDeviceById(deviceId);
        String result = new ScriptHelper().pyExecute("init",new String[]{"1010",device.getDeviceIp(),device.getLoginName(),
                device.getLoginPass(),device.getDeviceName(),String.valueOf(pid),pName})
                .toString();
        out.print(result);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/showProfile", method = RequestMethod.POST)
    public void showDbaProfile(@RequestParam int deviceId, PrintWriter out, HttpServletResponse response){
        Device d = service.getDeviceById(deviceId);

    }
}
