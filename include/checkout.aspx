<%@ Page Title="" Language="C#" MasterPageFile="~/Agroflora.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Agroflora.checkout" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="text-center pt-5 pb-3">
        <asp:Image ID="img_logo_small" runat="server" src="images\logo_small.png" AlternateText="logo.png" CssClass="img-fluid"/>
        <h2>Checkout</h2>
        <p class="lead">Please Fill In Your Payment Details To Continue</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-5">
                <h3>Billing Details</h3>
                <table class="table table-striped table-hover">
                <tbody>
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
                        <th>Address</th>
                        <td id="td_address" runat="server">Address</td>
                    </tr>
                    <tr>
                        <th>Contact</th>
                        <td id="td_contact" runat="server">Contact</td>
                    </tr>
                </tbody>
            </table>

                <asp:DropDownList ID="drop_payment" runat="server" CssClass="form-select">
                    <asp:ListItem Value="0">Select Payment</asp:ListItem>
                    <asp:ListItem Value="1">Credit Card</asp:ListItem>
                    <asp:ListItem Value="2">Debit Card</asp:ListItem>
                    <asp:ListItem Value="3">Cash On Delivery</asp:ListItem>
                    <asp:ListItem Value="4">Cheque On Delivery</asp:ListItem>
                    <asp:ListItem Value="5">Mobile Payment</asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="vld_payment" runat="server" ControlToValidate="drop_payment" ErrorMessage="Please select a payment method" InitialValue="0" CssClass="error"></asp:RequiredFieldValidator>
                
                <hr/>
                <asp:Button ID="btn_submit" OnClick ="insertInDB" runat="server" Text="Confirm Payment" CssClass="btn-primary btn-lg w-100"/>
            </div>

            <div class="col text-end">
                <div class ="text-center">
                    <div class ="container pt-5">
                        <h3 class="text-center">Products</h3>
                        <asp:GridView ID="grid_products" OnRowCommand="grid_cart_rowCommand" AutoGenerateColumns="false" class="table table-striped table-hover table-bordered" runat="server">
                            <Columns>

                            <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Total" HeaderText="Total" />

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
                    </div>
                    <asp:Label ID="t_bill" runat="server" style ="font-weight:bold" Text="Total Bill : "></asp:Label>
                </div>
            </div>

        </div>
    </div>

        
</asp:Content>
