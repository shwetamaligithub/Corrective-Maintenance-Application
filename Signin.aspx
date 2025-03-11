<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Corrective Maintenance Application</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css?v=1" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css?v=1" rel="stylesheet">
    

</head>

<body class="bg-gradient-primary">

    <div class="container">
    
        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    
                                    <form class="user" runat="server" >
                                    
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!&nbsp;&nbsp;&nbsp;&nbsp;
                                        </h1>
                                    </div>
                                   
                                 
                                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" 
                    CssClass="failureNotification" ValidationGroup="LoginUserValidationGroup" 
                    ForeColor="#FF3300" />
                                        <div class="form-group">
                                                <asp:TextBox class="form-control form-control-user" ID="txtemail" runat="server" placeholder="User"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="txtemailRequired" runat="server" 
                                                ControlToValidate="txtemail" CssClass="failureNotification" 
                                                ErrorMessage="Email is required." ToolTip="Email is required." 
                                                ValidationGroup="LoginUserValidationGroup" ForeColor="#FF3300" 
                                                ViewStateMode="Enabled">*</asp:RequiredFieldValidator>
                                        
                                        </div>
                                        <div class="form-group">

                                            <asp:TextBox class="form-control form-control-user"  ID="txtpwd" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtpwd" CssClass="failureNotification" 
                                            ErrorMessage="Password is required." ToolTip="password is required." 
                                            ValidationGroup="LoginUserValidationGroup" ForeColor="#FF3300" 
                                            ViewStateMode="Enabled">*</asp:RequiredFieldValidator>
                                       
                                        </div>
                                        
                                       


<asp:Button class="btn btn-primary btn-user btn-block" ID="btnlogin" runat="server" Text="Login" 
                                        onclick="btnlogin_Click" ValidationGroup="LoginUserValidationGroup" 
                                        PostBackUrl="~/Dashboard.aspx" />
 
                                   <center><asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label></center>
                                       <%--<hr>

                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>--%>
                                    </form>
                                    <hr />
                                    <div class="text-center">
                                        <a class="small" href="Forgot-password.aspx">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="Registration.aspx">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
