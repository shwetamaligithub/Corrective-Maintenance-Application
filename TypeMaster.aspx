﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ProductionLineLeader.master" AutoEventWireup="true" CodeFile="TypeMaster.aspx.cs" Inherits="TypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                               
                                <form id="Form1" class="user" runat="server">
                                <center><h1 class="style1">Type Master</h1></center>
                                    <asp:Label ID="Label2" runat="server" Text="User ID:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtID" runat="server" class="form-control form-control-user"  placeholder="Type ID"></asp:TextBox>
                                    <asp:TextBox ID="txtStatus" runat="server" class="form-control form-control-user"  placeholder="Type ID" Visible ="false"></asp:TextBox>
                                     
                                     </div> 
                                    
                                     <asp:Label ID="Label3" runat="server" Text="Type Name:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control form-control-user"  placeholder="Type Name"></asp:TextBox>
                                       
                                    </div>

                                     <asp:Label ID="Label4" runat="server" Text="Description:" 
                                    ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control form-control-user"  placeholder="Description"></asp:TextBox>
                                       
                                    </div>
                                    <asp:Label ID="Label6" runat="server" Text="Department Name:" 
                                    ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtDeptnm" runat="server" class="form-control form-control-user" placeholder="Department Name"></asp:TextBox>
                                        
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
                                 </div>
                                 </div>
                                 </div>
                                 <asp:Label ID="Label1" runat="server" Text="Status:" 
                                    ForeColor="Black"></asp:Label>
                                  <asp:DropDownList ID="txtaction" runat="server" 
                                    class="form-control form-control-dropdown" placeholder="Status" 
                                    DataSourceID="SqlDataSource2" DataTextField="status" DataValueField="status" >
                    <asp:ListItem Value="True">Activate</asp:ListItem>
                    <asp:ListItem Value="False">Deactivate</asp:ListItem>
                </asp:DropDownList>
                               
                                
                                    
                              
                                
                                   <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click"  
                                          class="btn btn-primary btn-user btn-block" text-align="Middle" 
                                          Width="256px" style="margin:5px" /> 
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                                            DataKeyNames="Tid"  ForeColor="#333333" 
                                            GridLines="None" 
                                            onselectedindexchanged="GridView1_SelectedIndexChanged" 
                                    Width="100%"  
                                    AutoGenerateSelectButton="True">
                                       <AlternatingRowStyle BackColor="White" />
                                       <Columns>
                                           <asp:BoundField DataField="Tid" HeaderText="Type_id" ReadOnly="True" 
                                                     SortExpression="Tid" />
                                           <asp:BoundField DataField="Tnm" HeaderText="Type Name" SortExpression="Tnm" />
                                           <asp:BoundField DataField="Des" HeaderText="Description" SortExpression="Des" />
                                           <asp:BoundField DataField="Deptnm" HeaderText="Department Name" 
                                                     SortExpression="Deptnm" />
                                           <asp:BoundField DataField="Status" HeaderText="Status" 
                                                     SortExpression="Status" />
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
                                            
                                    SelectCommand="SELECT * FROM [Type_Master]"></asp:SqlDataSource>
                                   <br />
                                   <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                                 </div>
                               
                            </form>
                               
                               
    
</asp:Content>

