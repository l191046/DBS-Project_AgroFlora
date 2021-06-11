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

                        <asp:GridView id ="grid_ratings" class="table table-striped table-hover table-bordered"  runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Username"/>
                                <asp:BoundField DataField="Rating" HeaderText="Rating"/>
                                <asp:BoundField DataField="Review" HeaderText="Reviews"/>
                            </Columns>
                        </asp:GridView>
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
                            <asp:RangeValidator ID="vld_stock" runat="server" ErrorMessage="Out of range" ControlToValidate="quantity" MinimumValue="1" Type="Integer" CssClass="error" ></asp:RangeValidator>
                        </td>
                    </tr>
                </table>                

                   
              </div>
           
               
              <asp:Button ID="btn_proceed" OnClick ="add_onClick" class="w-100 btn btn-primary btn-lg" type="submit" runat="server" Text="Add to Cart" />
            </div>
          </div>
        </div>
    
 </asp:Content>

