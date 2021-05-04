<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Deliverable2.Checkout" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <div class="py-5 text-center">
    <img class="d-block mx-auto mb-4" src="4ff28c6516ef2c46843f69010116d898-flowerpot-with-plant-clipart-by-vexels.png" alt="" width="72" height="57" runat="server">
&nbsp;<h2>Checkout</h2>
      <p class="lead">Please Fill In Your Payment Details To Continue</p>
        <p class="lead" runat="server">&nbsp;</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3" runat="server">
          <span class="text-primary" runat="server">Products</span>
          <span class="badge bg-primary rounded-pill" id="NumberofProducts" runat="server">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h5 class="my-0" id="ProductName" runat="server">Rose </h5>
              <h6 class="text-muted" id="ProductQuantity" runat="server">Quantity: 3</h6>
              <h6 class="text-muted" id="ProductPrice" runat="server">Price per Plant:Rs.80</h6>
            </div>
            <span class="text-muted" runat="server">Rs.240</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h5 class="my-0" id="Product2" runat="server">Shovel</h5>
              <h6 class="text-muted" id="Quantity2" runat="server">Quantity: 1</h6>
              <h6 class="text-muted" >Price per piece:200</h6>
            </div>
            <span class="text-muted" id="Price2" runat="server">Rs.200</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h5 class="my-0" id="Product3" runat="server">Mattok</h5>
              <h6 class="text-muted" id="Quantity3" runat="server">Quantity: 1</h6>
              <h6 class="text-muted" >Price per piece:1000</h6>
            </div>
            <span class="text-muted" id="Price3" runat="server">Rs.1000</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0" >Discount</h6>
            </div>
            <span class="text-success" id="Discount" runat="server">−Rs.40</span>
          </li>
          <li class="list-group-item d-flex justify-content-between" id="TotalAmount" runat="server">
            <span>Total (Rupee)</span>
            <strong>Rs.1400</strong>
          </li>
        </ul>
   </div>
       <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Billing Details</h4>
        <div class="needs-validation"  runat="server">
          <div class="row g-3">
            <div class="col-sm-6">
                <label for="firstName" class="form-label">First name</label>
              <asp:TextBox ID="firstName" type="text" class="form-control"  placeholder="" value="" runat="server"></asp:TextBox>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">Last name</label>
               <asp:TextBox ID="lastName" type="text" class="form-control"  placeholder="" value="" runat="server"></asp:TextBox>
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                 <asp:TextBox ID="username" type="text" class="form-control"  placeholder="" value="" runat="server"></asp:TextBox>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <asp:TextBox ID="email"   class="form-control" TextMode="Email" placeholder="you@example.com" runat="server"></asp:TextBox>
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">Address</label>
              <asp:TextBox ID="address"  class="form-control"  placeholder="1234 Main St" runat="server"></asp:TextBox>
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

          

            <div class="col-md-5">
              <label for="country" class="form-label">City</label>
              <asp:DropDownList id="country" class="form-select" runat="server">
                  <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                  <asp:ListItem Text="Lahore" Value="Lhr"></asp:ListItem>
                  <asp:ListItem Text="Karachi" Value="Khr"></asp:ListItem>
                  <asp:ListItem Text="Islamabad" Value="Isb"></asp:ListItem>
              </asp:DropDownList>
              <div class="invalid-feedback">
                Please select a valid city.
              </div>
            </div>

            <div class="col-md-4">
              <label for="state" class="form-label">Town/Society</label>
              <asp:DropDownList id="state" class="form-select"  runat="server">
                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                  <asp:ListItem Text="DHA" Value="DHA"></asp:ListItem>
                  <asp:ListItem Text="Gulberg" Value="Gulberg"></asp:ListItem>
                  <asp:ListItem Text="Johar Town" Value="Jt"></asp:ListItem>
                  <asp:ListItem Text="Wapda Town" Value="Wt"></asp:ListItem>
              </asp:DropDownList>
              <div class="invalid-feedback">
                Please provide a Soceity Name
              </div>
            </div>

            <div class="col-md-3">
              <label for="zip" class="form-label">Block/Street Number</label>
              <asp:TextBox ID="zip" runat="server"  class="form-control"  placeholder="" ></asp:TextBox>
              <div class="invalid-feedback">
                Block Number required.
              </div>
            </div>
          </div>

          <hr class="my-4">

          <div class="form-check">
            <asp:CheckBox ID="sameaddress" class="form-check-input"  runat="server"/>
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
          </div>

          <div class="form-check">
             <asp:CheckBox ID="SaveInfo" class="form-check-input"  runat="server"/>
            <label class="form-check-label" for="save-info">Save this information for next time</label>
          </div>

          <hr class="my-4"/>

          <h4 class="mb-3">Payment</h4>

          <div class="my-3">
            <div class="form-check">
              <asp:RadioButton id="credit" GroupName="paymentMethod" type="radio" class="form-check-input" runat="server"/>
              <label class="form-check-label" for="credit">Credit card</label>
            </div>
            <div class="form-check">
              <asp:RadioButton id="Debit" GroupName="paymentMethod" type="radio" class="form-check-input" runat="server"/>
              <label class="form-check-label" for="debit">Debit card</label>
            </div>
            <div class="form-check">
               <asp:RadioButton id="CashOnDelivery" GroupName="paymentMethod" type="radio" class="form-check-input" runat="server"/>
              <label class="form-check-label" for="paypal">Cash On Delivery</label>
            </div>
            <div class="form-check">
                 <asp:RadioButton id="ChequeOnDelivery" GroupName="paymentMethod" type="radio" class="form-check-input" runat="server"/>
                <label class="form-check-label" for="paypal">Cheque On Delivery</label>
              </div>
              <div class="form-check">
                 <asp:RadioButton id="MobilePayment" GroupName="paymentMethod" type="radio" class="form-check-input" runat="server"/>
                <label class="form-check-label" for="paypal">Mobile Payment</label>
              </div>
          </div>

          

        
          <hr class="my-4">

          <asp:Button ID="Submit" class="w-100 btn btn-primary btn-lg" type="submit" runat="server"/>Continue to checkout
        </div>
      </div>
        </div>
        
      


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      <script src="form-validation.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </asp:Content>
