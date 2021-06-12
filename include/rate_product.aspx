<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="rate_product.aspx.cs" Inherits="Agroflora.rate_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h2>Rate a Product</h2>
       
    </div>
       <table class="table table-striped table-hover">
                <tbody>
                    <tr>
                        <th>Customer Username</th>
                        <td id="td_uname" runat="server">FirstName</td>
                    </tr>
                    <tr>
                        <th>Product Name</th>
                        <td id="td_pname" runat="server">LastName</td>
                    </tr>
                   <tr>
                       <th>
                           Rating
                       </th>
                       <td id ="txt_rating" runat="server"> 
                           <asp:TextBox ID="td_rating" TextMode="Number" runat="server"></asp:TextBox>
                       <asp:RangeValidator ID="vld_rating" runat="server" ControlToValidate="td_rating"   ErrorMessage="Rating must be between 0 and 5" ForeColor="Red" MaximumValue=5 MinimumValue=0></asp:RangeValidator>
                      
                           </td>

                   </tr>

                    <tr>
                        <th>
                            Review
                        </th>
                        <td>
                            <textarea id="td_review" runat ="server"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
    <div class="text-center pt-5 pb-3">

        <asp:Button ID="btn_remove" OnClick="input_rating" runat="server" Text="Submit"  cssClass="w-50 btn btn-lg btn-primary" />
       
    </div>

</asp:Content>