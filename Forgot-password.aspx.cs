using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Web.Security;
using System.Configuration;

public partial class Forgot_password : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GeneratePassword  lPass = new GeneratePassword();

        String lpwd = lPass.Generate(10);

        SendingMail lSend = new SendingMail();

        lSend.SendEmail(exampleInputEmail.Text, "Password for CMS ", "Dear User, Your Password for CMS is " + lpwd);

        
    }
}
        
       
