package com.gtao.controller;

import com.gtao.pojo.Board;
import com.gtao.pojo.Device;
import com.gtao.pojo.Port;
import com.gtao.pojo.Vlan;
import com.gtao.service.SwitchService;
import com.gtao.tool.ScriptHelper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by root on 14-8-9.
 */
@Controller
@RequestMapping(value = "config")
public class ConfigController {
    @Autowired
    private SwitchService service;
    //Device device = service.getDeviceById(id);  q:can this object cached?
    @RequestMapping(value = "/{id}/show",method = RequestMethod.GET)
    public String configPage(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "config";
    }

    @RequestMapping(value = "/{id}/boardManage",method = RequestMethod.GET)
    public String boardManage(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        List<Board> boards = new ScriptHelper().pyList("init", new String[]{"1001", device.getDeviceIp(), device.getLoginName(), device.getLoginPass(),
                device.getDeviceName()},device.getId(),0);
        model.addAttribute("boards",boards);
        return "boardManage";
    }

    @RequestMapping(value = "/boardManage",method = RequestMethod.POST)
    public void boardManage(@RequestParam String DEVICEID,@RequestParam String BOARDID,@RequestParam String SLOT,
                            @RequestParam String BOARDNAME,@RequestParam String TYPE,PrintWriter out){
        Device device = service.getDeviceById(Integer.parseInt(DEVICEID));
        ScriptHelper sc = new ScriptHelper();
        String port = BOARDID+"/"+SLOT;
        String result = "";
        // create service board.
        if (TYPE.equals("create")){
            result = sc.pyExecute("init",new String[]{"1002",device.getDeviceIp(),device.getLoginName(),
                    device.getLoginPass(),device.getDeviceName(),port,BOARDNAME}).toString();
        }
        // delete service board.
        else if (TYPE.equals("delete")){
            result = sc.pyExecute("init",new String[]{"1003",device.getDeviceIp(),device.getLoginName(),
                    device.getLoginPass(),device.getDeviceName(),port}).toString();
        }
        // confirm service board.
        else if (TYPE.equals("confirm")){
            result = sc.pyExecute("init", new String[]{"1004", device.getDeviceIp(), device.getLoginName(),
                    device.getLoginPass(), device.getDeviceName(), port}).toString();
        }
        // reset service board.
        else if (TYPE.equals("reset")){
            result = sc.pyExecute("init", new String[]{"1005", device.getDeviceIp(), device.getLoginName(),
                    device.getLoginPass(), device.getDeviceName(), port}).toString();
        }
        out.print(result);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/{id}/ponConfig",method = RequestMethod.GET)
    public String ponConfig(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        List<Board> boards = new ScriptHelper().pyList("init", new String[]{"1001", device.getDeviceIp(), device.getLoginName(), device.getLoginPass(),
                device.getDeviceName()},device.getId(),0);
        model.addAttribute("boards",boards);
        return "ponConfig";
    }

    @RequestMapping(value = "/{id}/ont",method = RequestMethod.GET)
    public String ontForward(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "ontDisplay";
    }

    /**
     * Switch port auto-find mode.
     * @param deviceId
     * @param bPosition
     * @param port
     * @param status
     * @param out
     */
    @RequestMapping(value = "/ponConfig",method = RequestMethod.POST)
    public void ponConfig(@RequestParam int deviceId,@RequestParam String bPosition,
                          @RequestParam int port,@RequestParam String status,PrintWriter out){
        String[] positionArray = bPosition.split("/");
        Device device = service.getDeviceById(deviceId);
        int boardNum = Integer.parseInt(positionArray[0]);
        int slot = Integer.parseInt(positionArray[1]);
//        Port bean = new Port();
//        bean.setBOARDID(deviceId);
//        bean.setBOARD(boardNum);
//        bean.setSLOT(slot);
//        bean.setPORT(port);
//        bean.setAUTOFIND(status);
//        service.saveOrUpdatePort(bean);
        String result = new ScriptHelper().pyExecute("init",new String[]{"1006", device.getDeviceIp(), device.getLoginName(), device.getLoginPass(),
                device.getDeviceName(),bPosition,String.valueOf(port),status}).toString();
        out.print(result);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/{id}/vlanConfig",method = RequestMethod.GET)
    public String vlanConfig(@PathVariable int id,Model model){
        model.addAttribute("deviceId",id);
        return "vlanConfig";
    }

    /**
     * regist vlan info on ma5680t.
     * @param vlan
     * @param out
     */
    @RequestMapping(value = "/vlanRegist",method = RequestMethod.POST)
    public void vlanRegist(@ModelAttribute Vlan vlan,PrintWriter out){
        Device device = service.getDeviceById(vlan.getDEVICE_ID());
        // execute python shell to divide vlan address.
        // parameters : ip/username/user pass/device name/vlan start/vlan end/vlan type
        String result = new ScriptHelper().pyExecute("init", new String[]{"1007", device.getDeviceIp(),
                device.getLoginName(), device.getLoginPass(), device.getDeviceName(),
                String.valueOf(vlan.getVLAN_START()), String.valueOf(vlan.getVLAN_END()), vlan.getTYPE()}).toString();
        out.print(result);
        out.flush();
        out.close();
    }

    /**
     * save the vlan info in mysql.
     * @param vlan
     * @param out
     */
    @RequestMapping(value = "vlanDivide",method = RequestMethod.POST)
    public void vlanDivide(@ModelAttribute Vlan vlan, PrintWriter out){
        if(service.addVlan(vlan)){
            out.print("Success!");
        }
        else {
            out.print("Failed.Please contact your administrator for details.");
        }
        out.flush();
        out.close();
    }

    /**
     * show vlan data tables json output.
     * @param deviceId
     * @param out
     * @param response
     */
    @RequestMapping(value = "/vlanShow",method = RequestMethod.POST)
    public void displayVlan(@RequestParam int deviceId,PrintWriter out,HttpServletResponse response){
        List<Vlan> list = service.getVlanByDeviceId(deviceId);
        StringBuilder sb = new StringBuilder();
        response.setContentType("text/json;charset=GBK");
        sb.append("[");
        try{
            out = response.getWriter();
            for (Vlan vlan : list){
                sb.append("[")
                        .append("\""+vlan.getID()+"\",")
                        .append("\""+vlan.getVLAN_START()+"\",")
                        .append("\""+vlan.getVLAN_END()+"\",")
                        .append("\""+vlan.getTYPE()+"\",")
                        .append("\""+vlan.getAREA()+"\",")
                        .append("\""+vlan.getNOTE()+"\"")
                        .append("],");
            }
            sb.append("]");
            if (sb.length()>2){
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

    @RequestMapping(value = "/{id}/dba",method = RequestMethod.GET)
    public String dbaProfilePage(@PathVariable int id,Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "dbaProfile";
    }

    @RequestMapping(value = "/{id}/changePass",method = RequestMethod.GET)
    public String changePasswordPage(@PathVariable int id, Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "changePass";
    }

    @RequestMapping(value = "/{id}/firewall",method = RequestMethod.GET)
    public String telnetFirewallPage(@PathVariable int id, Model model){
        Device device = service.getDeviceById(id);
        model.addAttribute("device",device);
        return "telnetFirewall";
    }
}
