<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModelAdminSignup.aspx.cs" Inherits="KYC_Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Signup</title>
  
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
        .short{
            color:#FF0000;
        }
        .weak{
            color:#E66C2C;
        }
        .good{
            color:#2D98F3;
        }
        .strong{
            color:#006400;
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
              <div><a class="logo" href="index.html"><img style="width:250px;" class="img-fluid for-light" src="assets/images/logo.png" alt="looginpage"><img class="img-fluid for-dark" src="assets/images/logo.png" alt="looginpage"></a></div>
              <div class="login-main"> 
                <form class="theme-form">
                  <h4>Create your account</h4>
                  <p>Enter your personal details to create account</p>
                  <div class="form-group">
                    <label class="col-form-label pt-0">Your Name</label>
                    <div class="row g-2">
                      <div class="col-6">
                        <input id="first-name" class="form-control" type="text" required="" placeholder="First name">
                      </div>
                      <div class="col-6">
                        <input id="last-name" class="form-control" type="text" required="" placeholder="Last name">
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-form-label">Email Address</label>
                    <input id="usr-email" class="form-control" type="email" required="" placeholder="Test@gmail.com">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label">Password</label>
                    <div class="form-input position-relative">
                      <input id="password" class="form-control" type="password" name="login[password]" required="" placeholder="*********">
                      <div class="show-hide"><span class="show"></span></div>
                    </div>
                      <div style="padding-top:5px;font-size:13px;"><span id="result"></span></div>
                  </div>
                  <div class="form-group mb-0">
                    <div class="checkbox p-0" style="visibility:hidden;">
                      <input id="checkbox1" type="checkbox">
                      <label class="text-muted" for="checkbox1">Agree with<a class="ms-2" href="#">Privacy Policy</a></label>
                    </div>
                    <button id="signup-btn" class="btn btn-primary btn-block w-100" type="button"> <span  class="btn-loader spinner-border spinner-border-sm"></span> Create Account</button>
                  </div>
                  
                  <p class="mt-4 mb-0">Already have an account?<a class="ms-2" href="ModelAdminLogin.aspx">Sign in</a></p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>

  
    <script>


        $(document).ready(function () {
            
            $("#signup-btn").click(function () {
                var first_name = $("#first-name").val();
                var last_name = $("#last-name").val();
                var email = $("#usr-email").val().trim();
                var password = $("#password").val().trim();

                var errors = "";
                if (first_name == "") {
                    errors += '<div class="error-msg">First Name Required</div>'
                } else if (first_name.length < 3) {
                    errors += '<div class="error-msg">First Name need atleast 3 characters</div>'
                }

                if (last_name == "") {
                    errors += '<div class="error-msg">Last Name Required</div>'
                } else if (last_name.length < 1) {
                    errors += '<div class="error-msg">Last Name need atleast  1 characters</div>'
                }

                if (!isEmail(email)) {
                    errors += '<div class="error-msg">invalid Email</div>'
                }

                if (password == "") {
                    errors += '<div class="error-msg">Password Required</div>'
                } else if (password.length < 8) {
                    errors += '<div class="error-msg">Password need atleast  8 characters</div>'
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

                    var register_data = {
                        first_name:first_name,
                        last_name:last_name,
                        email:email,
                        password:password,
                    }

                    $(".btn-loader").css("display","inline-block");
                    $.ajax({
                        url: 'Signup.aspx/RegisterUser',
                        method: 'post',
                        contentType: "application/json",
                        data: JSON.stringify(register_data),
                        dataType: "json",
                        success: function (data) {
                            console.log(data.d)
                            $(".btn-loader").hide();
                            if (data.d) {
                                swal({
                                    title: "Sorry",
                                    text: "Email Already Registerd with us",
                                    icon: "error",
                                });
                            } else {

                                swal({
                                    title: "Thank You",
                                    text: "Registration Completed",
                                    icon: "success",
                                }).then((value) => {
                                    window.location = "ModelAdminLogin.aspx";
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
        });

      

    </script>

    <script>

        $(document).ready(function() {

            $('#password').keyup(function(){
                $('#result').html(checkStrength($('#password').val()))
            }) 

            function checkStrength(password){
                var strength = 0
                if (password.length < 6) { 
                    $('#result').removeClass(); 
                    $('#result').addClass('short'); 
                    return 'Too short' 
                }
                if (password.length > 7) strength += 1

                if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
                if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
                if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
                if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/)) strength += 1

                if (strength < 2 ) { 
                    $('#result').removeClass() 
                    $('#result').addClass('weak') 
                    return 'Weak' 
                }else if (strength == 2 ) {
                    $('#result').removeClass()
                    $('#result').addClass('good') 
                    return 'Good' 
                }

                else {
                    $('#result').removeClass()
                    $('#result').addClass('strong')
                    return 'Strong'
                }

                
               
            }
        });
    </script>
</body>
</html>
