﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HoistMaster : System.Web.UI.Page
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
        string query = "SELECT * Hoist_Master";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM Hoist_Master", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Hid");
                    if (ds.Tables["Hid"].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables["Hid"];
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
            using (SqlCommand cmd = new SqlCommand("UPDATE Hoist_Master SET Status = @Status WHERE Mid = @Mid", con))
            {
                cmd.Parameters.AddWithValue("@Status", btn.Text == "Active" ? 0 : 1);
                cmd.Parameters.AddWithValue("@Hid", txtID.Text);
                cmd.Parameters.AddWithValue("@Hnm", txtName.Text);
                cmd.Parameters.AddWithValue("@Hno", txtNo.Text);
                cmd.Parameters.AddWithValue("@Des", txtDescription.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into Hoist_Master values('" + txtID.Text + "','" + txtName.Text + "','" + txtNo.Text + "','" + txtDescription.Text + "','" + txtaction.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Hoist_Master] SET [Hid] ='" + txtID.Text + "',[Hnm]= '" + txtName.Text + "',[Hno] ='" + txtNo.Text + "',[Des] ='" + txtDescription.Text +"',[Status] ='" + txtStatus.Text + "'WHERE [Hid]='" + txtID.Text + "'");
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
            cmd.CommandText = "update Hoist_Master set Status = 'True'  where Hid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Activated')</script>");


        }
        else
        {
            cmd.CommandText = "update Hoist_Master set Status = 'False'  where Hid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Deactivated')</script>");
        }
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        this.BindGrid();
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {

        txtID.Text = "";
        txtName.Text = "";
        txtNo.Text = "";
        txtDescription.Text = "";
        txtaction.SelectedItem.Value = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Hoist_Master] SET [Hid] ='" + txtID.Text + "',[Hnm]= '" + txtName.Text + "',[Hno] ='" + txtNo.Text + "',[Des] ='" + txtDescription.Text + "',[Status] ='" + txtStatus.Text + "'WHERE [Hid]='" + txtID.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>"); 
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtNo.Text = GridView1.SelectedRow.Cells[3].Text;
        txtDescription.Text = GridView1.SelectedRow.Cells[4].Text;
        txtaction.SelectedItem.Value = GridView1.SelectedRow.Cells[5].Text;
        txtStatus.Text = GridView1.SelectedRow.Cells[5].Text.ToUpper();
        if (GridView1.SelectedRow.Cells[5].Text.ToUpper() == "FALSE")
            Button4.Text = "Activate";
        else
            Button4.Text = "Deactivate";
    }
}