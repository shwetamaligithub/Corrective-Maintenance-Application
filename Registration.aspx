<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Corrective Maintenance Application</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css?v=1" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
    

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="First Name" runat="server">
                            Passwords are required to be a minimum of 6 characters in length.
                            <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" 
                            CssClass="failureNotification" ValidationGroup="RegisterUserValidationGroup" 
                            ForeColor="#FF3300" />
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                       <asp:TextBox class="form-control form-control-user" ID="txtfnm" runat="server" placeholder="First Name"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfnm" 
                                       CssClass="failureNotification" ErrorMessage="First Name is required." ToolTip="First Name is required." 
                                       ValidationGroup="RegisterUserValidationGroup" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox class="form-control form-control-user" ID="txtlnm" runat="server" placeholder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlnm" 
                                        CssClass="failureNotification" ErrorMessage="Last Name is required." ToolTip="Last Name is required." 
                                        ValidationGroup="RegisterUserValidationGroup" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox class="form-control form-control-user" ID="txtemail" runat="server" placeholder="Email Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" 
                                    CssClass="failureNotification" ErrorMessage="Email Address is required." ToolTip="Email Address is required." 
                                    ValidationGroup="RegisterUserValidationGroup" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox class="form-control form-control-user" ID="txtPwd" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txtPwd" 
                                        CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                        ValidationGroup="RegisterUserValidationGroup" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox class="form-control form-control-user" ID="txtrpwd" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtrpwd" 
                                            CssClass="failureNotification" Display="Dynamic" 
                                        ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                                        ToolTip="Confirm Password is required." 
                                            ValidationGroup="RegisterUserValidationGroup" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                            ControlToCompare="txtPwd" ControlToValidate="txtrpwd" 
                                        CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                        ValidationGroup="RegisterUserValidationGroup" ForeColor="Red">*</asp:CompareValidator>
                                    </div>
                                </div>
                               <asp:Button class="btn btn-primary btn-user btn-block" ID="btnlogin" 
                                    runat="server" Text="Register Account" 
                                    ValidationGroup="RegisterUserValidationGroup" onclick="btnlogin_Click"  
                                />

                                </a>
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="Forgot-password.aspx">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="Signin.aspx">Already have an account? Login!</a>
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
