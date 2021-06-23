<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="product_user.aspx.cs" Inherits="Agroflora.product_user" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h3 runat="server" id="Productdetails">Product Details</h3>
    </div>

    <div class="container pb-5">
          <div class="row">

            <div class="col-md-5 order-md-1">
                <asp:Image ID="img_product" runat="server" onerror="this.src='images/logo_large.png'" AlternateText="logo.png" CssClass="img-fluid card-img-top"/>
                
                     <div class="container pt-5">
                        <h1 class="text-center">RATINGS</h1>

                        <asp:Repeater ID="rep_ratings" runat="server">
                            <HeaderTemplate>
                                <table class="table table-hover">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="border-right:groove"><asp:Label runat="server" Text='<%# Eval("Name") %>' style="font-weight:700"></asp:Label></td>
                                    <td><asp:Label runat="server" Text='<%# Eval("Rating","{0}/5") %>'></asp:Label></td>
                                    <td><asp:Label runat="server" Text='<%# Eval("Review") %>' style="font-style:italic"></asp:Label></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
            </div>
  
            <div class="col-md-7 order-md-2">
              <div class="border rounded-1">
                <table class ="table bg-light">
                    <tr>
                        <th>Product Name</th>
                        <td id="td_name" runat="server"></td>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <td id="td_category" runat="server"></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td id="td_price" runat="server"></td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <td id="td_desc" runat="server"></td>
                    </tr>
                    <tr>
                        <th>Quantity in stock</th>
                        <td id="td_quantity" runat="server"></td>
                    </tr>
                    <tr class="text-center text-muted" style="font-style: italic;">
                        <td id="td_stock" runat="server" colspan="2">IN STOCK</td>
                    </tr>
                    <tr id="tr_purchaseAmount" runat="server">
                        <th>Purchase Amount:</th>
                        <td>
                            <asp:TextBox ID="quantity" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vld_quantity" runat="server" ErrorMessage="Please Enter an Amount" ControlToValidate="quantity" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="vld_rng_quantity" runat="server" ErrorMessage="Out of range" ControlToValidate="quantity" MinimumValue="1" Type="Integer" CssClass="error" Display="Dynamic" ></asp:RangeValidator>
                        </td>
                    </tr>
                </table>                

                   
              </div>
           
               
              <asp:Button ID="btn_proceed" OnClick ="add_onClick" class="w-100 btn btn-primary btn-lg" type="submit" runat="server" Text="Add to Cart" />
            </div>
          </div>
        </div>
    
 </asp:Content>

