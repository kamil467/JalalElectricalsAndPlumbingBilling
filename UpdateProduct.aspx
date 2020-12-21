<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="NemisisWebApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
      Update Product
   </h2>
    <asp:Literal ID="popup" runat="server"></asp:Literal>
    <asp:Panel ID="Panel1" runat="server" Height="705px" Width="949px" 
        BorderColor="#CC6600" BorderStyle="Solid" HorizontalAlign="Left" 
        ScrollBars="Vertical">  
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <fieldset class="register">
      
      <legend>Update Product</legend>
          
          <p>
           <asp:Label ID="Label11" runat="server" Text="Product Id" 
                 AssociatedControlID="pName" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pId" CssClass="textEntry" runat="server" Height="28px" ReadOnly="true"></asp:TextBox>  
            </p>
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
           </p>
         

           <p>
           <asp:Label ID="Label3" runat="server" Text="Quantity" 
                   AssociatedControlID="pQuantity" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pQuantity" runat="server"  Text="1" CssClass="textEntry"
               TextMode="Number"></asp:TextBox>
 </p>
 <p>
           
           <asp:Label ID="Label8" runat="server" Text="Measurements" AssociatedControlID="measure"></asp:Label>
           <asp:TextBox ID="measure" runat="server" Height="28px"   CssClass="textEntry"
               Width="406px"></asp:TextBox>
                 </p>
                 <p>
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
                        &nbsp;<asp:UpdatePanel ID="UP2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
           <asp:Label ID="Label5" runat="server" Text="Selling Price(Rs.)" 
                       AssociatedControlID="pSellingPrice" Font-Bold="True"></asp:Label>
           <asp:TextBox ID="pSellingPrice" runat="server"   CssClass="textEntry"    AutoPostBack="true"
               TextMode="Number"></asp:TextBox>
               </ContentTemplate>
               </asp:UpdatePanel> 
                       
                        <p>
                            <asp:Button ID="Button1" runat="server" BackColor="#6666FF" 
                                OnClick="calSellingPrice" Text="Generate Selling Price" />
                        </p>
                       
                        <p>
                        </p>
                       
                        <p>
                        </p>
                       
                        <p>
                        </p>
                       
                        <p>
                        </p>
                       
           </p>


                    </fieldset>

              <p class="submitButton" style="text-align:left;">
              <asp:Button ID="Button2"  type="button" style="text-align:left"  runat="server" OnClick="Cancel_Click" 
               Text="Cancel" BackColor="Red" />

           <asp:Button ID="Add" runat="server" OnClick="AddProductItem" 
               Text="Update Product" BackColor="#00CC66" />

               </p>
           
              
               </ContentTemplate>
               </asp:UpdatePanel>
            </asp:Panel>
            <script type="text/javascript" >
                $(document).ready(function () {
                    $('#Button1').click(function () {
                        $.blockUI({
                            onOverlayClick: $.unblockUI
                        });
                    });
                });
            </script>
</asp:Content>


