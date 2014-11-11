function editDevice(){
    var deviceName = $("#deviceName").val();
    var deviceIp = $("#deviceIp").val();
    var loginName = $("#loginName").val();
    var loginPass = $("#loginPass").val();
    var enablePass =$("#enablePass").val();
    var configPass = $("#configPass").val();
    var deviceAddress = $("#deviceAddress").val();
    var deviceInfo = $("#deviceInfo").val();
    var deviceId = $("#deviceID").val();
    $.post("/device/edit",{
        deviceName:deviceName,
        deviceIp:deviceIp,
        loginName:loginName,
        loginPass:loginPass,
        enablePass:enablePass,
        configPass:configPass,
        deviceAddress:deviceAddress,
        deviceInfo:deviceInfo,
        id:deviceId
    },function(data){
        if(data=='success'){
            window.location.href = "/device/show";
        }
        else{
            alert('Something wrong,please try again later...');
        }
    })
}

function configDevice(){
    var deviceId = $("#deviceID").val();
    window.location.href = "/config/"+deviceId+"/show";
}