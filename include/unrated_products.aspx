<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora_user.Master" AutoEventWireup="true" CodeBehind="unrated_products.aspx.cs" Inherits="Agroflora.unrated_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h2>Rate a Product</h2>
    </div>

    <div class ="text-center">
        <div class ="container pt-5">
            
            <asp:GridView ID="grid_rating" OnRowCommand="grid_rating_rowCommand" AutoGenerateColumns="false" class="table table-striped table-hover table-bordered" runat="server">
                <Columns>

                <asp:BoundField DataField="ProductName" HeaderText="Name" />

                <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
			        <ItemStyle HorizontalAlign="Center" />
			        <ItemTemplate>
				        <div class="center">
					        <asp:Button ID="btn_remove" runat="server" Text="Rate" CommandName="remove" CommandArgument='<%# Eval("ProductID") %>' CausesValidation="false" UseSubmitBehavior="false" CssClass="w-30 btn btn-sm btn-primary" />
				        </div>
			        </ItemTemplate>
		        </asp:TemplateField>

                </Columns>
                            
            </asp:GridView>
        </div>
    </div>

</asp:Content>