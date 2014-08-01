function loginCheck(){
    var userid = $("input[name='userid']").val();
    var userpass = $("input[name='password']").val();
    if(userid==''||userpass==''){
        return;
    }
    var type = "login";
    $.post("/login.action",{userid:userid,userpass:userpass,type:type},function(data){
        if(data=='failed'){
            $("#err_msg").html("User name/password error.");
            $('.alert-error', $('.login-form')).show();
        }
    });
}

function SignUp(){
    var userid = $("input[name='ruserid']").val();
    var userpass = $("input[name='rpassword']").val();
    var rpass = $("input[name='repassword']").val();
    var username = $("input[name='rusername']").val();
    var department = $("input[name='department']").val();
    if(userid==''||userpass==''||rpass==''||username==''||department==''){
        return;
    }
    var type = "sign";
    $.post("/loginCheck",{userid:userid,userpass:userpass,username:username,department:department,type:type},function(data){
        if(data=='id_error'){
            $("#err_msg2").html("账号重复，请重新输入.");
            $('.alert-error', $('.register-form')).show();
        }
        if(data=='sign_success'){
            alert('注册成功！');
            $('.login-form').show();
            $('.register-form').hide();
        }
        if(data=='sign_fail'){
            $("#err_msg2").html("注册失败，请联系网管中心.");
            $('.alert-error', $('.register-form')).show();
        }
    });
}