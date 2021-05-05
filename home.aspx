<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Compileforms.home" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--NAME AND LOGO--%>
    <div class="text-center pt-3 pb-3">
        <asp:Image ID="title_logo" runat="server" src="title_logo.png" AlternateText="title_logo.png" CssClass="img-fluid"/>
    </div>
    <hr/>

    <h1 class="text-center display-5">NEW PRODUCTS</h1>
    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        
                <div class="col">
                    <asp:HyperLink ID="hyper_newproduct1" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct1" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_newproduct1" runat="server" Text="NewProduct1"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_newproductdate1" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>

                <div class="col">
                    <asp:HyperLink ID="hyper_newproduct2" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct2" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_newproduct2" runat="server" Text="NewProduct2"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_newproductdate2" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>

                <div class="col">
                    <asp:HyperLink ID="hyper_newproduct3" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct3" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_newproduct3" runat="server" Text="NewProduct3"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_newproductdate3" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>


            </div>
        </div>
    </div>
    <hr/>

    <h1 class="text-center display-5">POPULAR PRODUCTS</h1>
    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        
                <div class="col">
                    <asp:HyperLink ID="hyper_popproduct1" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_popproduct1" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_popproduct1" runat="server" Text="popproduct1"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_popproductdate1" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>

                <div class="col">
                    <asp:HyperLink ID="hyper_popproduct2" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_popproduct2" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_popproduct2" runat="server" Text="popproduct2"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_popproductdate2" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>

                <div class="col">
                    <asp:HyperLink ID="hyper_popproduct3" runat="server" href="product.aspx">
                        <div class="card shadow-sm">
                            <div class="text-center">
                                <asp:Image ID="img_popproduct3" runat="server" src="logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                            <div class="card-body">
                                <p><asp:Label ID="label_popproduct3" runat="server" Text="popproduct3"></asp:Label></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <asp:Label ID="label_popproductdate3" runat="server" Text="Added X hours ago" CssClass="text-muted small"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </asp:HyperLink>
                </div>


            </div>
        </div>
    </div>
</asp:Content>
