<%@ Page Title="" Language="C#" MasterPageFile="~/HRManagerLeader.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserMaster" %>

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

<asp:Content ID="Content3" runat="server"  contentplaceholderid="ContentPlaceHolder2">
  <form id="Form1" class="user" runat="server">
                              <center><h1 class="style1">User Master</h1></center>
                                    
                                     <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                  CssClass="failureNotification" 
                                   ForeColor="#FF3300" />
                                    <asp:Label ID="Label2" runat="server" Text="User ID:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtID" runat="server" class="form-control form-control-user"  placeholder="User ID"></asp:TextBox>
                                    <asp:TextBox ID="txtStatus" runat="server" class="form-control form-control-user"  placeholder="User ID" Visible ="false"></asp:TextBox>
                                     
                                     </div>    
                                    <asp:Label ID="Label1" runat="server" Text="Role ID:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                        <asp:DropDownList ID="txtRoleid" runat="server" 
                                            class="form-control form-control-dropdown" DataSourceID="SqlDataSource3" 
                                            DataTextField="Rnm" DataValueField="Rid">
                                        </asp:DropDownList>
                                    </div>
                                         
                                    <asp:Label ID="Label3" runat="server" Text="Employee Name:" 
                                  ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control form-control-user"  placeholder="Employee Name"></asp:TextBox>
                                       
                                    </div>
                                    <asp:Label ID="Label4" runat="server" Text="User Name:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control form-control-user"  placeholder="User Name"></asp:TextBox>
                                       
                                    </div>
                                    <asp:Label ID="Label6" runat="server" Text="Password:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtPwd" runat="server" class="form-control form-control-user" placeholder="Password" TextMode="Password"></asp:TextBox>
                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ErrorMessage="Password is required" ControlToValidate="txtPwd"  CssClass="failureNotification" Display="Dynamic" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    </div>
                                    
                                    <asp:Label ID="Label5" runat="server" Text="Confirm Password:" 
                                  ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtConfirm" runat="server" class="form-control form-control-user" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ErrorMessage="Confirm Password is required" ControlToValidate="txtConfirm" CssClass="failureNotification" Display="Dynamic" ForeColor="Red" >*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToCompare="txtPwd" 
                                            ControlToValidate="txtConfirm"  CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ForeColor="Red">*</asp:CompareValidator>
                                    </div>
                                   
                                  <div class="wrapper">
                                  <div class="row">
                                  <div class="column">
                                  <div id="column1">  
                                   <asp:Button ID="Button2" runat="server" 
                                    class="btn btn-primary btn-user btn-block" Text="Save" text-align="left" 
                                          onclick="Button2_Click1" Width="265px" style="margin:5px"/>
                                   </div>
                                   </div>
                                    
                                    <div class="column">
                                    <div id="column2">
                                    <asp:Button ID="Button5" runat="server"  class="btn btn-primary btn-user btn-block" 
                                          Text="Update"  Width="265px" style="margin:5px" onclick="Button5_Click"/>
                                   </div>
                                   </div>

                                  <div class="column">
                                  <div id="column3"> 
                      
                             <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Action" 
                                          class="btn btn-primary btn-user btn-block" text-align="Middle" 
                                          Width="267px" style="margin:5px" />
                                 </div>
                                 </div>

                                 <div class="column">
                                 <div id="column4">
                     <asp:Button ID="Button3" runat="server" Text="Cancel" 
                     class="btn btn-primary btn-user btn-block" text-align="right" Width="265px" style="margin:5px" 
                                         onclick="Button3_Click1"/>
                                     <br />
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                               
                                <br/>
                                 <asp:Label ID="Label7" runat="server" Text="Status:" ForeColor="Black"></asp:Label>
                              
                                                            <asp:DropDownList ID="txtaction" runat="server" 
                                    class="form-control form-control-dropdown" placeholder="Status" 
                                    DataSourceID="SqlDataSource2" DataTextField="status" DataValueField="status" >
                    <asp:ListItem Value="True">Activate</asp:ListItem>
                    <asp:ListItem Value="False">Deactivate</asp:ListItem>
                </asp:DropDownList>
                               
                                
                                    
                              
                                
                                   &nbsp;<asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click"  
                                          class="btn btn-primary btn-user btn-block" text-align="Middle" 
                                          Width="256px" style="margin:5px" /> 
                                                       
                                
<asp:GridView ID="GridView1" runat="server" Height="93px" 
                                    Width="1125px" AutoGenerateSelectButton="True" 
                                    onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
                                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                                    DataKeyNames="uid"   >
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="uid" HeaderText="User_id" ReadOnly="True" 
            SortExpression="uid" />
        <asp:BoundField DataField="Roleid" HeaderText="Role_id" 
            SortExpression="Roleid" />
        <asp:BoundField DataField="enm" HeaderText="Employee Name" 
            SortExpression="enm" />
        <asp:BoundField DataField="unm" HeaderText="User Name" SortExpression="unm" />
        <asp:BoundField DataField="pwd" HeaderText="Password" SortExpression="pwd" />
        <asp:BoundField DataField="cpwd" HeaderText="Confirm Password" 
            SortExpression="cpwd" />
        <asp:BoundField DataField="status" HeaderText="Status" 
            SortExpression="status" />
        <asp:TemplateField HeaderText="Action">
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label4" runat="server" Text='<%# Eval("Status").ToString() == "True" ? "Active" : "Inactive" %>'></asp:Label>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="SELECT * FROM [User_Master]"></asp:SqlDataSource>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                    SelectCommand="SELECT [Rid], [Rnm] FROM [Role_Master]"></asp:SqlDataSource>
                            </form>
</asp:Content>


