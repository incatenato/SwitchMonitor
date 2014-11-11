var manageTbl;
$(function(){
    var did = $("#did").val();
    $.post("/ont/get",{deviceId:did},function(data){
        $('#v_tbl').on('click', 'td .blue', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            //window.location.href='/vlan/'+id+'/edit';
        });

        $('#v_tbl').on('click', 'td .red', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            if(confirm('really?')){
                $.post("",{vid:id},function(data){
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

        manageTbl = $("#ont_tbl").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": false,
            "aaData" :data,
            "aoColumns": [
                { "mDataProp": 0,"sWidth": "15%" },
                { "mDataProp": 1,"sWidth": "30%" },
                { "mDataProp": 2,"sWidth": "30%" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sWidth": "25%",
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
})/**
 * Created by root on 14-10-30.
 */
