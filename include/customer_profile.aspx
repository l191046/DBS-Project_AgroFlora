<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="customer_profile.aspx.cs" Inherits="Agroflora.customer_profile" %>
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
                    <tr>
                        <th>Credit card</th>
                        <td id="td_creditcard" runat="server">Credit card</td>
                    </tr>
                    <tr class="table-success">
                        <th>Points</th>
                        <td id="td_points" runat="server">X</td>
                    </tr>
                </tbody>
    
            </table>
    </div>
    <div class="container text-center">
        <asp:HyperLink ID="hyper_editprofile" runat="server" href="customer_edit.aspx" CssClass="btn btn-primary" role="button">Edit Profile</asp:HyperLink>
    </div>

    <hr>

    <!--CUSTOMER PURCHASES-->
    <div class="container pt-5">
        <h1 class="text-center">PURCHASE HISTORY</h1>
            <table class="table table-striped table-hover table-bordered" id="table_purchases" runat="server">
                <thead>
                    <tr>
                        <th>Product name</th>
                        <th>Quantity</th>
                        <th>Purchase Date</th>
                        <th>Payment type</th>
                        <th>Total cost</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product</td>
                        <td>X</td>
                        <td>1/1/2021</td>
                        <td>cash on delivery</td>
                        <td>X</td>
                    </tr>
                </tbody>
    
            </table>
    </div>

    <br>
</asp:Content>
