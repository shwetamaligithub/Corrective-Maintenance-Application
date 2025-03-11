<%@ Page Title="" Language="C#" MasterPageFile="~/ProductionTeamLeader.master" AutoEventWireup="true" CodeFile="ProductionTeamLeader.aspx.cs" Inherits="ProductionTeamLeader" %>

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
                                <center><h1 class="style1"> Incident Record</h1></center>
                                    <asp:Label ID="Label4" runat="server" Text="Ticket ID:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtTicketid" runat="server" class="form-control form-control-user"  placeholder="Ticket ID" ></asp:TextBox>
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-user"  placeholder="Ticket ID" Visible ="false"></asp:TextBox>   
                                    </div>
                                       
                                    <asp:Label ID="Label2" runat="server" Text="Incident Type:" 
                                    ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                        <asp:DropDownList ID="txtIncidentid" runat="server" 
                                            DataSourceID="SqlDataSource3" 
                                            DataTextField="Inm" DataValueField="Incidentid" class="form-control form-control-dropdown">
                                        </asp:DropDownList>
                                       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                            SelectCommand="SELECT [Incidentid], [Inm] FROM [Incident_Master]"
                                            ></asp:SqlDataSource>
                                        
                                    </div>
                                       
                                    <asp:Label ID="Label1" runat="server" Text="Machine ID:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:DropDownList ID="txtMachineid" runat="server" 
                                    DataSourceID="SqlDataSource4"
                                    DataTextField="Mnm" DataValueField="Mid"  class="form-control form-control-dropdown">
                                    </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                            SelectCommand="SELECT [Mid], [Mnm] FROM [Machinary_Master]"
                                            ></asp:SqlDataSource>
                                    
                                    </div>
                                    
                                   
                                    <asp:Label ID="Label8" runat="server" Text="Time:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtTimedate" runat="server" class="form-control form-control-user"  placeholder="Time"></asp:TextBox>
                                    </div>
                                    
                                    
                                   
                                    <asp:Label ID="Label3" runat="server" Text="Description:" ForeColor="Black"></asp:Label>
                                    <div class="form-group row">
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control form-control-user" placeholder="Description"></asp:TextBox>
                                        
                                    </div>
                                   
                                  <div class="wrapper">
                                  <div class="row">
                                  <div class="column">
                                  <div id="column1">  
                                   <asp:Button ID="Button2" runat="server" 
                                    class="btn btn-primary btn-user btn-block" Text="Save" text-align="left" 
                                          Width="310px" style="margin:5px"/>
                                   </div>
                                   </div>
                                    
                                    <div class="column">
                                    <div id="column2">
                                    <asp:Button ID="Button5" runat="server"  class="btn btn-primary btn-user btn-block" 
                                          Text="Update"  Width="310px" style="margin:5px" />
                                   </div>
                                   </div>

                                 <div class="column">
                                 <div id="column4">
                     <asp:Button ID="Button3" runat="server" Text="Cancel" 
                     class="btn btn-primary btn-user btn-block" text-align="right" Width="310px" style="margin:5px" 
                                         />
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                               
                                     <br />
                                     <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" Width="100%" AutoGenerateColumns="False" 
                                         DataKeyNames="Ticketid" 
                                    AutoGenerateSelectButton="True" DataSourceID="SqlDataSource1" 
                                    >
                                         <AlternatingRowStyle BackColor="White" />
                                         <Columns>
                                             <asp:BoundField DataField="Ticketid" HeaderText="Ticket_ID" ReadOnly="True" 
                                                 SortExpression="Ticketid" InsertVisible="False" />
                                             <asp:BoundField DataField="Incidentid" HeaderText="Incident_ID" 
                                                 SortExpression="Incidentid" />
                                             <asp:BoundField DataField="Machineid" HeaderText="Machine_ID" 
                                                 SortExpression="Machineid" />
                                             <asp:BoundField DataField="Time" HeaderText="Date/Time" 
                                                 SortExpression="Time" />
                                             <asp:BoundField DataField="Des" HeaderText="Description" 
                                                 SortExpression="Des" />
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
                                         SelectCommand="SELECT * FROM [Incident_Record]"></asp:SqlDataSource>
                                 
                                 
                                  </form>
</asp:Content>

