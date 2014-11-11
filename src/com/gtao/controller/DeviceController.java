package com.gtao.controller;

import com.gtao.pojo.Device;
import com.gtao.service.SwitchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by root on 14-8-6.
 */
@Controller
@RequestMapping(value = "device")
public class DeviceController {
    @Autowired
    private SwitchService service;

    /**
     * Add device information page function.
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String addDevice(){
        return "add";
    }

    /**
     * Add device information server function.
     * @param device
     * @param out
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public void addDevice(@ModelAttribute Device device,PrintWriter out){
        out.print(service.addDevice(device));
        out.flush();
        out.close();
        //Synchronized info...

    }

    /**
     * show '''deviceManage.jsp'''
     * @return view
     */
    @RequestMapping(value = "show",method = RequestMethod.GET)
    public String show(){
        return "deviceManage";
    }

    @RequestMapping(value = "monitor",method = RequestMethod.GET)
    public String monitor(){
        return "monitor";
    }

    @RequestMapping(value = "/{id}/monitor",method = RequestMethod.GET)
    public String forwardMonitor(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "ViewMonitor";
    }

    /**
     * Get all device list function.Return json.
     * @param response
     * @param out
     */
    @RequestMapping(value = "list",method = RequestMethod.POST)
    public void deviceList(HttpServletResponse response,PrintWriter out){
        response.setContentType("text/json;charset=GBK");
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        try {
            out = response.getWriter();
            List<Device> list = service.getDeviceList();
            for (Device d : list){
                sb.append("[")
                        .append("\""+d.getId()+"\",")
                        .append("\""+d.getDeviceIp()+"\",")
                        .append("\""+d.getDeviceName()+"\",")
                        .append("\""+d.getDeviceAddress()+"\",")
                        .append("\"" + d.getDeviceInfo() + "\"")
                        .append("],");
            }
            sb.append("]");
            if (sb.length() > 2){
                sb.deleteCharAt(sb.lastIndexOf(","));
            }
            out.print(sb);
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            out.flush();
            out.close();
        }
    }

    /**
     * Edit device information page function.
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/{id}/edit",method = RequestMethod.GET)
    public String editDeviceInfo(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "editDevice";
    }

    /**
     * Edit device information service function.
     * @param device
     * @param out
     */
    @RequestMapping(value = "edit",method = RequestMethod.POST)
    public void editDeviceInfo(@ModelAttribute Device device,PrintWriter out){
        System.out.println(device.getId());
        out.print(service.updateDeviceInfo(device));
        out.flush();
        out.close();
    }

    /**
     * Delete device information service function.
     * @param id
     * @param out
     */
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public void deleteDevice(@RequestParam int id,PrintWriter out){
        out.print(service.deleteDevice(id));
    }
}
