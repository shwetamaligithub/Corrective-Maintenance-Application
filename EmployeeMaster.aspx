<%@ Page Title="" Language="C#" MasterPageFile="~/HRManagerLeader.master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
<form id="Form1" runat="server" class="user">
    <center>
        <h1 class="style1">
            Employee Master</h1>
    </center>
    <asp:Label ID="Label14" runat="server" Text="Employee ID:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtID" runat="server" class="form-control form-control-user" 
            placeholder="Employee ID"></asp:TextBox>
        <asp:TextBox ID="txtStatus" runat="server" 
            class="form-control form-control-user" placeholder="Employee ID" 
            Visible="false"></asp:TextBox>
    </div>
    <asp:Label ID="Label2" runat="server" Text="Employee Name:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtName" runat="server" class="form-control form-control-user" 
            placeholder="Employee Name"></asp:TextBox>
    </div>
    <asp:Label ID="Label3" runat="server" Text="Mobile Number:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtNumber" runat="server" 
            class="form-control form-control-user" placeholder="Mobile Number"></asp:TextBox>
    </div>
    <asp:Label ID="Label4" runat="server" Text="Email:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtemail" runat="server" 
            class="form-control form-control-user" placeholder="Email"></asp:TextBox>
    </div>
    <asp:Label ID="Label5" runat="server" Text="Employee Code:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtCode" runat="server" class="form-control form-control-user" 
            placeholder="Employee Code"></asp:TextBox>
    </div>
    <asp:Label ID="Label6" runat="server" Text="Address" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtAddress" runat="server" 
            class="form-control form-control-user" placeholder="Address"></asp:TextBox>
    </div>
    <asp:Label ID="Label7" runat="server" Text="Working on Machine Layout:" 
        ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtLayout" runat="server" 
            class="form-control form-control-user" placeholder="Working on Machine Layout"></asp:TextBox>
    </div>
    <asp:Label ID="Label8" runat="server" Text="Date Of Birth:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtDOB" runat="server" class="form-control form-control-user" 
            placeholder="Date Of Birth"></asp:TextBox>
    </div>
    <asp:Label ID="Label9" runat="server" Text="Date of Joining:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtDOJ" runat="server" class="form-control form-control-user" 
            placeholder="Date of Joining"></asp:TextBox>
    </div>
    <asp:Label ID="Label10" runat="server" Text="Gender:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtGender" runat="server" 
            class="form-control form-control-user" placeholder="Gender"></asp:TextBox>
    </div>
    <asp:Label ID="Label11" runat="server" Text="Role:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtRole" runat="server" class="form-control form-control-user" 
            placeholder="Role"></asp:TextBox>
    </div>
    <asp:Label ID="Label12" runat="server" Text="Shift Time:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:TextBox ID="txtTime" runat="server" class="form-control form-control-user" 
            placeholder="Shift Time"></asp:TextBox>
    </div>
    <div class="wrapper">
        <div class="row">
            <div class="column">
                <div id="column1">
                    <asp:Button ID="Button2" runat="server" 
                        class="btn btn-primary btn-user btn-block" onclick="Button2_Click1" 
                        style="margin:5px" Text="Save" text-align="left" Width="265px" />
                </div>
            </div>
            <div class="column">
                <div id="column2">
                    <asp:Button ID="Button5" runat="server" 
                        class="btn btn-primary btn-user btn-block" onclick="Button5_Click" 
                        style="margin:5px" Text="Update" Width="265px" />
                </div>
            </div>
            <div class="column">
                <div id="column3">
                    <asp:Button ID="Button4" runat="server" 
                        class="btn btn-primary btn-user btn-block" onclick="Button4_Click" 
                        style="margin:5px" Text="Action" text-align="Middle" Width="267px" />
                </div>
            </div>
            <div class="column">
                <div id="column4">
                    <asp:Button ID="Button3" runat="server" 
                        class="btn btn-primary btn-user btn-block" onclick="Button3_Click1" 
                        style="margin:5px" Text="Cancel" text-align="right" Width="265px" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <asp:Label ID="Label13" runat="server" Text="Status:" ForeColor="Black"></asp:Label>
    <div class="form-group row">
        <asp:DropDownList ID="txtaction" runat="server" 
            class="form-control form-control-dropdown" placeholder="Status">
            <asp:ListItem Value="True">Activate</asp:ListItem>
            <asp:ListItem Value="False">Deactivate</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" 
            class="btn btn-primary btn-user btn-block" onclick="Button1_Click" 
            style="margin:5px" Text="Search" text-align="Middle" Width="256px" />
        <br />
        <br />
        
    </div>
    
<asp:GridView ID=GridView2 runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="Eid"  ForeColor="#333333" 
        GridLines="None"  Width="830px" AutoGenerateSelectButton="True" 
      
        onselectedindexchanged="GridView2_SelectedIndexChanged1">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="Eid" HeaderText="Eid" ReadOnly="True" 
            SortExpression="Eid" />
        <asp:BoundField DataField="Enm" HeaderText="Enm" SortExpression="Enm" />
        <asp:BoundField DataField="Mobno" HeaderText="Mobno" SortExpression="Mobno" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Empcode" HeaderText="Empcode" 
            SortExpression="Empcode" />
        <asp:BoundField DataField="Address" HeaderText="Address" 
            SortExpression="Address" />
        <asp:BoundField DataField="WML" HeaderText="WML" SortExpression="WML" />
        <asp:BoundField DataField="DOB" HeaderText="DOB" 
            SortExpression="DOB" />
        <asp:BoundField DataField="DOJ" HeaderText="DOJ" 
            SortExpression="DOJ" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" 
            SortExpression="Gender" />
        <asp:BoundField DataField="Role" HeaderText="Role" 
            SortExpression="Role" />
        <asp:BoundField DataField="Shift_time" HeaderText="Shift_time" 
            SortExpression="Shift_time" />
        <asp:BoundField DataField="Status" HeaderText="Status" 
            SortExpression="Status" />
            <asp:TemplateField HeaderText="Action">
                                     <ItemTemplate>
                                         <asp:Label ID="Label7" runat="server" Text='<%# Eval("Status").ToString() == "True" ? "Active" : "Inactive" %>'></asp:Label>
                                       
                                     </ItemTemplate>
                                 </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            
        SelectCommand="SELECT * FROM [Employee_Master]"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
  </form>
                                
</asp:Content>




