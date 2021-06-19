<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="customer_edit.aspx.cs" Inherits="Agroflora.customer_edit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Customer Edit</h1>
    </div>
    
    <div class="container">
        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Username</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_uname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">First Name</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_fname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_fname" runat="server" ErrorMessage="First Name is required" ControlToValidate="txt_fname" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Last Name</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_lname" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_lname" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txt_lname" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Email</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_email" runat="server" ErrorMessage="Email is required" ControlToValidate="txt_email" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_email" runat="server" ErrorMessage="Email must be valid" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Date Of Birth</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_dob" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_dob" runat="server" ErrorMessage="Date of birth is required" ControlToValidate="txt_dob" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Address</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_address" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_address" runat="server" ErrorMessage="Address is required" ControlToValidate="txt_address" CssClass="error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-2 offset-3 text-end">
                <label class="h5">Contact</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_contact" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RegularExpressionValidator ID="vld_exp_contact" runat="server" ErrorMessage="Contact must be 11 digits" CssClass="error" ControlToValidate="txt_contact" ValidationExpression="\d{11}$"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-6 offset-3 pt-3">
                <asp:Button ID="btn_save" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Save Changes" OnClick="btn_save_Click"/>
            </div>
        </div>
    </div>
</asp:Content>