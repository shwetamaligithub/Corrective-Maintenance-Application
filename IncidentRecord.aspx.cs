using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class IncidentRecord : System.Web.UI.Page
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
        string query = "SELECT * Incident_Record";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(" SELECT * FROM Incident_Record", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Ticketid");
                    if (ds.Tables["Ticketid"].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables["Ticketid"];
                        GridView1.DataBind();
                    }
                    con.Close();
                }
            }
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "insert into Incident_Record(Incidentid,Machineid,Time,Des,Status) values("+ txtIncidentid.SelectedItem.Value + "," + txtMachineid.SelectedItem.Value + ",convert(date,'" + txtTimedate.Text + "',105),'" + txtDescription.Text +"')";
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully saved')</script>");
    }
   
    protected void Button5_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = ("UPDATE [dbo].[Incident_Record] SET [Ticketid] ='" + txtTicketid.Text + "',[Incidentid]= '" + txtIncidentid.Text + "',[Machineid] ='" + txtMachineid.Text + "',[Time] ='" + txtTimedate.Text + "',[Des] ='" + txtDescription.Text + "'WHERE [Ticketid]='" + txtTicketid.Text + "'");
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Your Data has been successfully update')</script>");   
    }
    
    protected void Button3_Click1(object sender, EventArgs e)
    {
        txtTicketid.Text = "";
        txtIncidentid.Text = "";
        txtMachineid.Text = "";
        txtTimedate.Text = "";
        txtDescription.Text = "";
       
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtTicketid.Text = GridView1.SelectedRow.Cells[1].Text;
        txtIncidentid.Text = GridView1.SelectedRow.Cells[2].Text;
        txtMachineid.Text = GridView1.SelectedRow.Cells[3].Text;
        txtTimedate.Text = GridView1.SelectedRow.Cells[4].Text;
        txtDescription.Text = GridView1.SelectedRow.Cells[5].Text;
       
        
    }
}