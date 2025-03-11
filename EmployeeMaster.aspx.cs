using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class EmployeeMaster : System.Web.UI.Page
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
        string query = "SELECT * FROM Employee_Master";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM Employee_Master", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Eid");
                    if (ds.Tables["Eid"].Rows.Count > 0)
                    {
                        GridView2.DataSource = ds.Tables["Eid"];
                        GridView2.DataBind();
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
        int Rid = Convert.ToInt32(this.GridView2.DataKeys[row.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE Employee_Master SET Status = @Status WHERE Cid = @Cid", con))
            {
                cmd.Parameters.AddWithValue("@Status", btn.Text == "Active" ? 0 : 1);
                cmd.Parameters.AddWithValue("@Eid", txtID.Text);
                cmd.Parameters.AddWithValue("@Enm", txtName.Text);
                cmd.Parameters.AddWithValue("@Mobno", txtNumber.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
              
                cmd.Parameters.AddWithValue("@Empcode", txtCode.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@WML", txtLayout.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@DOJ", txtDOJ.Text);
                cmd.Parameters.AddWithValue("@Gender", txtGender.Text);
                cmd.Parameters.AddWithValue("@Role", txtRole.Text);
                cmd.Parameters.AddWithValue("@Shift_time", txtTime.Text);
                cmd.Parameters.AddWithValue("@Status", txtaction.SelectedItem.Value);

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
        cmd.CommandText = "insert into Employee_Master values('" + txtID.Text + "','" + txtName.Text + "','" + txtNumber.Text + "','" + txtemail.Text +"','"+ txtCode.Text + "','" + txtAddress.Text + "','" + txtLayout.Text + "',convert(date,'" + txtDOB.Text + "',105),convert(date,'" + txtDOJ.Text + "',105),'" + txtGender.Text + "','" + txtRole.Text + "','" + txtTime.Text + "','" + txtaction.SelectedItem.Value + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Employee_Master] SET [Eid] ='" + txtID.Text + "',[Enm]= '" + txtName.Text + "',[Mobno] ='" + txtNumber.Text + "',[email] ='" + txtemail.Text + "',[Empcode] ='" + txtCode.Text + "',[Address] ='" + txtAddress.Text + "',[WML] ='" + txtLayout.Text + "',[DOB]convert=(date,'" + txtDOB.Text + "',105),[DOJ]convert=(date,'" + txtDOJ.Text + "',105),[Gender] ='" + txtGender.Text + "',[Role] ='" + txtRole.Text + "',[Shift_time] ='" + txtTime.Text + "',[Status] ='" + txtaction.Text + "'WHERE [Eid]='" + txtID.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>");
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        txtID.Text = "";
        txtName.Text = "";
        txtNumber.Text = "";
        txtemail.Text = "";
       
        txtCode.Text = "";
        txtAddress.Text = "";
        txtLayout.Text = "";
        txtDOB.Text = "";
        txtDOJ.Text = "";
        txtGender.Text = "";
        txtRole.Text = "";
        txtTime.Text = "";
        txtaction.SelectedItem.Value = "";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        if (txtStatus.Text.ToUpper() == "FALSE")
        {
            cmd.CommandText = "update Employee_Master set Status = 'True'  where Eid=" + txtID.Text + " ";
            Response.Write("<script>alert('Your Data has been successfully Activated')</script>");


        }
        else
        {
            cmd.CommandText = "update Employee_Master set Status = 'False'  where Eid=" + txtID.Text + " ";
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
            Response.Write("Please select an Employee name");
        }
        else
        {
            string query = "select * from Employee_Master where Status =@Status";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@Status", txtaction.SelectedItem.Value);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView2.DataSource = data;
            GridView2.DataBind();
        }
    }
  
    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        txtID.Text = GridView2.SelectedRow.Cells[1].Text;
        txtName.Text = GridView2.SelectedRow.Cells[2].Text;
        txtNumber.Text = GridView2.SelectedRow.Cells[3].Text;
        txtemail.Text = GridView2.SelectedRow.Cells[4].Text;
      
        txtCode.Text = GridView2.SelectedRow.Cells[5].Text;
        txtAddress.Text = GridView2.SelectedRow.Cells[6].Text;
        txtLayout.Text = GridView2.SelectedRow.Cells[7].Text;
        txtDOB.Text = GridView2.SelectedRow.Cells[8].Text;
        txtDOJ.Text = GridView2.SelectedRow.Cells[9].Text;
        txtGender.Text = GridView2.SelectedRow.Cells[10].Text;
        txtRole.Text = GridView2.SelectedRow.Cells[11].Text;
        txtTime.Text = GridView2.SelectedRow.Cells[12].Text;
        txtaction.SelectedItem.Value = GridView2.SelectedRow.Cells[13].Text;
        txtStatus.Text = GridView2.SelectedRow.Cells[13].Text.ToUpper();
        if (GridView2.SelectedRow.Cells[13].Text.ToUpper() == "FALSE")
            Button4.Text = "Activate";
        else
            Button4.Text = "Deactivate";
    }
}