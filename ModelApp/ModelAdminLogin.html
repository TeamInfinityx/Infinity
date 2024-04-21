<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModelAdminLogin.aspx.cs" Inherits="KYC_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Login</title>
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
   
    <style>
        .customizer-links {
            display:none;
        }
        .btn-loader {
            display:none;
        }
         .error-msg {
            color:red;
            padding-top:5px;
            font-size:15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- login page start-->
    <div class="container-fluid p-0">
      <div class="row m-0">
        <div class="col-12 p-0">    
          <div class="login-card">
            <div>
              <div><a class="logo"><img  style="width:250px;" class="img-fluid for-light" src="assets/images/logo.png" alt="looginpage"><img class="img-fluid for-dark" src="assets/images/logo.png" alt="looginpage"></a></div>
              <div class="login-main"> 
              
                  <h4>Sign in to account</h4>
                  <p>Enter your email & password to login</p>
                  <div class="form-group">
                    <label class="col-form-label">Email Address</label>
                    <input id="usr-email" class="form-control" type="email" required="" placeholder="Test@gmail.com">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label">Password</label>
                    <div class="form-input position-relative">
                      <input id="usr-pwd" class="form-control" type="password" name="login[password]" required="" placeholder="*********">
                      <div class="show-hide"><span class="show">                         </span></div>
                    </div>
                  </div>
                  <div class="form-group mb-0">
                    <div class="checkbox p-0">
                    </div><a style="visibility:hidden;"  class="link">Forgot password?</a>
                    <div class="text-end mt-3">
                      <button id="login-btn" class="btn btn-primary btn-block w-100" type="button"> <span class="btn-loader spinner-border spinner-border-sm"></span> Sign in</button>
                    </div>
                  </div>
                  
                  <p >Don't have account?<a class="ms-2" href="ModelAdminSignup.aspx">Create Account</a></p>
             
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>

   
    <script>

        $("#login-btn").click(function () {

            var email = $("#usr-email").val().trim();
            var password = $("#usr-pwd").val().trim();
            var errors = "";
            if (!isEmail(email)) {
                errors += '<div class="error-msg">invalid Email</div>'
            }
            if (password == "") {
                errors += '<div class="error-msg">Password Required</div>'
            }

            if (errors != "") {

                $.confirm({
                    icon: 'fa fa-warning',
                    title: 'Error',
                    content: '' + errors + '',
                    type: 'red',
                    typeAnimated: true,
                    buttons: {

                        ok: {
                            text: 'Ok',
                            btnClass: '',
                            action: function () {


                            }
                        }

                    },
                    boxWidth: '30%',
                    useBootstrap: false,

                });



            } else {
                $(".btn-loader").css("display", "inline-block");

                var login_data = {
                    email: email,
                    password: password
                }
                console.log(login_data)
                $.ajax({
                    url: 'Login.aspx/ValidateUsr',
                    method: 'post',
                    contentType: "application/json",
                    data: JSON.stringify(login_data),
                    dataType: "json",
                    success: function (data) {
                        console.log(data.d)
                        $(".btn-loader").hide();
                        if (data.d.isVerified) {
                            if (data.d.usrType == 0) {
                                window.location = "Model_Admin_Dashboard.aspx";
                            } else {
                                window.location = "Model_Admin_Dashboard.aspx";
                            }
                            
                        } else {
                            swal({
                                title: "Sorry",
                                text: "Email or Password is incorrect",
                                icon: "error",
                            });   
                       }
                },
                    error: function (err) {
                    console.log(err)
                }
                });


             
            }
        });

        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
    </script>
</body>
</html>
