<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="admin_edit.aspx.cs" Inherits="Agroflora.admin_edit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid" src="images\logo_small.png" alt="logo.png">
        <h1>Admin Edit</h1>
    </div>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6 text-center">
        <table class="table table-striped table-hover table-bordered center">
            <tr>
                <th>Username</th>
                <td>
                    <asp:TextBox ID="txt_uname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>First Name</th>
                <td>
                    <asp:TextBox ID="txt_fname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Last Name</th>
                <td>
                    <asp:TextBox ID="txt_lname" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>Email</th>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>CNIC</th>
                <td>
                    <asp:TextBox ID="txt_cnic" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
        </table>

        <asp:Button ID="btn_save" class="w-100 btn btn-lg btn-primary" type="submit" runat="server" Text="Save Changes" OnClick="btn_save_Click"/>
    </div>
        <div class="col-3">
            <div class="container pb-5">
                <asp:RequiredFieldValidator ID="vld_fname" runat="server" ErrorMessage="First Name is required" ControlToValidate="txt_fname" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="container pb-5">
                <asp:RequiredFieldValidator ID="vld_lname" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txt_lname" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            <div class="container pb-5">
                <asp:RequiredFieldValidator ID="vld_email" runat="server" ErrorMessage="Email is required" ControlToValidate="txt_email" CssClass="error"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="vld_exp_email" runat="server" ErrorMessage="Email must be valid" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error"></asp:RegularExpressionValidator>
            </div>
            <div class="container">
                <asp:RequiredFieldValidator ID="vld_cnic" runat="server" ErrorMessage="CNIC is required" ControlToValidate="txt_cnic" CssClass="error"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="vld_exp_cnic" runat="server" ErrorMessage="CNIC must be 13 digits" CssClass="error" ControlToValidate="txt_cnic" ValidationExpression="\d{13}$"></asp:RegularExpressionValidator>
            </div>
        </div>
    </div>

</asp:Content>
