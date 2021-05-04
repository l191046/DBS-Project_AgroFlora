<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="retailer_profile.aspx.cs" Inherits="Deliverable2.retailer_profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h1 class="text-center">RETAILER PROFILE</h1>
    </div>
    <!--RETAILER INFORMATION-->
    <div class="container"  style="max-width: 500px">
            <table class="table table-striped table-hover">
                <tbody>
                    <tr>
                       <th>User name</th>
                        <td id="td_uname" runat="server">Username</td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td id="td_name" runat="server">Name</td>
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
                        <th>NTN</th>
                        <td id="td_ntn" runat="server">NTN</td>
                    </tr>
                    <tr>
                        <th>Contact</th>
                        <td id="td_contact" runat="server">Contact</td>
                    </tr>
                    <tr>
                        <th>Bank Account</th>
                        <td id="td_bankaccount" runat="server">BankAccount</td>
                    </tr>
                </tbody>
            </table>
    </div>
    <div class="container text-center">
        <asp:HyperLink ID="hyper_editprofile" runat="server" href="retailer_edit.aspx" CssClass="btn btn-primary" role="button">Edit Profile</asp:HyperLink>
    </div>
    <hr>

    <!--RETAILER PRODUCTS-->
    <div class="container pt-5">
        <h1 class="text-center">PRODUCTS</h1>

        <div class="container text-center pb-3">
            <asp:HyperLink ID="hyper_addproduct" runat="server" href="product_add.aspx" CssClass="btn btn-primary" role="button">Add Product</asp:HyperLink>
        </div>
                
            <table class="table table-striped table-hover table-bordered" id="table_products" runat="server">
                <thead>
                    <tr>
                        <th>Product name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Date added</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product</td>
                        <td>Category</td>
                        <td>X</td>
                        <td>X</td>
                        <td>1/1/2021</td>
                    </tr>
                </tbody>
    
            </table>
    </div>
    <hr>

    <!--RETAILER SALES-->
    <div class="container pt-5">
        <h1 class="text-center">SALES HISTORY</h1>
            <table class="table table-striped table-hover table-bordered" id="table_sales" runat="server">
                <thead>
                    <tr>
                        <th>Product name</th>
                        <th>Quantity sold</th>
                        <th>Date sold</th>
                        <th>Total earnings</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Product</td>
                        <td>X</td>
                        <td>1/1/2021</td>
                        <td>X</td>
                    </tr>
                </tbody>
    
            </table>
    </div>
       
</asp:Content>
