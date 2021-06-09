<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="catalogue.aspx.cs" Inherits="Agroflora.catalogue" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h1 id="h1_category" runat="server">Category</h1>
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
                        <%--"catalogue.aspx?Category=Plant"--%>
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

    <%--<td> <%# Eval("Name") %> </td>--%>

    <%--GRIDVIEW ELEMENT--%>
    <%--<asp:GridView ID="grid_products" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price" />            
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="DateAdded" HeaderText="Date added" DataFormatString = "{0:dd/MM/yyyy}"/>
            <asp:BoundField DataField="Stock" HeaderText="Stock" />
        </Columns>
    </asp:GridView>--%>
    
    
    <%--BOOTSTRAP ALBUM ELEMENT--%>
    <%-- 
    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product1" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct1" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title1" runat="server" href="product.aspx">
                                <h5 id="h_product1" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_1" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product2" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct2" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title2" runat="server" href="product.aspx">
                                <h5 id="h_product2" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_2" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product3" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct3" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title3" runat="server" href="product.aspx">
                                <h5 id="h_product3" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_3" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product4" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct4" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title4" runat="server" href="product.aspx">
                                <h5 id="h_product4" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_4" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product5" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct5" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title5" runat="server" href="product.aspx">
                                <h5 id="h_product5" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_5" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product6" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct6" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title6" runat="server" href="product.aspx">
                                <h5 id="h_product6" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_6" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product7" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct7" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title7" runat="server" href="product.aspx">
                                <h5 id="h_product7" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_7" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product8" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct8" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title8" runat="server" href="product.aspx">
                                <h5 id="h_product8" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_8" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <asp:HyperLink ID="hyper_product9" runat="server" href="product.aspx">
                            <div class="text-center">
                                <asp:Image ID="img_newproduct9" runat="server" src="images\logo_large.png" CssClass="img-fluid w-75" AlternateText="Product_Image"/>
                            </div>
                        </asp:HyperLink>
                        <div class="card-body">
                            <asp:HyperLink ID="hyper_product_title9" runat="server" href="product.aspx">
                                <h5 id="h_product9" runat="server"  class="card-title" style="text-align: center;">Product</h5>
                            </asp:HyperLink>
                            <div class="text-center">
                                <asp:HyperLink ID="hyper_cart_product_9" runat="server" href="#" CssClass="btn btn-primary">Add to cart</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    --%>

</asp:Content>