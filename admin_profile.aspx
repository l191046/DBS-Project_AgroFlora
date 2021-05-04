<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_profile.aspx.cs" Inherits="Deliverable2.admin_profile" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row pt-5">
            <div class="col"></div>
            <div class="col-8">
                <!--ADMIN INFORMATION-->
                <div class="container"  style="max-width: 500px;">
                    <div class="text-center pb-3">
                        <asp:Image ID="img_logo_small" runat="server" src="logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
                        <h1 class="text-center">ADMIN PROFILE</h1>
                    </div>

                    <table class="table table-striped table-hover">
                        <tbody>
                            <tr>
                                <th>User name</th>
                                <td id="td_uname" runat="server">Username</td>
                            </tr>
                            <tr>
                                <th>First name</th>
                                <td id="td_fname" runat="server">FirstName</td>
                            </tr>
                            <tr>
                                <th>Last Name</th>
                                <td id="td_lname" runat="server">LastName</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td id="td_email" runat="server">Email</td>
                            </tr>
                            <tr>
                                <th>CNIC</th>
                                <td id="td_cnic" runat="server">CNIC</td>
                            </tr>
                        </tbody>
            
                    </table>
                </div>
                <div class="container text-center pb-5">
                    <asp:HyperLink ID="hyper_editprofile" runat="server" href="admin_edit.aspx" CssClass="btn btn-primary" role="button">Edit Profile</asp:HyperLink>
                </div>
            </div>
            <div class="col text-center">
                <h6>ADMIN ACTIONS</h6>
                    <asp:HyperLink ID="hyper_product_remove" runat="server" href="product_remove.aspx" CssClass="btn btn-primary" role="button">Manage Products</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
