<%@ Page Title="" Language="C#" MasterPageFile="~/ProductionLineLeader.master" AutoEventWireup="true" CodeFile="MachineReport.aspx.cs" Inherits="MachineReport" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="form1" runat="server">
    <div>
     <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
&nbsp;<asp:TextBox ID="txtid" runat="server"></asp:TextBox>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Button ID="Button2" runat="server" Text="Search" onclick="Button2_Click" />
    <br />
    <br />

    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="946px">
        <localreport reportpath="MachineListReport.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        TypeName="DataSet1TableAdapters."></asp:ObjectDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [Machinary_Master]"></asp:SqlDataSource>
    </form>

</asp:Content>

