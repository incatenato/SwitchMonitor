/**
 * Created by root on 14-8-19.
 */
function divideVlan(){
    //init css.
    $("#startDiv").removeClass("error");
    $("#endDiv").removeClass("error");
    $("#areaDiv").removeClass("error");

    var vlanStart = $("#vlanStart").val();
    var vlanEnd = $("#vlanEnd").val();
    var vlanType = $("#vlanType").val();
    var deviceId = $("#did").val();
    var area = $("#area").val();
    var remarks = $("#remarks").val();
    if (vlanStart == ""){
        $("#startErr").html("Vlan start can not be empty.");
        $("#startDiv").addClass("error");
        return ;
    }
    if (vlanEnd == ""){
        $("#endErr").html("Vlan end can not be empty.");
        $("#endDiv").addClass("error");
        return ;
    }
    if (area == ""){
        $("#areaErr").html("Area can not be empty.");
        $("#areaDiv").addClass("error");
        return ;
    }
    //disable 'submit' button
    $("#submit").addClass("disabled");
    $("#back").addClass("disabled");
    $.post("/config/vlanDivide",{VLAN_START:vlanStart,VLAN_END:vlanEnd,TYPE:vlanType,
            AREA:area,NOTE:remarks,DEVICE_ID:deviceId},function(data){
        alert(data);
        window.location.reload();
        $("#submit").removeClass("disabled");
        $("#back").removeClass("disabled");
    })
}

function registVlan(){
    //init css.
    $("#startDiv").removeClass("error");
    $("#endDiv").removeClass("error");
    $("#areaDiv").removeClass("error");

    var vlanStart = $("#vlanStart").val();
    var vlanEnd = $("#vlanEnd").val();
    var vlanType = $("#vlanType").val();
    var deviceId = $("#did").val();
    var area = $("#area").val();
    var remarks = $("#remarks").val();
    if (vlanStart == ""){
        $("#startErr").html("Vlan start can not be empty.");
        $("#startDiv").addClass("error");
        return ;
    }
    if (vlanEnd == ""){
        $("#endErr").html("Vlan end can not be empty.");
        $("#endDiv").addClass("error");
        return ;
    }
    if (area == ""){
        $("#areaErr").html("Area can not be empty.");
        $("#areaDiv").addClass("error");
        return ;
    }
    //disable 'submit' button
    $("#submit").addClass("disabled");
    $("#back").addClass("disabled");
    $.post("/config/vlanRegist",{VLAN_START:vlanStart,VLAN_END:vlanEnd,TYPE:vlanType,
        AREA:area,NOTE:remarks,DEVICE_ID:deviceId},function(data){
        alert(data);
        $("#submit").removeClass("disabled");
        $("#back").removeClass("disabled");
    })
}

function vlanValidate(){
    if (parseInt($("#vlanStart").val()) >= parseInt($("#vlanEnd").val())){
        $("#endErr").html("The vlan end must be greater than vlan start.");
        $("#endDiv").addClass("error");
        $("#vlanEnd").focus();
    }
    else {
        $("#endErr").html("");
        $("#endDiv").removeClass("error");
    }
}

var manageTbl;
$(function(){
    var did = $("#did").val();
    $.post("/config/vlanShow",{deviceId:did},function(data){
        $('#v_tbl').on('click', 'td .blue', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            window.location.href='/vlan/'+id+'/edit';
        });

        $('#v_tbl').on('click', 'td .red', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            if(confirm('really?')){
                $.post("/vlan/delete",{vid:id},function(data){
                    if(data=='success'){
                        window.location.reload();
                    }
                    else{
                        alert('Failed...');
                    }
                })
            }
            else{
                return;
            }
        });

        manageTbl = $("#v_tbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": false,
            "aaData" :data,
            "aoColumns": [
                { "mDataProp": 0,"sWidth": "5%" },
                { "mDataProp": 1,"sWidth": "15%" },
                { "mDataProp": 2,"sWidth": "15%" },
                { "mDataProp": 3,"sWidth": "15%" },
                { "mDataProp": 4, "sClass": "center","sWidth": "15%" },
                { "mDataProp": 5,"sWidth": "15%" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sWidth": "28%",
                    "sDefaultContent": '<a class="btn blue" href="#"><i class="icon-edit icon-white"></i>Edit</a>&nbsp;&nbsp;<a class="btn red" href="#"><i class="icon-edit icon-white"></i>Delete</a>'
                }
            ],
            "bDestroy" : true,
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": false
        });
    });
})
