/**
 * Created by root on 14-9-25.
 */
var deviceId = $("#deviceId").val();
$(function(){
    $("#profileType").change(function(){
        var type = $("#profileType").val();
        if (type != "type3"){
            $("#maxDiv").hide();
        }
        else{
            $("#maxDiv").show();
        }
    })
})

function createDBAProfile(){
    $("#profileIdError").html("");
    $("#nameErr").html("");
    var pid = $("#profileId").val();
    var pName = $("#profileName").val();
    var pType = $("#profileType").val();
    var pMin = $("#minBw").val();
    var pMax = $("#maxBw").val();
    if (pid == ""){
        $("#profileIdError").html("Profile ID can not be empty.");
        return ;
    }
    if (pName == ""){
        $("#nameErr").html("Profile name can not be empty.");
        return ;
    }
    $.post("/dba/dbaProfile",{deviceId:deviceId,pid:pid,pName:pName,pType:pType,pMin:pMin,pMax:pMax},function(data){
        alert(data);
    })
}

function createDBAServiceProfile(){
    $("#profileIdError3").html("");
    $("#nameErr3").html("");
    var pid = $("#profileId3").val();
    var pName = $("#profileName3").val();
    var eths = $("#eth").val();
    var pots = $("#pots").val();
    if (pid == ""){
        $("#profileIdError3").html("Profile ID can not be empty.");
        return ;
    }
    if (pName == ""){
        $("#nameErr3").html("Profile name can not be empty.");
        return ;
    }
    $.post("/dba/dbaService",{deviceId:deviceId,pid:pid,pName:pName,eths:eths,pots:pots},function(data){
        alert(data);
    })
}

function createDBALineProfile(){
    $("#profileIdError2").html("");
    $("nameErr2").html("");
    var pid = $("#profileId2").val();
    var pName = $("#profileName2").val();
    if (pid == ""){
        $("#profileIdError2").html("Profile ID can not be empty.");
        return ;
    }
    if (pName == ""){
        $("#nameErr2").html("Profile name can not be empty.");
        return ;
    }
    $.post("/dba/dbaLine",{deviceId:deviceId,pid:pid,pName:pName},function(data){
        alert(data);
    })
}


