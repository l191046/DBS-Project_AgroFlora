<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="rate_product.aspx.cs" Inherits="Agroflora.rate_product" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h2>Rate a Product</h2>
    </div>
    <div class="col-6 center">
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
                    <th>Rating</th>
                    <td id ="txt_rating" runat="server"> 
                        <asp:DropDownList ID="drop_rating" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Rating</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="vld_rate" runat="server" ErrorMessage="Please select a score out of 5" ControlToValidate="drop_rating" InitialValue="0" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>Review</th>
                    <td>
                        <asp:TextBox ID="txt_review" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="text-center pb-3">
            <asp:Button ID="btn_remove" OnClick="input_rating" runat="server" Text="Submit"  cssClass="w-50 btn btn-lg btn-primary" />
        </div>
    </div>

</asp:Content>