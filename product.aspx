<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Compileforms.product" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="logo_small.png" alt="logo.png">
        <h3 runat="server" id="Productdetails">Product Details</h3>
    </div>

    <div class="container pb-5">
          <div class="row">

            <div class="col-md-5 order-md-1">
              <asp:Image ID="img_logo_large" runat="server" src="logo_large.png" AlternateText="logo.png" CssClass="img-fluid"/>
            </div>
  
            <div class="col-md-7 order-md-2">
              <div class="border rounded-1">
                <table class="table bg-light">
                  <tbody>
                    <asp:TableRow id="ProductInfo" runat="server">
                      <asp:TableHeaderCell runat="server">Product Name</asp:TableHeaderCell>
                      <asp:TableCell runat="server" id="Productname">Product</asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow id="CategoryInfo" runat="server">
                      <asp:TableHeaderCell runat="server">Category</asp:TableHeaderCell>
                      <asp:TableCell runat="server" id="Category">Category</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow ID="PriceInfo" runat="server">
                      <asp:TableHeaderCell runat="server">Price</asp:TableHeaderCell>
                      <asp:TableCell runat="server" id="price">X</asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow ID="DescripInfo" runat="server">
                      <asp:TableHeaderCell runat="server">Description</asp:TableHeaderCell>
                      <asp:TableCell runat="server" id="Description">Description</asp:TableCell>
                    </asp:TableRow>
                    <tr>
                      <td colspan="2"><h6 class="text-muted text-center" style="font-style: italic;" runat="server" id="instock">In Stock</h6></td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <asp:Button ID="Proceed" class="w-100 btn btn-primary btn-lg" type="submit" runat="server" Text="Add to Cart" />
            </div>
          </div>
        </div>
    
 </asp:Content>
