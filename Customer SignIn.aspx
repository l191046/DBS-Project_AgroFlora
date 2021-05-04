<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer SignIn.aspx.cs" Inherits="Deliverable2.Customer_SignIn" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
      <img class="img-fluid"  src="Logo.Jpeg" alt="logo.jpeg" width="75" height="65">
      <h1>Customer Sign-In</h1>
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
          
          <asp:Button ID="Singin" class="w-100 btn btn-lg btn-primary" type="submit" runat="server"></asp:Button>Sign in
        
      </div>
    </div>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  
    </asp:Content>
