<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="customer_signup.aspx.cs" Inherits="Agroflora.customer_signup" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Customer Sign Up</h1>
    </div>
    <div class="col-md-4 offset-md-4 pb-5 text-center" style="margin-top: auto;  margin-bottom: auto;">
                
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
            <asp:TextBox Id="password" runat="server" type="password" class="form-control"  placeholder="Password"></asp:TextBox>
            <label for="password">Password</label>
        </div>

        <div class="form-floating">
            <asp:TextBox id="DOB" type="date" class="form-control"  placeholder="Date of Birth" runat="server"></asp:TextBox>
            <label for="dob">Date of Birth</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            <label for="address">Address</label>
        </div>

        <asp:Button ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign Up"/>
               
    </div>
</asp:Content>