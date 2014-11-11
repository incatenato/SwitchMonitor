var manageTbl;
$(function(){
    $.post("/device/list",null,function(data){
        $('#sample_1').on('click', 'td .blue', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            window.location.href='/device/'+id+'/monitor';
        });

        $('#sample_1').on('click', 'td .green', function() {
            var id = $(this).closest('tr').find('td:nth-child(1)').html();
            window.location.href='/device/'+id+'/monitor';
        });

        manageTbl = $("#sample_1").dataTable({
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span12'i><'span12 center'p>>",
            "bPaginate": true,
            "aaData" :data,
            "aoColumns": [
                { "mData": "ID","sWidth": "5%" },
                { "mData": "Device IP","sWidth": "15%" },
                { "mData": "Device name","sWidth": "15%" },
                { "mData": "Device address","sWidth": "20%" },
                { "mData": "Device info", "sClass": "center","sWidth": "25%" },
                {
                    "mData": null,
                    "sClass": "center",
                    "sWidth": "18%",
                    "sDefaultContent": '<a class="btn blue" href="#"><i class="icon-flag icon-white"></i>Flow</a>&nbsp;&nbsp;<a class="btn green" href="#"><i class="icon-bar icon-white"></i>Ont</a>'
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



