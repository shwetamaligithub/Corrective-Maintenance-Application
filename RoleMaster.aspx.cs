using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class RoleMaster : System.Web.UI.Page
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
        string query = "SELECT * FROM Role_Master";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM Role_Master", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Rid");
                    if (ds.Tables["Rid"].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables["Rid"];
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
            using (SqlCommand cmd = new SqlCommand("UPDATE Role_Master SET Status = @Status WHERE Rid = @Rid", con))
            {
                cmd.Parameters.AddWithValue("@Status", btn.Text == "Active" ? 0 : 1);
                cmd.Parameters.AddWithValue("@Rid", txtID.Text);
                cmd.Parameters.AddWithValue("@Rnm", txtName.Text);
                cmd.Parameters.AddWithValue("@Des", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Status", txtStatus.Text);

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
        txtName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtDescription.Text = GridView1.SelectedRow.Cells[3].Text;
        txtaction.SelectedItem.Value = GridView1.SelectedRow.Cells[4].Text;
        txtStatus.Text = GridView1.SelectedRow.Cells[4].Text.ToUpper();
        if( GridView1.SelectedRow.Cells[4].Text.ToUpper() == "FALSE")
        {
            Button4.Text = "Activate";
        }
        else
        {    
            Button4.Text = "Deactivate";
        }
    
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into Role_Master values('" + txtID.Text + "','" + txtName.Text + "','" + txtDescription.Text + "','" + txtaction.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        if (txtStatus.Text.ToUpper() == "FALSE")
        {
            cmd.CommandText = "update Role_Master set Status = 'True'  where Rid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Activated')</script>");


        }
        else
        {
            cmd.CommandText = "update Role_Master set Status = 'False'  where Rid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Deactivated')</script>");
        }
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        this.BindGrid();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (txtaction.SelectedValue == "-1")
        {
            Response.Write("Please select an role name");
        }
        else
        {
            string query = "select * from Role_Master where Status =@Status";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@Status", txtaction.SelectedItem.Value);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
          
        }
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        txtID.Text = "";
        txtName.Text = "";
        txtDescription.Text = "";
        txtaction.SelectedItem.Text = "";
    }
  
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Role_Master] SET [Rid] ='" + txtID.Text + "',[Rnm]= '" + txtName.Text + "',[Des] ='" + txtDescription.Text + "',[Status] ='" + txtaction.SelectedItem.Value + "'WHERE [Rid]='" + txtID.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>");  
    }
}
