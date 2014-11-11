/**
 * Created by JiangHao on 14-8-12.
 */

/*
 when click 'tr' put first and second 'td' text to textfield in bottom.
 */
$(function(){
    $("#innerTbl").mouseover(function(){
        $(this).css("cursor","pointer");
    });
    $("tr").click(function(){
        var slot = $(this).find("td").eq(0).text();
        var boardName = $(this).find("td").eq(1).text();
        var boardId = $("#boardId").val();
        $("#boardPosition").val('');
        $("#boardName").val('');
        $("#boardPosition").val(boardId+"/"+slot);
        $("#boardName").val(boardName);
    });
    hideEmptySlot();
});

var mark = 0;

/*
 hide the empty rows in the table.
 */
function hideEmptySlot(){
    $("#innerTbl tr").each(function(index,element){
        var val = $(this).find("td").eq(1).html();
        if(val == ''){
            element.style.display = 'none';
        }
    });
    $("#hide_btn").text("Show");
    mark = 0;
}

/*
 show the hided empty rows.
 */
function showEmptySlot(){
    $("#innerTbl tr").each(function(index,element){
        var val = element.style.display;
        if(val == 'none'){
            element.style.display = '';
        }
    });
    mark = 1;
    $("#hide_btn").text("Hide");
}

function changeTblDisplay(){
    if(mark == 0){
        showEmptySlot();
    }
    else{
        hideEmptySlot();
    }
}

function editBoard(type){
    //init css.
    $("#positionDiv").removeClass("error");
    $("#nameDiv").removeClass("error");

    var boardPosition = $("#boardPosition").val();
    var boardName = $("#boardName").val();
    var reg = /[0-9]\/[0-9]/;
    if (!reg.test(boardPosition)){
        $("#positionErr").html("Board position field format error.");
        $("#positionDiv").addClass("error");
        return;
    }
    if (boardName==""){
        $("#nameErr").html("Board name can not be empty.");
        $("#nameDiv").addClass("error");
        return;
    }
    var did = $("#deviceId").val();
    var position = boardPosition.split("\/");
    $.post("/config/boardManage",{DEVICEID:did,BOARDID:position[0],SLOT:position[1],
        BOARDNAME:boardName,TYPE:type},function(data){
        alert(data);
    })
}

function ponConfig() {
    var portStatArray = new Array();
    $(function(){
        for (var i = 0;i <= 7;i ++){
            portStatArray.push($("#port"+i).val());
        }
    })
    console.log(portStatArray);
}

function ponConfig2(port) {
    //disable all port select button.
    $("#port0").prop('disabled', 'disabled');
    $("#port1").prop('disabled', 'disabled');
    $("#port2").prop('disabled', 'disabled');
    $("#port3").prop('disabled', 'disabled');
    $("#port4").prop('disabled', 'disabled');
    $("#port5").prop('disabled', 'disabled');
    $("#port6").prop('disabled', 'disabled');
    $("#port7").prop('disabled', 'disabled');
    var deviceId = $("#bid").val();
    var bPosition = $("#boardPosition").val();
    if (bPosition == ""){
        $("#positionDiv").addClass("error");
    }
    else{
        $("#positionDiv").removeClass("error");
    }
    var status = $("#port"+port).val();
    $.post("/config/ponConfig",{deviceId:deviceId,bPosition:bPosition,port:port,status:status},function(data){
        $("#port0").prop('disabled', false);
        $("#port1").prop('disabled', false);
        $("#port2").prop('disabled', false);
        $("#port3").prop('disabled', false);
        $("#port4").prop('disabled', false);
        $("#port5").prop('disabled', false);
        $("#port6").prop('disabled', false);
        $("#port7").prop('disabled', false);
        alert(data);
    })
}



