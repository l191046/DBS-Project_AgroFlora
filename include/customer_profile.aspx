<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="customer_profile.aspx.cs" Inherits="Agroflora.customer_profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h1 class="text-center">CUSTOMER PROFILE</h1>
    </div>
    
    <!--CUSTOMER INFORMATION-->
    <div class="container"  style="max-width: 500px;">
                
            <table class="table table-striped table-hover">
                <tbody>
                    <tr>
                        <th>User name</th>
                        <td id="td_uname" runat="server">Username</td>
                    </tr>
                    <tr>
                        <th>First name</th>
                        <td id="td_fname" runat="server">FirstName</td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td id="td_lname" runat="server">LastName</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td id="td_email" runat="server">Email</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td id="td_address" runat="server">Address</td>
                    </tr>
                    <tr>
                        <th>Date of birth</th>
                        <td id="td_dob" runat="server">DOB</td>
                    </tr>
                    <tr>
                        <th>Contact</th>
                        <td id="td_contact" runat="server">Contact</td>
                    </tr>
                </tbody>
    
            </table>
    </div>
    <div class="container text-center">
        <asp:HyperLink ID="hyper_editprofile" runat="server" href="customer_edit.aspx" CssClass="btn btn-primary" role="button">Edit Profile</asp:HyperLink>
    </div>

    <%--UNRATED PRODUCTS--%>
    <hr id="hr_unrated" runat="server"/>
    <div class="col-4 pt-5 center">
        <h1 class="text-center" id="h1_unrated" runat="server">LEAVE A RATING</h1>
        <asp:GridView ID="grid_unrated" OnRowCommand="grid_rating_rowCommand" AutoGenerateColumns="false" class="table table-striped table-hover table-bordered" runat="server">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product" />
                <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
			        <ItemStyle HorizontalAlign="Center" />
			        <ItemTemplate>
				        <div class="center">
					        <asp:Button ID="btn_remove" runat="server" Text="Leave a rating" CommandName="remove" CommandArgument='<%# Eval("ProductID") %>' CausesValidation="false" UseSubmitBehavior="false" CssClass="w-30 btn btn-sm btn-success" />
				        </div>
			        </ItemTemplate>
		        </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    
    
    <!--CUSTOMER PURCHASES-->
    <hr id="hr_purchases" runat="server"/>
    <div class="container pt-5">
        <h1 class="text-center" id="h1_purchases" runat="server">PURCHASE HISTORY</h1>
            <asp:GridView id ="grid_history" class="table table-striped table-hover table-bordered"  runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name"/>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Payment Type" HeaderText="Payment Type"/>
                    <asp:BoundField DataField="Total Amount" HeaderText="Total Amount"/>
                </Columns>
            </asp:GridView>
    </div>
</asp:Content>
