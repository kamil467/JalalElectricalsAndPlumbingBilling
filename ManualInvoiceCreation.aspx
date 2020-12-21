<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManualInvoiceCreation.aspx.cs" Inherits="NemisisWebApp.ManualInvoiceCreation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create Standard Invoice Here
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
        CellPadding="8" ForeColor="#333333" GridLines="None" ShowFooter="True" 
               OnRowDataBound="OnRowDataBound" onselectedindexchanged="GridView1_SelectedIndexChanged1" 
                >

        <AlternatingRowStyle BackColor="White" />

      <Columns>
      
      <asp:BoundField DataField="RowNumber" HeaderText="Sl No" />
      <asp:BoundField DataField="ProductId" HeaderText="ProductId"  />
      <asp:TemplateField HeaderText="Product Name">
          <FooterTemplate>
              <asp:Button ID="Button3" runat="server" Text="Refresh"  OnClick="Refresh"/>
          </FooterTemplate>
      <ItemTemplate>
          <asp:TextBox  ID="ProductName" Text='<%# Eval("ProductName") %>' runat="server" style="min-width:100%;"></asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>
       
       <asp:TemplateField HeaderText="Units" >
      <ItemTemplate>
      <asp:TextBox ID="Measurements" runat="server" Text='<%# Eval("Measurements") %>' style="width:96px;">

          </asp:TextBox>
      </ItemTemplate>
               
      </asp:TemplateField>
       <asp:TemplateField HeaderText="Qty">
      <ItemTemplate>
       <asp:UpdatePanel ID="UP1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="Quantity" runat="server" TextMode="Number" style="width:48px;" Text='<%# Eval("Quantity") %>'  AutoPostBack="true" OnTextChanged="Refresh">

          </asp:TextBox>

          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
      </asp:TemplateField>

       <asp:TemplateField HeaderText="CostPrice/Item" Visible="false">
      <ItemTemplate>
      <asp:TextBox ID="CostPrice" runat="server" TextMode="Number" style="width:72px;" Text='<%# Eval("CostPrice") %>' ReadOnly="true">

          </asp:TextBox>
      </ItemTemplate>
          
      </asp:TemplateField>
       <asp:TemplateField HeaderText="SellPrice/Item">
           <FooterTemplate>
               <asp:Label ID="NetSell" runat="server" Text="Label" Visible="false"></asp:Label>
           </FooterTemplate>
      <ItemTemplate>
      <asp:UpdatePanel ID="UP2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="SellPrice" runat="server" TextMode="Number" Text='<%# Eval("SellPrice") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="Refresh">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
            
      </asp:TemplateField>


       <asp:TemplateField HeaderText="DiscountAmount" Visible="false">
       <FooterTemplate>
               <asp:Label ID="NetDiscountAmount" runat="server" Text="Label"></asp:Label>
           </FooterTemplate>
      <ItemTemplate>
      <asp:UpdatePanel ID="UP3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="DiscountAmount" runat="server" TextMode="Number" Text='<%# Eval("DiscountAmount") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="Refresh">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
       
        </asp:TemplateField>
               
   
          <asp:TemplateField HeaderText="AmountAfterDiscount" Visible="false">
          <FooterTemplate>
               <asp:Label ID="NetAmountAfterDiscount" runat="server" Text="Label"></asp:Label>
           </FooterTemplate>
      <ItemTemplate>
      <asp:UpdatePanel ID="UP4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="AmountAfterDiscount" TextMode="Number" runat="server" Text='<%# Eval("AmountAfterDiscount") %>' AutoPostBack="true" style="width:72px;"  ReadOnly="true">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
       
        </asp:TemplateField>


       <asp:TemplateField HeaderText="TaxAmount" Visible="false">
        <FooterTemplate>
               <asp:Label ID="NetTaxAmount" runat="server" Text="Label"></asp:Label>
           </FooterTemplate>
      <ItemTemplate>
     <asp:UpdatePanel ID="UP6" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate> <asp:TextBox ID="TaxAmount" TextMode="Number" runat="server" Text='<%# Eval("TaxAmount") %>' AutoPostBack="true" style="width:72px;" OnTextChanged="Refresh">

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
      </asp:TemplateField>
      
       <asp:TemplateField HeaderText="Total">
       
       
        <FooterTemplate>
       
        <asp:UpdatePanel ID="UP21" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
                          <fieldset class="register">
        <p><asp:Label ID="Label5" runat="server" Text="Before Discount" AssociatedControlID="beforeDiscount"></asp:Label> 
              
               <asp:TextBox ID="beforeDiscount"  CssClass="textEntry" runat="server" Text="Label" style="width:72px;"></asp:TextBox>   
                   </p>
                     <p><asp:Label ID="dPelrLabe" runat="server" Text="Discount(%)" AssociatedControlID="discountPercenTage" ></asp:Label>
               <asp:TextBox ID="discountPercenTage" runat="server" 
               TextMode="Number" Text ="0" CssClass="textEntry" AutoPostBack="true" style="width:72px;"  />% 
              </p>
              
              <p>  <asp:Label ID="Label4" runat="server" Text="DiscountedAmount" AssociatedControlID="fDiscountedAmount" ></asp:Label>
              <asp:TextBox ID="fDiscountedAmount" runat="server" 
               TextMode="Number" Text ="0" CssClass="textEntry" AutoPostBack="true" style="width:72px;"  /> 
                    </p>

              <p>  <asp:Label ID="Label6" runat="server" Text="Final Amoint" AssociatedControlID="fAmount" ></asp:Label>
              <asp:TextBox ID="fAmount" runat="server" 
               TextMode="Number" Text ="0" CssClass="textEntry" AutoPostBack="true" style="width:72px;"  /> </p>

               <p>
               <asp:Button ID="calculateDiscount" runat="server" Text="Calculate" OnClick="Click_Calculate_Discount"  />
               </p>
            </fieldset>
               </ContentTemplate>
          </asp:UpdatePanel>
           </FooterTemplate>
      <ItemTemplate>
       <asp:UpdatePanel ID="UP7" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
       <ContentTemplate>
      <asp:TextBox ID="FinalPrice" runat="server" TextMode="Number" Text='<%# Eval("FinalPrice") %>' style="width:72px;"  AutoPostBack="true"  ReadOnly= "true" >

          </asp:TextBox>
          </ContentTemplate>
          </asp:UpdatePanel>
      </ItemTemplate>
          
           <ControlStyle Width="50px" />
          
      </asp:TemplateField>


              <asp:TemplateField HeaderText="Action">
      <ItemTemplate>
     
           <asp:Button ID="RemoveButton" runat="server" Text="Remove" OnClick="RemoveButtonClicked" />
      </ItemTemplate>                                                       
           
      </asp:TemplateField>

      </Columns>


        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
            BorderStyle="Solid" />
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
  
    <br />
 
    <br />
    <br />
    <br />
    <br />
    <br />
  
    <asp:Button ID="PrintSimpleInvoice" runat="server" Height="31px" 
        style="margin-left: 431px; margin-top: 0px" Text="Generate Invoice" 
        Width="216px" OnClick="P" />     
<asp:EntityDataSource ID="EntityDataSource1" runat="server" 
    ConnectionString="name=NemisisBillingEntities" 
    DefaultContainerName="NemisisBillingEntities" EnableFlattening="False" 
    EntitySetName="Products" EntityTypeFilter="Product" Select="it.[Name], it.[Id]">
</asp:EntityDataSource>


</asp:Content>
