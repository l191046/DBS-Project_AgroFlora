<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="retailer_signup.aspx.cs" Inherits="Agroflora.retailer_signup" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Retailer Sign Up</h1>
    </div>
    <div class="col-md-4 offset-md-4 text-center pb-5" style="margin-top: auto;  margin-bottom: auto;">
                
        <div class="form-floating">
            <asp:TextBox Id="firstname" runat="server" class="form-control"  placeholder="First Name"></asp:TextBox>
            <label for="fname">First Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="lastname" runat="server" type="text" class="form-control"  placeholder="Last Name"></asp:TextBox>
            <label for="lname">Last Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="username" runat="server" class="form-control"  placeholder="Username"></asp:TextBox>
            <label for="username">User Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="email"  runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
            <label for="email">Email address</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="password"  runat="server" class="form-control" placeholder="Password" ></asp:TextBox>
            <label for="email">Password</label>
        </div>            

        <div class="form-floating">
            <asp:TextBox Id="address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            <label for="address"> Address</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="NTN" runat="server" class="form-control"  placeholder="NTN"></asp:TextBox>
            <label for="address">NTN</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="BankAccount" runat="server" class="form-control"  placeholder="Back Account"></asp:TextBox>
            <label for="address">Bank Account</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="contact" runat="server" class="form-control"  placeholder="Contact"></asp:TextBox>
            <label for="address">Contact</label>
        </div>

        <asp:Button ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign Up"/>
                
    </div>
</asp:Content>
