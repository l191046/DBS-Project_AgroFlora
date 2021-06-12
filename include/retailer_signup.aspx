﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="retailer_signup.aspx.cs" Inherits="Agroflora.retailer_signup" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="validation.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Retailer Sign Up</h1>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-4 offset-4 text-center">
                <h6 id="txt_username_taken" class="error-hidden">Username is already taken</h6>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_name" runat="server" class="form-control"  placeholder="Name"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_name" runat="server" ErrorMessage="Name is required" ControlToValidate="txt_name" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_username" runat="server" class="form-control"  placeholder="Username"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_username" runat="server" ErrorMessage="Username is required" ControlToValidate="txt_username" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_email"  runat="server" class="form-control" placeholder="name@example.com"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_email" runat="server" ErrorMessage="Email is required" ControlToValidate="txt_email" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_email" runat="server" ErrorMessage="Email is invalid" ControlToValidate="txt_email" CssClass="error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_password"  runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_password" runat="server" ErrorMessage="Password is required" ControlToValidate="txt_password" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_password" runat="server" ErrorMessage="Password must be atleast 8 characters" CssClass="error" ControlToValidate="txt_password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>
        
        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_cpassword"  runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_cpassword" runat="server" ErrorMessage="Please retype password" ControlToValidate="txt_cpassword" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match" CssClass="error" ControlToCompare="txt_password" ControlToValidate="txt_cpassword" Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_address" runat="server" class="form-control"  placeholder="Address"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_address" runat="server" ErrorMessage="Address is required" ControlToValidate="txt_address" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_NTN" runat="server" class="form-control"  placeholder="NTN"></asp:TextBox>            
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_NTN" runat="server" ErrorMessage="NTN is required" ControlToValidate="txt_NTN" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_NTN" runat="server" ErrorMessage="NTN must be 13 digits" CssClass="error" ControlToValidate="txt_NTN" ValidationExpression="\d{13}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_BankAccount" runat="server" class="form-control"  placeholder="Back Account"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_bankaccount" runat="server" ErrorMessage="Bank Account is required" ControlToValidate="txt_BankAccount" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-4 offset-4">
                <asp:TextBox Id="txt_contact" runat="server" class="form-control"  placeholder="Contact"></asp:TextBox>
            </div>
            <div class="col-4">
                <asp:RequiredFieldValidator ID="vld_contact" runat="server" ErrorMessage="Contact is required" ControlToValidate="txt_contact" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_contact" runat="server" ErrorMessage="Contact must be 11 digits" cssClass="error" ControlToValidate="txt_contact" ValidationExpression="\d{11}$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row pt-3">
            <div class="col-4 offset-4">
                <asp:Button OnClick="btn_submit_click" ID="submit" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Sign Up"/>
            </div>
        </div>

    </div>

</asp:Content>
