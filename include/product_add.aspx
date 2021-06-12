<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="product_add.aspx.cs" Inherits="Agroflora.product_add" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="validation.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Add Product</h1>
        <p class="lead">Please Fill In Your Product Details To Continue</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col"></div>
            
            <%--TEXTBOXES--%>
            <div class="col-6 pb-5">
                <h4 class="text-center"> Product Details </h4>

                <asp:TextBox Id="txt_productname" runat="server" class="form-control"  placeholder="Product Name"></asp:TextBox>
                
                <asp:TextBox Id="txt_stock" runat="server" class="form-control"  placeholder="Stock" TextMode="Number"></asp:TextBox>
                
                <asp:TextBox Id="txt_price" runat="server" class="form-control"  placeholder="Price"></asp:TextBox>
                    
                <br />
                <label for="category" class="form-label">Category</label>
                <asp:DropDownList id="drop_category" class="form-select" runat="server">
                    <asp:ListItem Text="Select" Value=0></asp:ListItem>
                    <asp:ListItem Text="Plant" Value=1></asp:ListItem>
                    <asp:ListItem Text="Seeds" Value=2></asp:ListItem>
                    <asp:ListItem Text="Fertilizer" Value=3></asp:ListItem>
                    <asp:ListItem Text="Pots" Value=4></asp:ListItem>
                    <asp:ListItem Text="Tools" Value=5></asp:ListItem>
                    <asp:ListItem Text="Other" Value=6></asp:ListItem>
                </asp:DropDownList>
              
                <hr />
                <label for="formFile" class="form-label">Upload Image</label>
                <input class="form-control" type="file" id="file_image" runat="server">
                <hr/>
                <asp:TextBox Id="txt_description" runat="server" class="form-control pt-3"  placeholder="Product Description (Optional)"></asp:TextBox>
                <hr/>
                <asp:Button ID="btn_submit" class="w-100 btn btn-primary btn-lg" type="submit" runat="server" Text="Add Product" OnClick="btn_submit_Click"/>
            </div>
            <%--VALIDATORS--%>
            <div class="col pt-5">
                <div class="container pb-1">
                    <asp:RequiredFieldValidator ID="vld_productname" runat="server" ErrorMessage="Product name is required" ControlToValidate="txt_productname" CssClass="error pb-2"></asp:RequiredFieldValidator>
                </div>
                <div class="container pb-3">
                    <asp:RequiredFieldValidator ID="vld_stock" runat="server" ErrorMessage="Stock amount is required" ControlToValidate="txt_stock" CssClass="error pb-2"></asp:RequiredFieldValidator>
                </div>
                <div class="container pb-5">
                    <asp:RequiredFieldValidator ID="vld_price" runat="server" ErrorMessage="Price is required" ControlToValidate="txt_price" CssClass="error pb-2"></asp:RequiredFieldValidator>
                </div>
                <div class="container pb-5">
                    <asp:RequiredFieldValidator ID="vld_category" runat="server" ErrorMessage="Category is required" ControlToValidate="drop_category" CssClass="error pb-2" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="container">
                    <asp:RequiredFieldValidator ID="vld_image" runat="server" ErrorMessage="Image is required" ControlToValidate="file_image" CssClass="error pb-2"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>