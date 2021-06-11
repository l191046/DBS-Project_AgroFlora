<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Agroflora.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h3 id="h3_search" runat="server">Search Results For:</h3>
    </div>

    <%--REPEATER ELEMENT--%>
    <asp:Repeater ID="repeater_products" runat="server">
        <HeaderTemplate>
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        </HeaderTemplate>
        
        <ItemTemplate>
            <div class="col">
                <div class="card shadow-sm">
                    <asp:HyperLink ID="hyper_product" runat="server" NavigateUrl='<%# Eval("ProductID","~/Product.aspx?PID={0}") %>'>
                        <div class="text-center">
                            <asp:Image ID="img_newproduct" runat="server" src=<%# Eval("Image") %> CssClass="img-fluid card-img-top" onerror="this.src='images/logo_large.png'" AlternateText="Product_Image"/>
                        </div>
                    </asp:HyperLink>
                    <div class="card-body">
                        <asp:HyperLink ID="hyper_product_title" runat="server" NavigateUrl='<%# Eval("ProductID","~/Product.aspx?PID={0}") %>'>
                            <h4 id="h_product" runat="server"  class="card-title" style="text-align: center;"><%# Eval("Name") %></h4>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </ItemTemplate>

        <FooterTemplate>
                    </div>
                </div>
            </div>
        </FooterTemplate>
    </asp:Repeater>


</asp:Content>
