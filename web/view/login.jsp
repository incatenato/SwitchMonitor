<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh-CN" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="zh-CN" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="zh-CN"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="GBK" />
    <title>System login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="../resources/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="../resources/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../resources/css/login.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="../resources/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="form-vertical login-form">
        <h3 class="form-title">Login...</h3>
        <div class="alert alert-error hide">
            <button class="close" data-dismiss="alert"></button>
            <span id="err_msg"> </span>
        </div>
        <div class="control-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">User name:</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" placeholder="User name" type="text" name="userid"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">Password:</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-lock"></i>
                    <input class="m-wrap placeholder-no-fix" placeholder="Password" type="password" name="password"/>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn green pull-right">
                login <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="create-account">
            <p>
                No account?&nbsp;
                <a href="javascript:;" id="register-btn" class="">Sign up</a>
            </p>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form class="form-vertical register-form">
        <h3 class="">Sign up</h3>
        <div class="alert alert-error hide">
            <button class="close" data-dismiss="alert"></button>
            <span id="err_msg2"><!--提示--></span>
        </div>
        <p>Information...</p>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">User name</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="User name" name="ruserid"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-lock"></i>
                    <input class="m-wrap placeholder-no-fix" type="password" id="register_password" placeholder="Password" name="rpassword"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">Repeat password</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-ok"></i>
                    <input class="m-wrap placeholder-no-fix" type="password" placeholder="Repeat password" name="repassword"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">Name</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="Name" name="rusername"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">Area</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" type="text" placeholder="Area" name="department"/>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn">
                <i class="m-icon-swapleft"></i>Back
            </button>
            <button type="submit"  class="btn green pull-right">
                Submit <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END REGISTRATION FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2014 &copy; Guantao High Tech Co.,Ltd.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<script src="../resources/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="../resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="../resources/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="../resources/js/excanvas.min.js"></script>
<script src="../resources/js/respond.min.js"></script>
<![endif]-->
<script src="../resources/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../resources/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../resources/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="../resources/js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="../resources/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../resources/js/app.js" type="text/javascript"></script>
<!--验证JS-->
<script src="../resources/js/login.js" type="text/javascript"></script>
<script src="../resources/javascript/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init();
        Login.init();
    });
</script>
</body>
<!-- END BODY -->
</html>