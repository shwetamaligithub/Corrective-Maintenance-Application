using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(@"data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnetdb.mdf;User Instance=true");
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("insert into Register (fnm,lnm,email,Pwd,rpwd) values (@fnm,@lnm,@email,@Pwd,@rpwd) ", con);
        con.Open();
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@fnm", txtfnm.Text);
        cmd.Parameters.AddWithValue("@lnm", txtlnm.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@Pwd", txtPwd.Text);
        cmd.Parameters.AddWithValue("@rpwd", txtrpwd.Text);



        cmd.Connection = con;
        cmd.ExecuteNonQuery();

        if (ValidateUser(txtfnm.Text, txtlnm.Text, txtemail.Text, txtPwd.Text, txtrpwd.Text) == 1)
        {
            Response.Redirect("Signin.aspx");
        }
    }
    private long ValidateUser(String pfnmid, String plnm, String pemail, String pPwd, String prpwd)
    {

        if (pfnmid.Length > 0 && plnm.Length > 0 && pemail.Length > 0 && pPwd.Length > 0 && prpwd.Length > 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

}