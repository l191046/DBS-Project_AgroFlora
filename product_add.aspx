<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="product_add.aspx.cs" Inherits="Compileforms.product_add" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="logo_small.png" alt="logo.png">
        <h1>Add Product</h1>
        <p class="lead">Please Fill In Your Product Details To Continue</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col"></div>

            <div class="col-8">
                <h4 class="text-center"> Product Details </h4>

                <div class="pb-5">
                    <div class="form-floating">
                        <asp:TextBox Id="productname" runat="server" class="form-control"  placeholder="Product Name"></asp:TextBox>
                        <label for="productname">Product Name</label>
                    </div>
                    <div class="form-floating">
                        <asp:TextBox Id="stock" runat="server" type="number" class="form-control"  placeholder="Stock"></asp:TextBox>
                        <label for="stock">Enter Stock</label>
                    </div>
                    <div class="form-floating">
                        <asp:TextBox Id="price" runat="server" class="form-control"  placeholder="Price"></asp:TextBox>
                        <label for="price">Price</label>
                    </div>
                    
                    <br />
                    <label for="category" class="form-label">Category</label>
                    <asp:DropDownList id="category" class="form-select" runat="server">
                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Plant" Value="Plant"></asp:ListItem>
                        <asp:ListItem Text="Seeds" Value="Seeds"></asp:ListItem>
                        <asp:ListItem Text="Fertilizer" Value="Fertilizer"></asp:ListItem>
                        <asp:ListItem Text="Pots" Value="Pots"></asp:ListItem>
                        <asp:ListItem Text="Tools" Value="Tools"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
              
                    <hr />
                    <label for="formFile" class="form-label">Upload Image</label>
                    <input class="form-control" type="file" id="formFile">
                    <hr/>
                    <asp:TextBox Id="Productdescription" runat="server" class="form-control pt-3"  placeholder="Product Description (Optional)"></asp:TextBox>
                    <hr/>
                    <asp:Button ID="submit" class="w-100 btn btn-primary btn-lg" type="submit" runat="server" Text="Add Product"/>
                </div>
            </div>

            <div class="col"></div>
        </div>
    </div>
</asp:Content>