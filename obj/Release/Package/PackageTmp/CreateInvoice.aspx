<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateInvoice.aspx.cs" Inherits="NemisisWebApp.CreateInvoice" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create Advanced Tax Invoice Here
</h2>
      <fieldset class="register">
      <legend>Customer Information</legend>

      <p>
       <asp:Label ID="Label" runat="server" Text="Customer Name(*)" 
              AssociatedControlID="cName" Font-Bold="True"></asp:Label><asp:TextBox ID="cName"
        runat="server"    CssClass="textEntry"
         ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please provide customer name." ControlToValidate="cName" ForeColor="red"></asp:RequiredFieldValidator>
      </p>
           <p>
            <asp:Label ID="Label1" runat="server" Text="Customer Address(*)" 
                   AssociatedControlID="cAddress" Font-Bold="True"></asp:Label><asp:TextBox ID="cAddress"
        runat="server" Height="116px"  CssClass="textEntry"
        TextMode="MultiLine" Width="545px"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please provide customer address." ForeColor="red" ControlToValidate="cAddress"></asp:RequiredFieldValidator>
           </p>

           <p>
               <asp:Label ID="Label2" runat="server" Text="Customer Mobile Number(*)" 
                   AssociatedControlID="cContactNo" Font-Bold="True"></asp:Label><asp:TextBox ID="cContactNo" CssClass="textEntry"
        runat="server"  
       ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cContactNo" ForeColor="red" ErrorMessage="Please provide customer contact number."></asp:RequiredFieldValidator>
           </p>
      </fieldset>
   
    <br />
    <br />
    <br />
    Items Panel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Select Product"></asp:Label> <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="SuggestAppend" 
    DataSourceID="EntityDataSource1" DataTextField="Name" DataValueField="Id" 
    DropDownStyle="DropDownList" ItemInsertLocation="Append" MaxLength="0" 
    RenderMode="Inline" style="display: inline;" >
    <asp:ListItem>Select</asp:ListItem>
</ajaxToolkit:ComboBox>
    <asp:Button ID="Button2" runat="server" Text="Add to Cart" 
        onclick="Button2_Click" />

    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div style="overflow-x:auto;">
          
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged"  OnRowDataBound="OnRowDataBound">

        <AlternatingRowStyle BackColor="White" />

      <Columns>
      
      <asp:BoundField DataField="RowNumber" HeaderText="Sl No" />
      <asp:BoundField DataField="ProductId" HeaderText="ProductId"  />
      <asp:TemplateField HeaderText="Product Name">
      <ItemTemplate>
          <asp:TextBox  ID="ProductName" Text='<%# Eval("ProductName") %>' runat="server"></asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="Qty">
      <ItemTemplate>
       <asp:UpdatePanel ID="UP1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="Quantity" runat="server" style="width:48px;" Text='<%# Eval("Quantity") %>'  AutoPostBack="true" OnTextChanged="quantityChanged">

          </asp:TextBox>

          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="CostPrice/Item">
      <ItemTemplate>
      <asp:TextBox ID="CostPrice" runat="server" style="width:72px;" Text='<%# Eval("CostPrice") %>' ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>
       <asp:TemplateField HeaderText="SellPrice/Item">
      <ItemTemplate>
      <asp:UpdatePanel ID="UP2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="SellPrice" runat="server" Text='<%# Eval("SellPrice") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="SellPriceChanged">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
            
      </asp:TemplateField>


       <asp:TemplateField HeaderText="DiscountAmt/Item">
      <ItemTemplate>
      <asp:UpdatePanel ID="UP3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="DiscountAmount" runat="server" Text='<%# Eval("DiscountAmount") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="DiscountAmountChanged">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
       
      </asp:TemplateField>
       <asp:TemplateField HeaderText="TotalDiscountedAmt" >
          
      <ItemTemplate>
      <asp:TextBox ID="TotalDiscountedAmount" runat="server" Text='<%# Eval("TotalDiscountedAmount") %>' style="width:96px;" ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>



         <asp:TemplateField HeaderText="AfterDiscount">
      <ItemTemplate>
      <asp:UpdatePanel ID="UP4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" >
       <ContentTemplate>
      <asp:TextBox ID="AmountAfterDiscount" runat="server" Text='<%# Eval("AmountAfterDiscount") %>' AutoPostBack="true" style="width:72px;" ReadOnly="true">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
            
      </asp:TemplateField>
               
   
         <asp:TemplateField HeaderText="TaxValue/Item">
      <ItemTemplate>
      <asp:UpdatePanel ID="UP5" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="TaxValue" runat="server" Text='<%# Eval("TaxValue") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="TaxValueChanged">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
            
      </asp:TemplateField>
             <asp:TemplateField HeaderText="TotalTaxValue">
      <ItemTemplate>  
      <asp:TextBox ID="TotalTaxValueByQuantity" runat="server" Text='<%# Eval("TotalTaxValueByQuantity") %>' AutoPostBack="true" style="width:72px;" ReadOnly="true">
          </asp:TextBox>
      </ItemTemplate>
            
      </asp:TemplateField>


       <asp:TemplateField HeaderText="CGST/Item(%)">
      <ItemTemplate>
     <asp:UpdatePanel ID="UP6" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate> <asp:TextBox ID="CGST" runat="server" Text='<%# Eval("CGST") %>' AutoPostBack="true" style="width:16px;" OnTextChanged="CGSTChanged">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
      </asp:TemplateField>
       <asp:TemplateField HeaderText="SGST/Item(%)">
      <ItemTemplate>
       <asp:UpdatePanel ID="UP7" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="SGST" runat="server" Text='<%# Eval("SGST") %>' style="width:16px;"  AutoPostBack="true" OnTextChanged="SGSTChanged" >

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="TotalCGST(%)">
      <ItemTemplate>  
      <asp:TextBox ID="TotalCGSTQuantity" runat="server" Text='<%# Eval("TotalCGSTQuantity") %>' AutoPostBack="true" style="width:72px;" ReadOnly="true">
          </asp:TextBox>
      </ItemTemplate>
            
      </asp:TemplateField>
        <asp:TemplateField HeaderText="TotalSGST(%)">
      <ItemTemplate>  
      <asp:TextBox ID="TotalSGSTQuantity" runat="server" Text='<%# Eval("TotalSGSTQuantity") %>' AutoPostBack="true" style="width:72px;" ReadOnly="true">
          </asp:TextBox>
      </ItemTemplate>
            
      </asp:TemplateField>



       <asp:TemplateField HeaderText="Units" >
      <ItemTemplate>
      <asp:TextBox ID="Measurements" runat="server" Text='<%# Eval("Measurements") %>' style="width:96px;">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="NetAmount(WithoutTax)" >
      <ItemTemplate>
      <asp:TextBox ID="WithoutTax" runat="server" Text='<%# Eval("WithoutTax") %>' style="width:72px;" ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="TotalTaxAmount" >
      <ItemTemplate>
      <asp:TextBox ID="TotalTaxAmount" runat="server" Text='<%# Eval("TotalTaxAmount") %>' style="width:72px;" ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="NetAmount(WithTax)" >
      <ItemTemplate>
      <asp:TextBox ID="TotalAmount" runat="server" Text='<%# Eval("TotalAmount") %>' style="width:72px;" ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>

              <asp:TemplateField HeaderText="Action">
      <ItemTemplate>
     
           <asp:Button ID="RemoveButton" runat="server" Text="Remove" OnClick="RemoveButtonClicked" />
      </ItemTemplate>                                                       
          
      </asp:TemplateField>

      </Columns>


        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />


    </asp:GridView>
    </ContentTemplate>
     </asp:UpdatePanel>
           </div>


    <br />
       <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Panel ID="Panel1" runat="server" 
        Height="282px" BorderColor="Maroon" BorderStyle="Solid" BorderWidth="10px" 
        ForeColor="#996633" style="margin-top: 0px; margin-left: 20px;" Width="642px" 
               Visible="False" BackColor="#FFFFCC">
               &nbsp;&nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="Total SUM Panel" 
                   Font-Bold="True" Font-Underline="True"></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> 
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="NetDiscountAmount"></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="NetDiscountAmount" runat="server" ReadOnly="True" 
            style="margin-left: 14px" Width="160px"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="NetAmountAfterDiscount"></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NetAmountAfterDiscount" runat="server" Width="166px" 
            ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="NetTaxAmount"></asp:Label>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NetTaxAmount" runat="server" Width="165px" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="NetTotalSum"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NetTotalSum" runat="server" Width="163px" ReadOnly="True" AutoPostBack="true"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Height="21px" OnClick="RefreshGrid" 
            style="margin-left: 345px" Text="Refresh Calculate" Width="147px" />
            
               &nbsp;&nbsp;&nbsp;
            
        <br />
        <br />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Button ID="GenerateInvoice" runat="server" Text="GenerateInvoice" 
                   onclick="GenerateInvoice_Click" />
    </asp:Panel>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
       </ContentTemplate>
            </asp:UpdatePanel>
    <br />

    <br />
    <br />

    <br />
<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
    ConnectionString="name=NemisisBillingEntities" 
    DefaultContainerName="NemisisBillingEntities" EnableFlattening="False" 
    EntitySetName="Products" EntityTypeFilter="Product" Select="it.[Name], it.[Id]">
</asp:EntityDataSource>

</asp:Content>
