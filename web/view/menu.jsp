<%@ page contentType="text/html;charset=GBK" language="java" %>
<div class="page-sidebar nav-collapse collapse" id="menu">
<!-- BEGIN SIDEBAR MENU -->
<ul class="page-sidebar-menu">
<li>
    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
    <div class="sidebar-toggler hidden-phone"></div>
    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
</li>
<li>
    <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
    <form class="sidebar-search">
        <div class="input-box">
            <a href="javascript:;" class="remove"></a>
            <input type="text" placeholder="Search something..." id="search"/>
            <input type="button" class="submit" onclick="redirect()" />
        </div>
    </form>
    <!-- END RESPONSIVE QUICK SEARCH FORM -->
</li>
<li class="start">
    <a href="/user/index">
        <i class="icon-home"></i>
        <span class="title">Home</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="/device/add">
        <i class="icon-plus-sign"></i>
        <span class="title">Add device</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="RegistAp.jsp">
        <i class="icon-edit"></i>
        <span class="title">Device initial</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="/device/show">
        <i class="icon-cogs"></i>
        <span class="title">Device manage</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="deviceMonitor.jsp">
        <i class="icon-facetime-video"></i>
        <span class="title">Device monitor</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="deviceMonitor.jsp">
        <i class="icon-info"></i>
        <span class="title">Settings</span>
        <span></span>
    </a>
</li>
<li class="">
    <a href="Logout.jsp">
        <i class="icon-off"></i>
        <span class="title">Exit</span>
        <span></span>
    </a>
</li>
</ul>
<!-- END SIDEBAR MENU -->
</div>
<!--========================JS=============-->
<script src="../resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
    $('#menu').find('a').each(function(){
        if (this.href == document.location.href || document.location.href.search(this.href) >= 0) {
            $(this).parent("li").addClass('active'); // this.className = 'active';
            $(this).children(":last").addClass('selected');
        }
    });
</script>