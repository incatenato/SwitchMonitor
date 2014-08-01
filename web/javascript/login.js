function loginCheck(){
    var userid = $("input[name='userid']").val();
    var userpass = $("input[name='password']").val();
    if(userid==''||userpass==''){
        return;
    }
    $.post("/login.action",{userName:userid,userPass:userpass},function(data){
        if(data=='failed'){
            $("#err_msg").html("User name/password error.");
            $('.alert-error', $('.login-form')).show();
        }
        if(data=='success'){
            alert('success');
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
    $.post("/loginCheck",{userName:userid,userPass:userpass,name:username,area:department},function(data){
        if(data=='success'){
            $("#err_msg2").html("Register success!");
            $('.alert-error', $('.register-form')).show();
        }
        if(data=='failed'){
            $("#err_msg2").html("This id already exist.");
            $('.alert-error', $('.register-form')).show();
        }
    });
}