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
                        Pon config
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
                        <li><a href="#">pon</a></li>
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
                                    <select class="small m-wrap" tabindex="1" id="boardId">
                                        <option value="0">Board 0</option>
                                        <option value="1">Board 1</option>
                                        <option value="2">Board 2</option>
                                        <option value="3">Board 3</option>
                                        <option value="4">Board 4</option>
                                        <option value="5">Board 5</option>
                                        <option value="6">Board 6</option>
                                        <option value="7">Board 7</option>
                                    </select>
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
                                <%--hidden value--%>
                                <input type="hidden" value="${device.id}" id="bid"/>
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                    <h3 class="form-section">Pon config</h3>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="positionDiv">
                                                <label class="control-label">* Board position</label>
                                                <div class="controls">
                                                    <input type="text" name="boardPosition" id="boardPosition" placeholder="*/*" class="m-wrap small">
                                                    <span class="help-inline">Select pon from top table.</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 0 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port0" onchange="ponConfig2(0)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 1 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port1" onchange="ponConfig2(1)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 2 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port2" onchange="ponConfig2(2)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 3 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port3" onchange="ponConfig2(3)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 4 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port4" onchange="ponConfig2(4)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 5 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port5" onchange="ponConfig2(5)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 6 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port6" onchange="ponConfig2(6)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group">
                                                <label class="control-label">port 7 ont auto find:</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" name="portStat" id="port7" onchange="ponConfig2(7)">
                                                        <option value="enable">enable</option>
                                                        <option value="disable">disable</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" onclick="ponConfig()" class="btn blue"><i class="icon-ok"></i>OK</button>
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
<script src="../../resources/javascript/PonConfig.js" type="text/javascript"></script>
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