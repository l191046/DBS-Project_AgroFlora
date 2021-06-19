<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="retailer_edit.aspx.cs" Inherits="Agroflora.retailer_edit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Retailer Edit</h1>
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
                <label class="h5">Name</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_name" runat="server" ErrorMessage="Name is required" ControlToValidate="txt_name" CssClass="error"></asp:RequiredFieldValidator>
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
                <label class="h5">NTN</label>
            </div>
            <div class="col-4">
                <asp:TextBox ID="txt_ntn" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-3">
                <asp:RequiredFieldValidator ID="vld_ntn" runat="server" ErrorMessage="NTN is required" ControlToValidate="txt_ntn" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vld_exp_ntn" runat="server" ErrorMessage="NTN must be 13 digits" CssClass="error" ControlToValidate="txt_ntn" ValidationExpression="\d{13}$" Display="Dynamic"></asp:RegularExpressionValidator>                
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
                <asp:RequiredFieldValidator ID="vld_contact" runat="server" ErrorMessage="Contact is required" ControlToValidate="txt_contact" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
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

