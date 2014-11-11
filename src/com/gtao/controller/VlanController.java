package com.gtao.controller;

import com.gtao.pojo.Vlan;
import com.gtao.service.SwitchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.PrintWriter;

/**
 * Created by root on 14-10-29.
 */
@Controller
@RequestMapping(value = "vlan")
public class VlanController {
    @Autowired
    private SwitchService service;

    /**
     * forward to 'Edit VLAN' page.
     * @param vid
     * @param model
     * @return
     */
    @RequestMapping(value = "/{vid}/edit",method = RequestMethod.GET)
    public String editVlanInfo(@PathVariable int vid,Model model){
        Vlan vlan = service.getVlanById(vid);
        model.addAttribute("vlan",vlan);
        return "editVlan";
    }

    /**
     * Delete one VLAN information.
     * @param vid
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public void deleteVlanInfo(@RequestParam int vid,PrintWriter out){
        if (service.delete(Vlan.class,vid)){
            out.print("success");
        }
        else {
            out.print("failed");
        }
        out.flush();
        out.close();
    }
}
