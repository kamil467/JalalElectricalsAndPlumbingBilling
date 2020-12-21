<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="NemisisWebApp.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
       Add Product
   </h2>
    <asp:Panel ID="Panel1" runat="server" Height="705px" Width="949px" 
        BorderColor="#CC6600" BorderStyle="Solid" HorizontalAlign="Left" 
        ScrollBars="Vertical">
   
      
      <fieldset class="register">
      
      <legend>Create new Product</legend>

          
         
         <p>
           <asp:Label ID="Label1" runat="server" Text="Product Name" 
                 AssociatedControlID="pName" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pName" CssClass="textEntry" runat="server" Height="28px"></asp:TextBox>  
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product Name cannot blank" ControlToValidate="pName" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
          
          
          <p> 
           <asp:Label ID="Label2" runat="server" Text="Description" 
                  AssociatedControlID="pDescription" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pDescription" runat="server" Height="44px"  CssClass="textEntry"
               TextMode="MultiLine" Width="403px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ControlToValidate="pDescription" ErrorMessage="Description Cannot be empty" 
               ForeColor="Red"></asp:RequiredFieldValidator>
           </p>
             <p> 
           <asp:Label ID="Label9" runat="server" Text="Category" 
                  AssociatedControlID="category" Font-Bold="True"></asp:Label>
                 <asp:DropDownList ID="category" runat="server">
                     <asp:ListItem Selected="True" Value="E">Electrical</asp:ListItem>
                     <asp:ListItem Value="P">Plumbing</asp:ListItem>
                 </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
               ControlToValidate="category" ErrorMessage="Category Cannot be empty" 
               ForeColor="Red"></asp:RequiredFieldValidator>
           </p>

           <p>
           <asp:Label ID="Label3" runat="server" Text="Quantity" 
                   AssociatedControlID="pQuantity" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pQuantity" runat="server"  CssClass="textEntry"
               TextMode="Number"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
               ControlToValidate="pQuantity" ErrorMessage="Quantity cannot be empty." 
               ForeColor="Red"></asp:RequiredFieldValidator>
           
           <asp:Label ID="Label8" runat="server" Text="Measurements" AssociatedControlID="measure"></asp:Label>
           <asp:TextBox ID="measure" runat="server" Height="28px"   CssClass="textEntry"
               Width="406px"></asp:TextBox>
          
           <asp:Label ID="Label4" runat="server" Text="Cost Price(Rs.)" 
                   AssociatedControlID="pCostPrice" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pCostPrice" runat="server"     CssClass="textEntry"
               TextMode="Number"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
               ControlToValidate="pCostPrice" ErrorMessage="Cost Price cannot be empty" 
               ForeColor="Red"></asp:RequiredFieldValidator>
           
               </p>
         
             <p>
           <asp:Label ID="Label6" runat="server" Text="CGST(%)" AssociatedControlID="cgst"></asp:Label>
           <asp:TextBox ID="cgst" runat="server" Text="9" CssClass="textEntry" TextMode="Number"></asp:TextBox>
         
           </p>
           <p>
           <asp:Label ID="Label7" runat="server" Text="SGST(%)" AssociatedControlID="sgdt"></asp:Label>
          <asp:TextBox ID="sgdt" runat="server" 
               TextMode="Number" CssClass="textEntry" Text="9" Width="121px"></asp:TextBox>
              </p>

              <p>
           <asp:Label ID="Label10" runat="server" Text="Profit(%)" AssociatedControlID="profit"></asp:Label>
          <asp:TextBox ID="profit" runat="server" 
               TextMode="Number" Text="15" CssClass="textEntry" Width="121px"></asp:TextBox>
              </p>

                    <p>
           <asp:Label ID="Label5" runat="server" Text="Selling Price(Rs.)" 
                       AssociatedControlID="pSellingPrice" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pSellingPrice" runat="server"   CssClass="textEntry"
               TextMode="Number"></asp:TextBox>
           </p>

                 <p>
           <asp:Button ID="Button1" runat="server" OnClick="calSellingPrice" 
               Text="Generate Selling Price" />


                    </fieldset>
              <p class="submitButton">
           <asp:Button ID="Add" runat="server" OnClick="AddProductItem" 
               Text="Add Product" />

               </p>
            </asp:Panel>
</asp:Content>
