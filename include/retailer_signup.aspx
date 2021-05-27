﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="retailer_signup.aspx.cs" Inherits="Agroflora.retailer_signup" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Retailer Sign Up</h1>
    </div>
    <div class="col-md-4 offset-md-4 text-center pb-5" style="margin-top: auto;  margin-bottom: auto;">
                
        <div class="form-floating">
            <asp:TextBox Id="txt_name" runat="server" class="form-control"  placeholder="Name"></asp:TextBox>
            <label for="txt_name">Name</label>
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
            <asp:TextBox Id="txt_password"  runat="server" class="form-control" placeholder="Password" type="password"></asp:TextBox>
            <label for="txt_email">Password</label>
        </div>            

        <div class="form-floating">
            <asp:TextBox Id="txt_address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            <label for="txt_address"> Address</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_NTN" runat="server" class="form-control"  placeholder="NTN"></asp:TextBox>
            <label for="txt_NTN">NTN</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_BankAccount" runat="server" class="form-control"  placeholder="Back Account"></asp:TextBox>
            <label for="txt_BankAccount">Bank Account</label>
        </div>

        <div class="form-floating">
            <asp:TextBox Id="txt_contact" runat="server" class="form-control"  placeholder="Contact"></asp:TextBox>
            <label for="txt_contact">Contact</label>
        </div>

        <asp:Button OnClick="btn_submit_click" ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign Up"/>
                
    </div>
</asp:Content>
