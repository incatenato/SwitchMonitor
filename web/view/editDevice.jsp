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
            Edit device info
        </h3>
        <ul class="breadcrumb">
            <li>
                <i class="icon-home"></i>
                <a href="/user/index">index</a>
                <i class="icon-angle-right"></i>
            </li>
            <li><a href="#">edit</a></li>
        </ul>
        <!-- END PAGE TITLE & BREADCRUMB-->
    </div>
</div>
<!-- END PAGE HEADER-->
<div id="dashboard">
<div class="row-fluid">
    <div class="span12">
        <div class="portlet box green">
        <div class="portlet-title">
            <div class="caption"><i class="icon-reorder"></i>Edit device</div>
            <div class="tools">
                <a href="javascript:" class="collapse"></a>
            </div>
        </div>
        <div class="portlet-body form">
        <!-- BEGIN FORM-->
        <form action="/device/edit" class="form-horizontal">
        <h3 class="form-section">Edit information</h3>
        <div class="row-fluid">
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Device name</label>
                    <div class="controls">
                        <input type="text" name="deviceName" id="deviceName" value="${device.deviceName}" placeholder="Login name" class="m-wrap span12">
                        <input type="hidden" id="deviceID" name="deviceId" value="${device.id}">
                    </div>
                </div>
            </div>
            <!--/span-->
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Device ip</label>
                    <div class="controls">
                        <input class="span12 m-wrap" name="deviceIp" id="deviceIp" value="${device.deviceIp}" type="text" maxlength="15" size="15">
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <!--/span-->
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Login name</label>
                    <div class="controls">
                        <input type="text" name="loginName" id="loginName" value="${device.loginName}" placeholder="Login name" class="m-wrap span12">
                    </div>
                </div>
            </div>
            <!--/span-->
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Login password</label>
                    <div class="controls">
                        <input type="text" name="loginPass" id="loginPass" value="${device.loginPass}" placeholder="Login password" class="m-wrap span12">
                    </div>
                </div>
            </div>
            <!--/span-->
        </div>
        <div class="row-fluid">
            <!--/span-->
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Enable password</label>
                    <div class="controls">
                        <input type="text" name="enablePass" id="enablePass" value="${device.enablePass}" placeholder="Enable password" class="m-wrap span12">
                    </div>
                </div>
            </div>
            <!--/span-->
            <!--/span-->
            <div class="span6 ">
                <div class="control-group">
                    <label class="control-label">Config password</label>
                    <div class="controls">
                        <input type="text" name="configPass" id="configPass" value="${device.configPass}" placeholder="Config password" class="m-wrap span12">
                    </div>
                </div>
            </div>
            <!--/span-->
        </div>
        <div class="row-fluid">
            <!--/span-->
            <div class="span12 ">
                <div class="control-group">
                    <label class="control-label">Device address</label>
                    <div class="controls">
                        <input type="text" name="deviceAddress" id="deviceAddress" value="${device.deviceAddress}" placeholder="Device address" class="m-wrap span12">
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <!--/span-->
            <div class="span12 ">
                <div class="control-group">
                    <label class="control-label">Device info</label>
                    <div class="controls">
                        <input type="text" name="deviceInfo" id="deviceInfo" value="${device.deviceInfo}" placeholder="Device info" class="m-wrap span12">
                    </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <button type="button" onclick="editDevice()" class="btn blue"><i class="icon-ok"></i>Update</button>
            <button type="button" class="btn green" onclick="cofigDevice()"><i class="icon-arrow-up"></i>Config</button>
            <button type="button" class="btn">Back</button>
        </div>
        </form>
        <!-- END FORM-->
        </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
</div>
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