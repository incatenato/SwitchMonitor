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
                        <li><a href="#">dba profile</a></li>
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
                                    <div class="caption"><i class="icon-coffee"></i>DBA detail</div>
                                    <%--actions--%>
                                </div>
                                <div class="portlet-body">
                                    <%--table--%>
                                </div>
                            </div>
                            <!-- END BORDERED TABLE PORTLET-->
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-reorder"></i>Dba profile</div>
                                <div class="tools">
                                    <a href="javascript:" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                    <h3 class="form-section">Create dba profile</h3>
                                    <%--profile id--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="profileIdDiv">
                                                <label class="control-label">* Profile ID</label>
                                                <div class="controls">
                                                    <input type="text" name="profileId" id="profileId" class="m-wrap span12">
                                                    <span class="help-block" id="profileIdError"></span>
                                                    <input type="hidden" id="deviceId" value="${device.id}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--profile name--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="nameDiv">
                                                <label class="control-label">Profile name</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="profileName" id="profileName" type="text" maxlength="15" size="15">
                                                    <span class="help-block" id="nameErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--type--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="typeDiv">
                                                <label class="control-label">Profile type</label>
                                                <div class="controls">
                                                    <select class="large m-wrap" tabindex="1" id="profileType">
                                                        <option value="type1">type1(fix)</option>
                                                        <option value="type2">type2(assure)</option>
                                                        <option value="type3" selected>type3(assure...max)</option>
                                                    </select>
                                                    <span class="help-block" id="typeErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--min bandwidth --%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="assureDiv">
                                                <label class="control-label" id="minLabel">Assure</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="minBw" id="minBw" placeholder="kb" type="text" maxlength="15" size="15">
                                                    <span class="help-block" id="minBwErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--max bandwidth--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="maxDiv">
                                                <label class="control-label" id="maxLabel">Max</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="maxBw" id="maxBw" type="text" placeholder="kb" maxlength="15" size="15">
                                                    <span class="help-block" id="maxBwErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" onclick="createDBAProfile()" class="btn blue"><i class="icon-ok"></i>Create</button>
                                        <button type="button" class="btn">Back</button>
                                    </div>
                                </form>
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>
                </div>

                <%--form2--%>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-reorder"></i>Dba line profile</div>
                                <div class="tools">
                                    <a href="javascript:" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                    <h3 class="form-section">Create dba profile</h3>
                                    <%--profile id--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="profileId2Div">
                                                <label class="control-label">* Profile ID</label>
                                                <div class="controls">
                                                    <input type="text" name="profileId" id="profileId2" class="m-wrap span12">
                                                    <span class="help-block" id="profileIdError2"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--profile name--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="nameDiv2">
                                                <label class="control-label">Profile name</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="profileName" id="profileName2" type="text" maxlength="15" size="15">
                                                    <span class="help-block" id="nameErr2"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" onclick="createDBALineProfile()" class="btn blue"><i class="icon-ok"></i>Create</button>
                                        <button type="button" class="btn">Back</button>
                                    </div>
                                </form>
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>
                </div>
                <%--dba service profile--%>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="portlet box yellow">
                            <div class="portlet-title">
                                <div class="caption"><i class="icon-reorder"></i>Dba service profile</div>
                                <div class="tools">
                                    <a href="javascript:" class="collapse"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form action="#" class="form-horizontal">
                                    <h3 class="form-section">Create dba profile</h3>
                                    <%--profile id--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="profileId3Div">
                                                <label class="control-label">* Profile ID</label>
                                                <div class="controls">
                                                    <input type="text" name="profileId" id="profileId3" class="m-wrap span12">
                                                    <span class="help-block" id="profileIdError3"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--profile name--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="nameDiv3">
                                                <label class="control-label">Profile name</label>
                                                <div class="controls">
                                                    <input class="span12 m-wrap" name="profileName" id="profileName3" type="text" maxlength="15" size="15">
                                                    <span class="help-block" id="nameErr3"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--eth number--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="eth">
                                                <label class="control-label">Eths number</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" id="ethNum">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                    </select>
                                                    <span class="help-block" id="ethErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--pots number--%>
                                    <div class="row-fluid">
                                        <div class="span6 ">
                                            <div class="control-group" id="pots">
                                                <label class="control-label">Pots number</label>
                                                <div class="controls">
                                                    <select class="small m-wrap" tabindex="1" id="potsNum">
                                                        <option value="0">0</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                    </select>
                                                    <span class="help-block" id="potsErr"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" onclick="createDBAServiceProfile()" class="btn blue"><i class="icon-ok"></i>Create</button>
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
<script src="../../resources/javascript/dbaProfile.js" type="text/javascript"></script>
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