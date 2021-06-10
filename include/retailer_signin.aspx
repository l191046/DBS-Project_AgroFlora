<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="retailer_signin.aspx.cs" Inherits="Agroflora.retailer_signin" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="validation.js"></script>
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
      <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
      <h1>Retailer Sign-In</h1>
    </div>

    <div class="form-signin text-center pb-5" style="align-items: center;">
        <div class="col-md-4 offset-md-4" style="margin-top: auto;  margin-bottom: auto;" >

            <h6 id="txt_credentials" class="error-hidden">Invalid Credentials</h6>

            <asp:TextBox Id="txt_username" placeholder="Username" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vld_username" runat="server" ErrorMessage="Username is required" ControlToValidate="txt_username" CssClass="error"></asp:RequiredFieldValidator>

            <asp:TextBox Id="txt_password" placeholder="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vld_password" runat="server" ErrorMessage="Password is required" ControlToValidate="txt_password" CssClass="error"></asp:RequiredFieldValidator>
      
            <%--
            NO IMPLEMENTATON CURRENTLY
            <div class="checkbox mb-3">
            <label>
                <asp:CheckBox ID="remember"  value="remember-me" runat="server"/> Remember me
            </label>
            </div>
            <a href="#">Forgot Password?</a>
            --%>

            <div class="pt-3">
                <asp:Button ID="btn_signin" cssClass="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign In" OnClick="btn_signin_click" ></asp:Button>
            </div>
        
        </div>


    </div>

</asp:Content>

