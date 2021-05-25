<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="customer_signup.aspx.cs" Inherits="Agroflora.customer_signup" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Customer Sign Up</h1>
    </div>
    <div class="col-md-4 offset-md-4 pb-5 text-center" style="margin-top: auto;  margin-bottom: auto;">
                
        <div class="form-floating">
            <asp:TextBox Id="txt_fname" runat="server" class="form-control"  placeholder="First Name"></asp:TextBox>
            <label for="txt_fname">First Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_lname" runat="server" type="text" class="form-control"  placeholder="Last Name"></asp:TextBox>
            <label for="txt_lname">Last Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_username" runat="server" class="form-control"  placeholder="Username"></asp:TextBox>
            <label for="txt_username">User Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_email"  runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
            <label for="txt_email">Email address</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_password" runat="server" type="password" class="form-control"  placeholder="Password"></asp:TextBox>
            <label for="txt_password">Password</label>
        </div>

        <div class="form-floating">
            <asp:TextBox id="txt_dob" type="date" class="form-control"  placeholder="Date of Birth" runat="server"></asp:TextBox>
            <label for="txt_dob">Date of Birth</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            <label for="txt_address">Address</label>
        </div>

        <asp:Button ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign Up" OnClick="btn_submit_click"/>
               
    </div>
</asp:Content>
