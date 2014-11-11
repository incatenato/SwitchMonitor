package com.gtao.tool;

import com.gtao.pojo.Board;
import com.gtao.pojo.DbaProfile;
import com.gtao.service.SwitchService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Call python script file help class.
 * Created by root on 14-8-11.
 */
public class ScriptHelper {

    @Autowired
    private SwitchService service;
    /**
     * Get python file path from properties.
     * @return
     */
    private Properties getProp(){
        Properties prop = new Properties();
        try{
            prop.load(ScriptHelper.class.getResourceAsStream("script_path.properties"));
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return prop;
    }

    /**
     * execute python script.
     * @param property
     * @param args
     * @return String
     */
    public StringBuffer pyExecute(String property,String[] args){
        String command = "python "+getProp().getProperty(property)+" ";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < args.length; i++){
            command += args[i] + " ";
        }
        try {
            Process process = Runtime.getRuntime().exec(command);
            InputStream is = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            String line;
            while ((line = reader.readLine()) != null){
//              boardInfoTransform(line);
                sb.append(line+"\n\r");
            }
            process.waitFor();
            is.close();
            reader.close();
            process.destroy();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
        return sb;
    }

    public List<Board> pyList(String property,String[] args,int deviceId,int boardId){
        String command = "python "+getProp().getProperty(property)+" ";
        List<Board> list = new ArrayList<Board>();
        for (int i = 0; i < args.length; i++){
            command += args[i] + " ";
        }
        try {
            Process process = Runtime.getRuntime().exec(command);
            InputStream is = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            String line;
            while ((line = reader.readLine()) != null){
                Board board = boardInfoTransform(line);
                if (board != null){
                    board.setDEVICEID(deviceId);
                    board.setBOARD(boardId);
                    list.add(board);
                }
            }
            process.waitFor();
            is.close();
            reader.close();
            process.destroy();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        catch (InterruptedException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * transform shell output to javabean.
     * @param pyReturn
     * @return DbaProfile
     */
    private DbaProfile dbaInfoTransform(String pyReturn){
        // match 'number of space + number'.
        Pattern pattern = Pattern.compile("^\\s+[0-9]+");
        Matcher matcher = pattern.matcher(pyReturn);
        if (matcher.find()){
            DbaProfile profile = new DbaProfile();
            String regex = "\\w+";
            pattern = Pattern.compile(regex);
            matcher = pattern.matcher(pyReturn);
            int mark = 0;
            while (matcher.find()){
                switch (mark){
                    case 1:
                        profile.setPROFILE_ID(Integer.parseInt(matcher.group()));
                        break;
                    case 2:
                        profile.setDTYPE(Integer.parseInt(matcher.group()));
                        break;
                    case 3:
                        profile.setCOMPENSATION(matcher.group());
                        break;
                    case 4:
                        profile.setFIX(BigInteger.valueOf(Long.parseLong(matcher.group())));
                        break;
                    case 5:
                        profile.setASSURE(BigInteger.valueOf(Long.parseLong(matcher.group())));
                        break;
                    case 6:
                        profile.setMAX(BigInteger.valueOf(Long.parseLong(matcher.group())));
                        break;
                    case 7:
                        profile.setBIND_TIMES(Integer.parseInt(matcher.group()));
                        break;
                }
                mark++;
            }
            return profile;
        }
        else {
            return null;
        }
    }

    /**
     * display board 0
     * @param pyReturn
     */
    private Board boardInfoTransform(String pyReturn){
        /*
        if python script return info start with integer.
        Split the info string and then insert into db.
       */
        Pattern pattern = Pattern.compile("^\\s+[0-9]+");
        Matcher matcher = pattern.matcher(pyReturn);
        if (matcher.find()){
            Board board = new Board();
            String regex = "\\w+";
            pattern = Pattern.compile(regex);
            matcher = pattern.matcher(pyReturn);
            int mark = 0;
            while (matcher.find()){
                switch (mark){
                    case 0:
                        board.setSLOT(Integer.parseInt(matcher.group()));
                        break;
                    case 1:
                        board.setBOARDNAME(matcher.group());
                        break;
                    case 2:
                        board.setSTATUS(matcher.group());
                        break;
                    case 3:
                        board.setSUBTYPE0(matcher.group());
                        break;
                    case 4:
                        board.setSUBTYPE1(matcher.group());
                        break;
                    case 5:
                        board.setONLINESTATUS(matcher.group());
                        break;
                }
                mark ++;
            }
            return board;
        }
        else {
            return null;
        }
    }

    /**
     * Test
     * @param args
     */
    public static void main(String[] args) {
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1001", "10.1.183.31", "root", "admin", "MA5680T"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1003", "10.1.183.31", "root", "admin", "MA5680T", "0/2"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1002", "10.1.183.31", "root", "admin", "MA5680T", "0/2", "H802EPBD"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1006", "10.1.183.31", "root", "admin", "MA5680T", "0/2"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1007", "10.1.183.31", "root", "admin", "MA5680T", "1500", "1507", "smart", "0/2"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1008", "10.1.183.31", "root", "admin", "MA5680T", "1500", "1507", "smart", "0/2"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1009", "10.1.183.31", "root", "admin", "MA5680T", "1500", "1507", "smart", "0/2"}).toString());
        //System.out.println(new ScriptHelper().pyExecute("init", new String[]{"1010", "10.1.183.31", "root", "admin", "MA5680T", "1500", "1507", "smart", "0/2"}).toString());
    }
}
