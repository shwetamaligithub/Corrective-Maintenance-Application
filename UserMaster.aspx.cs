using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class UserMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnetdb.mdf;User Instance=true");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }
    private void BindGrid()
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "SELECT * FROM User_Master";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM User_Master", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "uid");
                    if (ds.Tables["uid"].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables["uid"];
                        GridView1.DataBind();
                    }
                    con.Close();
                }
            }
        }
    }
    protected void ChangeStatus(object sender, EventArgs e)
    {
        String constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        Button btn = sender as Button;
        GridViewRow row = btn.NamingContainer as GridViewRow;
        int Rid = Convert.ToInt32(this.GridView1.DataKeys[row.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE User_Master SET status = @status WHERE uid = @uid", con))
            {
                cmd.Parameters.AddWithValue("@Status", btn.Text == "Active" ? 0 : 1);
                cmd.Parameters.AddWithValue("@uid", txtID.Text);
                cmd.Parameters.AddWithValue("@Roleid", txtRoleid.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@enm", txtName.Text);
                cmd.Parameters.AddWithValue("@unm", txtemail.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPwd.Text);
                cmd.Parameters.AddWithValue("@cpwd", txtConfirm.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtRoleid.SelectedItem.Value = GridView1.SelectedRow.Cells[2].Text;
        txtName.Text = GridView1.SelectedRow.Cells[3].Text;
        txtemail.Text = GridView1.SelectedRow.Cells[4].Text;
        txtPwd.Text = GridView1.SelectedRow.Cells[5].Text;
        txtConfirm.Text = GridView1.SelectedRow.Cells[6].Text;



        txtaction.SelectedItem.Value = GridView1.SelectedRow.Cells[7].Text;
        txtStatus.Text = GridView1.SelectedRow.Cells[7].Text.ToUpper();
        if (GridView1.SelectedRow.Cells[7].Text.ToUpper() == "FALSE")
            Button4.Text = "Activate";
        else
            Button4.Text = "Deactivate";



    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into User_Master values('"+ txtID.Text + "','" + txtRoleid.SelectedItem.Value + "','" + txtName.Text + "','" + txtemail.Text + "','" + txtPwd.Text + "','" + txtConfirm.Text + "','" + txtaction.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
        
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[User_Master] SET [uid] ='" + txtID.Text + "',[Roleid]='" + txtRoleid.SelectedItem.Value + "',[enm]= '" + txtName.Text + "',[unm] ='" + txtemail.Text + "',[pwd] ='" + txtPwd.Text + "',[cpwd] ='" + txtConfirm.Text + "',[status] ='" + txtaction.SelectedItem.Value + "'WHERE [uid]='" + txtID.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>");
        

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        if (txtStatus.Text.ToUpper() == "FALSE")
        {
            cmd.CommandText = "update User_Master set Status = 'True'  where uid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Activated')</script>");


        }
        else
        {
            cmd.CommandText = "update User_Master set Status = 'False'  where uid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Deactivated')</script>");
        }
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        this.BindGrid();
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        txtID.Text = "";
        txtRoleid.SelectedItem.Value = "";
        txtName.Text = "";
        txtemail.Text = "";
        txtPwd.Text = "";
        txtConfirm.Text = "";
        txtaction.SelectedItem.Value = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtaction.SelectedValue == "-1")
        {
            Response.Write("Please select an User name");
        }
        else
        {
            string query = "select * from User_Master where status =@status";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@status", txtaction.SelectedItem.Value);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
    }
        
    
    }



  

