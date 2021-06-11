<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="product_remove.aspx.cs" Inherits="Agroflora.product_remove" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <img class="img-fluid"  src="images\logo_small.png" alt="logo.png">
        <h1>Manage Products</h1>
    </div>
"
    <h3 id="h3_current" runat="server" class="text-center">Current Products</h3>
    <h3 id="h3_no_current" runat="server" class="text-center">No Current Products</h3>
    <asp:GridView ID="grid_current" runat="server" CssClass="table table-striped table-hover table-bordered" AutoGenerateColumns="false" OnRowCommand="grid_products_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
            <asp:BoundField DataField="Product" HeaderText="Product Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Retailer" HeaderText="Retailer" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="DateAdded" HeaderText="Date Added" DataFormatString="{0:dd/MM/yyyy}" />
            
            <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <div class="center">
                        <asp:Button ID="btn_remove" runat="server" Text="Remove" CommandName="remove" CommandArgument='<%# Eval("ProductID") %>' CausesValidation="false" UseSubmitBehavior="false" CssClass="w-75 btn btn-sm btn-danger" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView> 

    <hr id="hr_removed" runat="server"/>
    <h3 id="h3_removed" runat="server" class="text-center" >Removed Products</h3>

    <asp:GridView ID="grid_removed" runat="server" CssClass="table table-striped table-hover table-bordered" AutoGenerateColumns="false" OnRowCommand="grid_products_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
            <asp:BoundField DataField="Product" HeaderText="Product Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" />
            <asp:BoundField DataField="Retailer" HeaderText="Retailer" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="DateAdded" HeaderText="Date Added" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Button ID="btn_add" runat="server" Text="Restore" CommandName="restore" CommandArgument='<%# Eval("ProductID") %>' CausesValidation="false" UseSubmitBehavior="false" CssClass="w-75 btn btn-sm btn-success"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>