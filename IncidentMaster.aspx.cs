using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class IncidentMaster : System.Web.UI.Page
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
        string query = "SELECT * FROM Incident_Master";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM Incident_Master", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Incidentid");
                    if (ds.Tables["Incidentid"].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables["Incidentid"];
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
            using (SqlCommand cmd = new SqlCommand("UPDATE Incident_Master SET Status = @Status WHERE Incidentid = @Incidentid", con))
            {
                cmd.Parameters.AddWithValue("@Status", btn.Text == "Active" ? 0 : 1);
                cmd.Parameters.AddWithValue("@Incidentid", txtID.Text);
                cmd.Parameters.AddWithValue("@Inm", txtName.Text);
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
        cmd.CommandText = "insert into Incident_Master values('" + txtID.Text + "','" + txtName.Text + "','" + txtDescription.Text + "','" + DropDownList1.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        txtID.Text = "";
        txtName.Text = "";
        txtDescription.Text = "";
        DropDownList1.SelectedItem.Value = "";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        if (txtStatus.Text.ToUpper() == "FALSE")
        {
            cmd.CommandText = "update Incident_Master set Status = 'True'  where Incidentid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Activated')</script>");


        }
        else
        {
            cmd.CommandText = "update Incident_Master set Status = 'False'  where Incidentid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Deactivated')</script>");
        }
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        this.BindGrid();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtDescription.Text = GridView1.SelectedRow.Cells[3].Text;
        DropDownList1.SelectedItem.Value = GridView1.SelectedRow.Cells[4].Text;
        txtStatus.Text = GridView1.SelectedRow.Cells[4].Text.ToUpper();
        if (GridView1.SelectedRow.Cells[4].Text.ToUpper() == "FALSE")
            Button4.Text = "Activate";
        else
            Button4.Text = "Deactivate";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (DropDownList1.SelectedValue == "-1")
        {
            Response.Write("Please select an Incident name");
        }
        else
        {
            string query = "select * from Incident_Master where status =@status";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Value);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
           
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Incident_Master] SET [Incidentid] ='" + txtID.Text + "',[Inm]= '" + txtName.Text + "',[Des] ='" + txtDescription.Text + "',[Status] ='" + txtStatus.Text + "'WHERE [Incidentid]='" + txtID.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>");  
    }
}