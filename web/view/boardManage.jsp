<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh-CN" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh-CN" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="zh-CN" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="GBK" />
    <title>Service board manage</title>
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
                        Board manage
                    </h3>
                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="/user/index">index</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li>
                            <a href="/config/${device.id}/show">control panel</a>
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">manage</a></li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <div id="dashboard">
                <div class="row-fluid">
                    <div class="span12">
                        <!-- BEGIN BORDERED TABLE PORTLET-->
                            <div class="portlet box yellow">
                                <div class="portlet-title">
                                    <div class="caption"><i class="icon-coffee"></i>Board information</div>
                                    <div class="actions">
                                        <a href="#" onclick="changeTblDisplay()" class="btn red" id="hide_btn"><i class="icon-pencil"></i>Show</a>
                                        <div class="btn-group">
                                            <a class="btn warning" href="#" data-toggle="dropdown">
                                                <i class="icon-cogs"></i> Board
                                                <i class="icon-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li><a href="#"> 0</a></li>
                                                <li><a href="#"> 1</a></li>
                                                <li><a href="#"> 2</a></li>
                                            </ul>
                                            <input type="hidden" id="boardId" value="0">
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>SlotID</th>
                                            <th>Board Name</th>
                                            <th>Status</th>
                                            <th>SubType0</th>
                                            <th>SubType1</th>
                                            <th>Online/Offline</th>
                                        </tr>
                                        </thead>
                                        <tbody id="innerTbl">
                                            <c:forEach var="board" items="${boards}">
                                                <tr>
                                                    <td><c:out default="" value="${board.SLOT}"/></td>
                                                    <td><c:out default="" value="${board.BOARDNAME}"/></td>
                                                    <td><c:out default="" value="${board.STATUS}"/></td>
                                                    <td><c:out default="" value="${board.SUBTYPE0}"/></td>
                                                    <td><c:out default="" value="${board.SUBTYPE1}"/></td>
                                                    <td><span class="label label-success"><c:out default="" value="${board.ONLINESTATUS}"/></span></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END BORDERED TABLE PORTLET-->
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-reorder"></i>Control form</div>
                                <div class="tools">
                                    <a href="javascript:" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                    <h3 class="form-section">Manage service board</h3>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="positionDiv">
                                                <label class="control-label">* Board position</label>
                                                <div class="controls">
                                                    <input type="text" name="boardPosition" id="boardPosition" placeholder="*/*" class="m-wrap span12">
                                                    <span class="help-block" id="positionErr"></span>
                                                    <input type="hidden" id="deviceId" value="${device.id}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span6">
                                            <div class="control-group">
                                                <button type="button" id="btnGroup1" onclick="confirmBoard()" class="btn green"><i class="icon-check"></i>Confirm</button>
                                                <button type="button" id="btnGroup2" onclick="deleteBoard()" class="btn red"><i class="icon-remove"></i>Delete</button>
                                                <button type="button" id="btnGroup3" onclick="resetBoard()" class="btn yellow"><i class="icon-refresh"></i>Reset</button>
                                            </div>
                                        </div>
                                    </div>
                                        <!--/span-->
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="nameDiv">
                                                <label class="control-label">Board name</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="boardName" id="boardName" type="text" maxlength="15" size="15">
                                                    <span class="help-block" id="nameErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" id="btnGroup4" onclick="createBoard()" class="btn blue"><i class="icon-ok"></i>Create</button>
                                        <button type="button" id="btnGroup5" class="btn">Back</button>
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
<script src="../../resources/javascript/BoardManage.js" type="text/javascript"></script>
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