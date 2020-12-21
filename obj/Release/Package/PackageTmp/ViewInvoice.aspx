<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInvoice.aspx.cs" Inherits="NemisisWebApp.ViewInvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h2,table
        {
        	margin:0;
        }
        table
        {
        	margin-top:0 !important;
        }
        body
        {
        
        }
        fieldset > p
        {
        	margin:0;
        }

             page[size="A4"]
             {
             	width:21cm;
             	height:29.7cm ;
             	display:block;
             	margin:0 auto;
             	margin-bottom:0.5cm;
             	box-shadow:0 0 0.5cm rgb(0,0,0,0.5);
             }
        @media print
        {
        	html,body,page[sie="A4]"
        	{
        		margin:0;
        		box-shadow:0;
        		
        	}
        }
    </style>
</head>
<body>
<page size="A4">
    <form id="form1" runat="server">
    <div>
    
            <div style="text-align:center;">
            <asp:Image ID="Image1" runat="server" Height="223px" 
                ImageUrl="~/Scripts/logo.jpg" Width="675px" />
                 </div>
             <hr />
               <fieldset class="register">
      <legend>Customer Information</legend>

      <p>
       <asp:Label ID="Label" runat="server" Text="Customer Name-" 
              AssociatedControlID="customerName" />

              <asp:Label ID="customerName" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
         </p>

           
      <p>
       <asp:Label ID="Label1" runat="server" Text="Address-" 
              AssociatedControlID="customerAddress"  /> 

              <asp:Label ID="customerAddress" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
         </p>

         
      <p>
       <asp:Label ID="Label3" runat="server" Text="Contact No" 
              AssociatedControlID="customerContact" />

              <asp:Label ID="customerContact" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
         </p>

             <p>
       <asp:Label ID="Label2" runat="server" Text="InVoiceNumber-" 
              AssociatedControlID="InvoiceTIN"  />    

              <asp:Label ID="InvoiceTIN" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
         </p>
                 <p>
       <asp:Label ID="Label4" runat="server" Text="Date-" 
              AssociatedControlID="InvoiceDate" />

              <asp:Label ID="InvoiceDate" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
         </p> 
           
</fieldset>
                
 <h2>Purchase Details</h2>

        <asp:GridView ID="GridView1" runat="server" CellPadding="8" ForeColor="#333333" 
            AutoGenerateColumns="False" HorizontalAlign="Center" 
            style="margin-top: 58px" BorderStyle="Solid" ShowHeaderWhenEmpty="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
              <asp:BoundField DataField="RowNumber" HeaderText="Sl.No"  />


                <asp:TemplateField HeaderText="Id">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("ItemId") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("Item") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
       <asp:TemplateField HeaderText="Units" Visible="true">
  
      <ItemTemplate>
          <asp:Label  ID="Measurements" Text='<%# Eval("Measurements") %>' runat="server"></asp:Label>
      </ItemTemplate>
           </asp:TemplateField>
         <asp:TemplateField HeaderText="Qty">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("Qty") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
         <asp:TemplateField HeaderText="RatePerItem">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("RatePerItem") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
         <asp:TemplateField HeaderText="NetRate" Visible="false">
             <FooterTemplate>
                 <asp:Label ID="totalLabel" runat="server" Text="Total"></asp:Label>
             </FooterTemplate>
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("NetRate") %>' runat="server"></asp:Label>
      </ItemTemplate>
           </asp:TemplateField>
           


         <asp:TemplateField HeaderText="Discount" Visible="false">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("DiscountAmount") %>' runat="server"></asp:Label>
      </ItemTemplate>
           </asp:TemplateField>
   <asp:TemplateField HeaderText="Tax" Visible="false">
       <FooterTemplate>
           Total
       </FooterTemplate>
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("TaxAmount") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
         <asp:TemplateField HeaderText="Total">
             <FooterTemplate>
                 <fieldset class="register">
        <p><asp:Label ID="Label5" runat="server" Text="Before Discount"></asp:Label> 
              
               <asp:Label ID="beforeDiscount" runat="server"></asp:Label>   
                   </p>

            </fieldset>
             </FooterTemplate>
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("TotalAmount") %>' runat="server"></asp:Label>
      </ItemTemplate>
     

      </asp:TemplateField>                                 
      
      
      </Columns>
           
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#FF6600" Font-Bold="True" ForeColor="Black" 
                BorderStyle="Solid" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
         <asp:Panel ID="Panel3" runat="server" BorderColor="#CC6600" BorderStyle="Solid" 
                Height="97px" HorizontalAlign="Left">
                &nbsp;&nbsp; Comments (if any) :<br />
                <br />
                <br />
                &nbsp; Authorised Signature:</asp:Panel>
    </div>
    </form>
    </page>
</body>
</html>
