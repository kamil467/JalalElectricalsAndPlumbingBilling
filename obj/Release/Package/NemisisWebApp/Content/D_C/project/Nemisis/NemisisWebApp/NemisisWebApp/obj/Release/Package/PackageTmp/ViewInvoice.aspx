<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInvoice.aspx.cs" Inherits="NemisisWebApp.ViewInvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BorderColor="#CC3300" BorderStyle="Solid" 
           Height="101px" HorizontalAlign="Center" style="margin-bottom: 0px">
            <asp:Label ID="companyName" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
             <br>
               Address:<asp:Label ID="companyAddress" runat="server" Text=""></asp:Label>
            <br>
            <br>
            <asp:Label ID="companyContact" runat="server" Text=""></asp:Label>
            <br>
            <br></br>
            <br>
            <br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br>
            <br />
            <br />
            <br>
            <br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br>
            <br>
          
            <br></br>
            <br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br></br>
            <br>
            <br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            <br></br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
            </br>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="178px" HorizontalAlign="Left" 
            Width="386px" BorderColor="#CC6600" BorderStyle="Solid">
            <br />
            Customer Name:<asp:Label ID="customerName" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
            <br />
            Address :
            <asp:Label ID="customerAddress" runat="server" Text="Label" Font-Bold="True"></asp:Label>
            <br />
            Contact :<asp:Label ID="customerContact" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
            <br />
            InVoiceNumber :<asp:Label ID="InvoiceTIN" runat="server" Text="Label" 
                Font-Bold="True"></asp:Label>
            <br />
            Date :<asp:Label ID="InvoiceDate" runat="server" Text="Label" Font-Bold="True"></asp:Label>


        </asp:Panel>


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
         <asp:TemplateField HeaderText="NetRate">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("NetRate") %>' runat="server"></asp:Label>
      </ItemTemplate>
           </asp:TemplateField>
         <asp:TemplateField HeaderText="Discount">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("DiscountAmount") %>' runat="server"></asp:Label>
      </ItemTemplate>
           </asp:TemplateField>
   <asp:TemplateField HeaderText="Tax">
      <ItemTemplate>
          <asp:Label  ID="ItemId" Text='<%# Eval("TaxAmount") %>' runat="server"></asp:Label>
      </ItemTemplate>
          
      </asp:TemplateField>
         <asp:TemplateField HeaderText="Total">
             <FooterTemplate>
                 Total:
                 <asp:Label ID="TotalFooter" runat="server" Text="Label"></asp:Label>
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
</body>
</html>
