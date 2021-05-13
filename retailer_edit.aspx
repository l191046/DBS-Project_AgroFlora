﻿<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="retailer_edit.aspx.cs" Inherits="Compileforms.retailer_edit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="logo_small.png" alt="logo.png">
        <h1>Retailer Edit</h1>
    </div>
            
    <div class="col-md-4 offset-md-4 text-center pb-5" style="margin-top: auto;  margin-bottom: auto;">
                
        <div class="form-floating">
            <asp:TextBox Id="firstname" runat="server" class="form-control"  placeholder="First Name"></asp:TextBox>
            <label for="fname">Edit First Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="lastname" runat="server" type="text" class="form-control"  placeholder="Last Name"></asp:TextBox>
            <label for="lname">Edit Last Name</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="username" runat="server" class="form-control"  placeholder="Username"></asp:TextBox>
            <label for="username"> Edit User Name</label>
        </div>


        <div class="form-floating">
            <asp:TextBox Id="email"  runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
            <label for="email">Edit Email address</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="oldpassword" runat="server" type="password" class="form-control"  placeholder="Old Password"></asp:TextBox>
            <label for="oldpassword">Old Password</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="newpassword" runat="server" type="password" class="form-control"  placeholder="New Password"></asp:TextBox>
            <label for="newpassword">New Password</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            <label for="address">Edit Address</label>
        </div>

            <div class="form-floating">
            <asp:TextBox Id="NTN" runat="server" class="form-control"  placeholder="NTN"></asp:TextBox>
            <label for="address">Edit NTN</label>
        </div>

            <div class="form-floating">
            <asp:TextBox Id="BankAccount" runat="server" class="form-control"  placeholder="Back Account"></asp:TextBox>
            <label for="address">Edit Bank Account</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="contact" runat="server" class="form-control"  placeholder="Contact"></asp:TextBox>
            <label for="address">Edit Contact</label>
        </div>


        <asp:Button ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Save Changes"/>
                
    </div>

</asp:Content>
