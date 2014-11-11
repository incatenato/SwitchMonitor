var chart,chart2,chartFlow;
$(function () {
    $(document).ready(function() {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'chart_sample',
                type: 'spline',
                marginRight: 10,
                events: {
                    load: function() {
                        var series = this.series[0];
                        setInterval(function() {
                            var ipadd = $("#monitorIp").val();
                            $.post("Monitor",{ipadd:ipadd},function(data){
                                var x = (new Date()).getTime();
                                series.addPoint([x,eval(data)], true, true);
                            });
                        }, 60000);
                    }
                }
            },
            title: {
                text: 'Real time flow'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 120
            },
            yAxis: {
                title: {
                    text: 'flow'
                },
                min: 0,
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            credits:{
                enabled:true,
                href:"http://www.gtao.com",
                text:"GuanTao"
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                        Highcharts.numberFormat(this.y, 0)+'M';
                }
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [
                {
                    name: 'flow',
                    data: (function() {
                        var data = [],
                            time = (new Date()).getTime(),
                            i;
                        for (i = -19; i <= 0; i++) {
                            data.push({
                                x: time + i * 60000,
                                y: 0
                            });
                        }
                        return data;
                    })()
                }
            ]
        });

        chart2 = new Highcharts.Chart({
            chart: {
                renderTo:'chart_flow',
                type: 'area'
            },
            title: {
                text: 'History flow'
            },
            xAxis: {
                categories:[],
                labels: {
                    enabled:false
                }
            },
            credits:{
                enabled:true,
                href:"http://www.gtao.com",
                text:"GuanTao"
            },
            yAxis: {
                title: {
                    text: 'flow'
                },
                tickInterval:1,
                labels: {
                    formatter: function() {
                        return this.value +'M';
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    return '<b>this time flow</b><br/>'+
                    this.x +': '+ this.y +'M';
                }
            },
            exporting:false,
            plotOptions: {
                area: {
                    marker: {
                        enabled: false,
                        symbol: 'circle',
                        radius: 2,
                        states: {
                            hover: {
                                enabled: true
                            }
                        }
                    }
                }
            },
            series: [{
                name:'real time',
                color:'orange',
                data: []
            }]
        });

//        chartFlow = new Highcharts.Chart({
//            chart: {
//                renderTo:'chart_flow',
//                type: 'area'
//            },
//            credits:{
//                enabled:true,
//                href:"http://www.gtao.com",
//                text:"GuanTao"
//            },
//            title: {
//                text: 'Real time flow'
//            },
//            xAxis: {
//                categories:[],
//                labels: {
//                    enabled:false
//                }
//            },
//            yAxis: {
//                title: {
//                    text: 'flow'
//                },
//                labels: {
//                    formatter: function() {
//                        return this.value +'bit';
//                    }
//                }
//            },
//            tooltip: {
//                formatter: function() {
//                    return '<b>this time flow</b><br/>'+
//                        this.x +': '+ this.y +'bit';
//                }
//            },
//            exporting:false,
//            plotOptions: {
//                area: {
//                    marker: {
//                        enabled: false,
//                        symbol: 'circle',
//                        radius: 2,
//                        states: {
//                            hover: {
//                                enabled: true
//                            }
//                        }
//                    }
//                }
//            },
//            series: [{
//                name:'����',
//                data: []
//            },{
//                name:'����',
//                data: []
//            }]
//        });


        $(function(){
            var startTime = $("#from").val();
            var endTime = $("#to").val();
            var ipadd = $("#monitorIp").val();
            var type1 = 'x';
            var type2 = 'y';
            $.post("HistoryOnline",{start:startTime,end:endTime,ipadd:ipadd,type:type1},function(data){
                chart2.xAxis[0].setCategories(data);
            });
            $.post("HistoryOnline",{start:startTime,end:endTime,ipadd:ipadd,type:type2},function(data){
                chart2.series[0].setData(data);
            });
        });

        $(function(){
            var startTime = $("#start").val();
            var endTime = $("#end").val();
            var ipadd = $("#monitorIp").val();
            var typerx = 'RX';
            var typetx = 'TX';
            var typex = 'x';
            $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typex},function(data){
                chartFlow.xAxis[0].setCategories(data);
            });
            $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typetx},function(data){
                chartFlow.series[0].setData(data);
            });
            $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typerx},function(data){
                chartFlow.series[1].setData(data);
            });
        });
        //��ʼ������
    })
});

function repaint(){
    var startTime = $("#from").val();
    var endTime = $("#to").val();
    var ipadd = $("#monitorIp").val();
    var type1 = 'x';
    var type2 = 'y';
    $.post("HistoryOnline",{start:startTime,end:endTime,ipadd:ipadd,type:type1},function(data){
        chart2.xAxis[0].setCategories(data);
    });
    $.post("HistoryOnline",{start:startTime,end:endTime,ipadd:ipadd,type:type2},function(data){
        chart2.series[0].setData(data);
    });
    chart2.redraw();
}

function repaintFlow(){
    var startTime = $("#start").val();
    var endTime = $("#end").val();
    var ipadd = $("#monitorIp").val();
    var typerx = 'RX';
    var typetx = 'TX';
    var typex = 'x';
    $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typex},function(data){
        chartFlow.xAxis[0].setCategories(data);
    });
    $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typetx},function(data){
        chartFlow.series[0].setData(data);
    });
    $.post("FlowServlet",{start:startTime,end:endTime,ipadd:ipadd,type:typerx},function(data){
        chartFlow.series[1].setData(data);
    });
    chartFlow.redraw();
}