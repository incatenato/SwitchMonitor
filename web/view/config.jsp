<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh-CN" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh-CN" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="zh-CN" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="GBK" />
    <title>Edit device information</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="../../resources/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../../resources/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="../../resources/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../../resources/css/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="../../resources/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<%@include file="header.jsp"%>
<!-- END HEADER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <%@include file="menu.jsp"%>
    <!-- END SIDEBAR -->
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
        <!-- BEGIN PAGE HEADER-->
        <div class="row-fluid">
            <div class="span12">
                <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                <h3 class="page-title">
                    ${device.deviceName} <small>config panel</small>
                </h3>
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="/user/index">Home</a>
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">config panel</a>
                    </li>
                </ul>
                <!-- END PAGE TITLE & BREADCRUMB-->
            </div>
        </div>
        <!-- END PAGE HEADER-->
        <!-- BEGIN PAGE CONTENT-->
        <div class="tiles">
            <div class="tile double bg-blue" onclick="window.location.href='/config/${device.id}/boardManage'">
                <div class="tile-body">
                    <i class="icon-plus"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Create service board
                    </div>
                </div>
            </div>
            <div class="tile double bg-green" onclick="window.location.href='/config/${device.id}/ponConfig'">
                <div class="tile-body">
                    <i class="icon-sitemap"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Pon config
                    </div>
                </div>
            </div>
            <div class="tile double bg-red" onclick="window.location.href='/config/${device.id}/vlanConfig'">
                <div class="tile-body">
                    <i class="icon-globe"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Vlan config
                    </div>
                </div>
            </div>
            <div class="tile double bg-yellow" onclick="window.location.href='/config/${device.id}/dba'">
                <div class="tile-body">
                    <i class="icon-folder-open"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Dba profile
                    </div>
                </div>
            </div>
            <div class="tile double bg-purple" onclick="window.location.href='/config/${device.id}/changePass'">
                <div class="tile-body">
                    <i class="icon-lock"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Change password
                    </div>
                </div>
            </div>
            <div class="tile double bg-blue" onclick="window.location.href='/config/${device.id}/firewall'">
                <div class="tile-body">
                    <i class="icon-fire"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Telnet firewall config
                    </div>
                </div>
            </div>
            <div class="tile double bg-green">
                <div class="tile-body">
                    <i class="icon-retweet"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Snmp config
                    </div>
                </div>
            </div>
            <div class="tile double bg-red" onclick="window.location.href='/config/${device.id}/ont'">
                <div class="tile-body">
                    <i class="icon-download-alt"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        ONT
                    </div>
                </div>
            </div>
            <div class="tile double bg-yellow">
                <div class="tile-body">
                    <i class="icon-refresh"></i>
                </div>
                <div class="tile-object">
                    <div class="name">
                        Something
                    </div>
                </div>
            </div>
        </div>
        <br>
        <!-- END PAGE CONTENT-->
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="footer.jsp"%>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<script src="../../resources/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="../../resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="../../resources/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../../resources/js/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="../../resources/js/excanvas.min.js"></script>
<script src="../../resources/js/respond.min.js"></script>
<![endif]-->
<script src="../../resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="../../resources/js/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="../../resources/js/date.js" type="text/javascript"></script>
<script src="../../resources/js/daterangepicker.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.gritter.js" type="text/javascript"></script>
<script src="../../resources/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
<script src="../../resources/js/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../../resources/js/app.js" type="text/javascript"></script>
<script src="../../resources/javascript/EditDevice.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init(); // init layout and core plugins
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>