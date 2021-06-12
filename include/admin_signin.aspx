<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="admin_signin.aspx.cs" Inherits="Agroflora.admin_signin" %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="validation.js"></script>
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
      <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
      <h1>Admin Sign-In</h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-4 offset-4 text-center">
                <h6 id="txt_credentials" class="error-hidden">Invalid Credentials</h6>
            </div>
        </div>
        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_username" placeholder="Username" runat="server" CssClass="form-control floating"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_username" runat="server" ErrorMessage="Username is required" ControlToValidate="txt_username" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_password" placeholder="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_password" runat="server" ErrorMessage="Password is required" ControlToValidate="txt_password" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row pt-3">
            <div class="col-4 offset-4">
                <asp:Button ID="btn_signin" cssClass="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign In" OnClick="btn_signin_click" ></asp:Button>
            </div>
        </div>
    </div>
</asp:Content>
