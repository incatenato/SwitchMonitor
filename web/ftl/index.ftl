<html>
<head><title>ViralPatel.net - FreeMarker Spring MVC Hello World</title>
<body>
<div id="header">
    <H2>
        FreeMarker Spring MVC Hello World
    </H2>
</div>

<div id="content">

    <fieldset>
        <legend>Add User</legend>
        <form name="user" action="/add.html" method="post">
            Firstname: <input type="text" name="firstName" /> <br/>
            Lastname: <input type="text" name="lastName" />   <br/>
            <input type="submit" value="   Save   " />
        </form>
    </fieldset>
    <br/>
    <table class="datatable">
        <tr>
            <th>Firstname</th>  <th>Lastname</th>
        </tr>
    <#list model["userList"] as user>
        <tr>
            <td>${user.firstName}</td> <td>${user.lastName}</td>
        </tr>
    </#list>
    </table>
    <div id="inner"></div>

</div>
</body>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"/>
<script type="text/javascript" src="../js/test.js"/>
</html>