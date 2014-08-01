var Login = function () {
    
    return {
        //main function to initiate the module
        init: function () {
        	
           $('.login-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                userid: {
	                    required: true
	                },
	                password: {
	                    required: true
	                }
	            },

	            messages: {
	                userid: {
	                    required: "账号不能为空."
	                },
	                password: {
	                    required: "密码不能为空."
	                }
	            },
                            /*
	            invalidHandler: function (event, validator) {
	                $('.alert-error', $('.login-form')).show();
	            },             */

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                loginCheck();
	            }
	        });

	        $('.register-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                ruserid: {
	                    required: true
	                },
	                rpassword: {
	                    required: true
	                },
	                repassword: {
	                    equalTo: "#register_password"
	                },
                    rusername: {
                        required:true
                    },
                    department: {
                        required:true
                    }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
                    repassword: {
                        equalTo: "两次密码不一致."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {

	            },

	            submitHandler: function (form) {
	                SignUp();
	            }
	        });

	        jQuery('#register-btn').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.register-form').show();
	        });

	        jQuery('#register-back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.register-form').hide();
	        });
        }

    };

}();