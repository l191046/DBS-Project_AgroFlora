<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="retailer_profile.aspx.cs" Inherits="Agroflora.retailer_profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
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
                </tbody>
            </table>
    </div>
    <div class="container text-center">
        <asp:HyperLink ID="hyper_editprofile" runat="server" href="retailer_edit.aspx" CssClass="btn btn-primary" role="button">Edit Profile</asp:HyperLink>
    </div>
    
    

    <!--RETAILER PRODUCTS-->
    <hr id="hr_products" runat="server"/>
    <div class="container pt-5">
        <h1 class="text-center" id="h1_products" runat="server">PRODUCTS</h1>

        <div class="container text-center pb-3">
            <asp:HyperLink ID="hyper_addproduct" runat="server" href="product_add.aspx" CssClass="btn btn-primary" role="button">Add Product</asp:HyperLink>
        </div>


        <asp:GridView id ="grid_products" class="table table-striped table-hover table-bordered"  runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Product Name"/>
                <asp:BoundField DataField="Category" HeaderText="Category"/>
                <asp:BoundField DataField="Price" HeaderText="Price"/>
                <asp:BoundField DataField="Stock" HeaderText="Stock"/>
                <asp:BoundField DataField="Date Added" HeaderText="Date Added" DataFormatString="{0:dd/MM/yyyy}"/>
            </Columns>
        </asp:GridView>
    </div>
    <hr id="hr_sales" runat="server" />

    <!--RETAILER SALES-->
    <div class="container pt-5">
        <h1 class="text-center" id="h1_sales" runat="server">SALES HISTORY</h1>

        <asp:GridView id ="grid_sales" class="table table-striped table-hover table-bordered"  runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date Sold" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="Name" HeaderText="Product Name"/>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity Sold"/>
                <asp:BoundField DataField="Total" HeaderText="Total Earned"/>
            </Columns>
        </asp:GridView>
    </div>
       
</asp:Content>
