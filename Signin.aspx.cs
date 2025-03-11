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


public partial class SignIn : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnetdb.mdf;User Instance=true");
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        int lRoleId;
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select * from User_Master where unm=@User and pwd=@Pwd", con);
        con.Open();
        cmd.Parameters.AddWithValue("@User", txtemail.Text);
        cmd.Parameters.AddWithValue("@Pwd", txtpwd.Text);


        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            lRoleId = int.Parse(dt.Rows[0]["Roleid"].ToString());

            if (lRoleId == 1001)
            {
                Response.Redirect("ProductionTeamLeader.aspx");
            }
            else if (lRoleId == 1002)
            {
                Response.Redirect("ProductionLineLeader.aspx");
            }
            else if (lRoleId == 1006)
            {
                Response.Redirect("HRManagerLeader.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Account')</script>");
            }

        }
        else
        {
            Label1.Text = ("Incorrect Account");
        
        }
        

    }
     private int GetRole(int puserid)
    {
        int lRoleId = 0;
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("select Roleid from User_Master where uid=" + puserid, con);
        con.Open();
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@User", txtemail.Text);
        cmd.Parameters.AddWithValue("@Pwd", txtpwd.Text);

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        //cmd.ExecuteNonQuery();
        
        return lRoleId;
    }
}

    

    

    


