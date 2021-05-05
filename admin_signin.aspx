<%@ Page Title="Signin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_signin.aspx.cs" Inherits="Compileforms.admin_signin" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
      <img class="img-fluid"  src="logo_small.png" alt="logo.png">
      <h1>Admin Sign-In</h1>
    </div>
    
    <div class="form-signin text-center pb-5" style="align-items: center;">
        <div class="col-md-4 offset-md-4" style="margin-top: auto;  margin-bottom: auto;" >

            <div class="form-floating">
            <asp:TextBox Id="username" type="text" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
            <label for="username">User Name</label>
            </div>
            <div class="form-floating">
            <asp:TextBox Id="password" type="password" class="form-control"  placeholder="Password" runat="server"></asp:TextBox>
            <label for="password">Password</label>
            </div>
      
            <div class="checkbox mb-3">
            <label>
                <asp:CheckBox ID="remember"  value="remember-me" runat="server"/> Remember me
            </label>
            </div>
            <a href="#">Forgot Password?</a>
          
            <asp:Button ID="signin" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign In"></asp:Button>
        
        </div>
    </div>
  
</asp:Content>
