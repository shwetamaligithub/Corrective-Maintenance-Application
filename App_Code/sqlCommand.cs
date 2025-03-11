using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class sqlCommand
{
    private string p;
    private System.Data.SqlClient.SqlConnection con;
    private string check;
    private sqlCommand con_2;

    public sqlCommand(string p, System.Data.SqlClient.SqlConnection con)
    {
        // TODO: Complete member initialization
        this.p = p;
        this.con = con;
    }

    public sqlCommand()
    {
        // TODO: Complete member initialization
    }

    public sqlCommand(string check, sqlCommand con_2)
    {
        // TODO: Complete member initialization
        this.check = check;
        this.con_2 = con_2;
    }

    public sqlCommand(string check)
    {
        // TODO: Complete member initialization
        this.check = check;
    }
    public string CommandText { get; set; }

    public System.Data.SqlClient.SqlConnection Connection { get; set; }

    public void ExecuteNonQuery()
    {
        throw new NotImplementedException();
    }

    public void Open()
    {
        throw new NotImplementedException();
    }

    public object ExecuteScalar()
    {
        throw new NotImplementedException();
    }

    public void Close()
    {
        throw new NotImplementedException();
    }
}
