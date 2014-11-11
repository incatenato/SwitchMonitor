var manageTbl;
$(function(){
    $.post("/device/list",null,function(data){
        $('#sample_1').on('click', 'td .blue', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            window.location.href='/device/'+id+'/edit';
        });

        $('#sample_1').on('click', 'td .green', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            window.location.href='/config/'+id+'/show ';
        });

        $('#sample_1').on('click', 'td .red', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            if(confirm('really?')){
                $.post("/device/delete",{id:id},function(data){
                    if(data=='success'){
                        window.location.href='/device/show';
                    }
                    else{
                        alert('Fail...');
                    }
                })
            }
            else{
                return;
            }
        });

        manageTbl = $("#sample_1").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID","sWidth": "5%" },
                { "mData": "Device IP","sWidth": "15%" },
                { "mData": "Device name","sWidth": "15%" },
                { "mData": "Device address","sWidth": "15%" },
                { "mData": "Device info", "sClass": "center","sWidth": "22%" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sWidth": "28%",
                    "sDefaultContent": '<a class="btn blue" href="#"><i class="icon-edit icon-white"></i>Edit</a>&nbsp;&nbsp;<a class="btn green" href="#"><i class="icon-arrow-up icon-white"></i>Config</a>&nbsp;&nbsp;<a class="btn red" href="#"><i class="icon-edit icon-white"></i>Delete</a>'
                }
            ],
            "bDestroy" : true,
            "sPaginationType": "bootstrap",
            "bAutoWith": true,
            "bSort": true,
            "bLengthChange": false,
            "bStateSave": false
        });
    });
});



