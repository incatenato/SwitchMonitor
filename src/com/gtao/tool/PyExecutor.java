package com.gtao.tool;

/**
 * Created by root on 14-9-2.
 */
public class PyExecutor {
    ScriptHelper helper = new ScriptHelper();

    /**
     * user python script to create service board.
     * @param operation operation type.
     * @param ipAddress ip address.
     * @param userName root
     * @param userPass admin
     * @param deviceName ma5680t
     * @param boardPort 0/1
     * @param boardName
     */
    public boolean createBoard(String operation,String ipAddress,String userName,
                            String userPass,String deviceName,String boardPort,
                            String boardName){
        boolean flag = false;
        String pyReturn = helper.pyExecute("init",new String[]{operation,ipAddress,userName,userPass,
                deviceName,boardName,boardPort,boardName}).toString();
        if (pyReturn.equals("0")){
            flag = true;
        }
        return flag;
    }
}
