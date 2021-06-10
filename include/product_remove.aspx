<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="product_remove.aspx.cs" Inherits="Agroflora.product_remove" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Manage Products</h1>
    </div>

    <div class="container pb-5" style="min-height:479px;">
        <table class="table">
            <thead>
                <asp:TableHeaderCell ID="product" runat="server">Product</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="retailer" runat="server">Retailer</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="price" runat="server">Price</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="category" runat="server">Category</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="date" runat="server">Date Added</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="Allowed" runat="server">Allowed</asp:TableHeaderCell>
            </thead>
            <tbody>
                <asp:TableCell runat="server" id="Productname">Product</asp:TableCell>
                <asp:TableCell runat="server" id="retailername">Retailer</asp:TableCell>
                <asp:TableCell runat="server" id="priceproduct">X</asp:TableCell>
                <asp:TableCell runat="server" id="categoryname">Category</asp:TableCell>
                <asp:TableCell runat="server" id="DateAdded">1/1/21</asp:TableCell>
                <asp:TableCell runat="server" id="AllowedCell">
                    <asp:CheckBox ID="AllowedProduct" runat="server" Checked="true" CssClass="form-check"/>
                </asp:TableCell>
            </tbody>
        </table>
    </div>
</asp:Content>