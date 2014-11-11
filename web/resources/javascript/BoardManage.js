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
    $("#btnGroup1").addClass('disabled');
    $("#btnGroup2").addClass('disabled');
    $("#btnGroup3").addClass('disabled');
    $("#btnGroup4").addClass('disabled');
    $("#btnGroup5").addClass('disabled');


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
        $("#btnGroup1").removeClass('disabled');
        $("#btnGroup2").removeClass('disabled');
        $("#btnGroup3").removeClass('disabled');
        $("#btnGroup4").removeClass('disabled');
        $("#btnGroup5").removeClass('disabled');
        alert(data);
    })
}

function createBoard(){
    editBoard('create');
}

function deleteBoard(){
    editBoard('delete');
}

function confirmBoard() {
    editBoard('confirm');
}

function resetBoard(){
    editBoard('reset');
}
