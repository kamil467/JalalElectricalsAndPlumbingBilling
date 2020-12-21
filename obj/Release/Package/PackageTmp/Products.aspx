<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Products.aspx.cs" Inherits="NemisisWebApp.Products" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Button ID="Button1" runat="server" Text="Add Product"  
        OnClick="AddButtonClick" Width="138px"/>
    <asp:TextBox ID="searchString" runat="server" ontextchanged="TextBox1_TextChanged" 
        Width="135px"></asp:TextBox>

    <asp:Button ID="Button2" runat="server" Text="Search" OnClick="SearchProduct" />

      <asp:Button ID="Button3" runat="server" Text="Show All" OnClick="ShowAll"  Visible="false"/>
   <div>
  

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" 
        GridLines="None" style="margin-top: 24px" DataKeyNames="Id" 
           onselectedindexchanged="GridView1_SelectedIndexChanged"  OnPageIndexChanging="ProductPageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                ReadOnly="True" InsertVisible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity"  >
            </asp:BoundField>
            <asp:BoundField DataField="CostPrice" HeaderText="CostPrice" 
                SortExpression="CostPrice" >
            </asp:BoundField>
            <asp:BoundField DataField="SellPrice" HeaderText="SellPrice" 
                SortExpression="SellPrice" >
            <ControlStyle Font-Bold="True" Font-Underline="True" />
            <ItemStyle Font-Bold="True" Font-Underline="True" />
            </asp:BoundField>
            <asp:BoundField DataField="Measurements" HeaderText="Measurements" 
                SortExpression="Measurements" >
            </asp:BoundField>
            <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" 
                SortExpression="SupplierId" />
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
                SortExpression="CategoryId" />
            <asp:BoundField DataField="CGST" HeaderText="CGST" SortExpression="CGST" >
            </asp:BoundField>
            <asp:BoundField DataField="SGST" HeaderText="SGST" SortExpression="SGST" >
            </asp:BoundField>
            <asp:BoundField DataField="PofitPercent" HeaderText="PofitPercent" 
                SortExpression="PofitPercent" />
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
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
           DeleteCommand="DELETE FROM [Product] WHERE [Id] = @Id" 
           InsertCommand="INSERT INTO [Product] ([Name], [Description], [Quantity], [CostPrice], [SellPrice], [Measurements], [SupplierId], [CategoryId], [CGST], [SGST], [PofitPercent]) VALUES (@Name, @Description, @Quantity, @CostPrice, @SellPrice, @Measurements, @SupplierId, @CategoryId, @CGST, @SGST, @PofitPercent)" 
           SelectCommand="SELECT * FROM [Product] ORDER BY [Id]" 
           UpdateCommand="UPDATE [Product] SET [Name] = @Name, [Description] = @Description, [Quantity] = @Quantity, [CostPrice] = @CostPrice, [SellPrice] = @SellPrice, [Measurements] = @Measurements, [SupplierId] = @SupplierId, [CategoryId] = @CategoryId, [CGST] = @CGST, [SGST] = @SGST, [PofitPercent] = @PofitPercent WHERE [Id] = @Id">
           <DeleteParameters>
               <asp:Parameter Name="Id" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="Name" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="Quantity" Type="Int32" />
               <asp:Parameter Name="CostPrice" Type="Decimal" />
               <asp:Parameter Name="SellPrice" Type="Decimal" />
               <asp:Parameter Name="Measurements" Type="String" />
               <asp:Parameter Name="SupplierId" Type="Int32" />
               <asp:Parameter Name="CategoryId" Type="Int32" />
               <asp:Parameter Name="CGST" Type="Decimal" />
               <asp:Parameter Name="SGST" Type="Decimal" />
               <asp:Parameter Name="PofitPercent" Type="Decimal" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="Name" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="Quantity" Type="Int32" />
               <asp:Parameter Name="CostPrice" Type="Decimal" />
               <asp:Parameter Name="SellPrice" Type="Decimal" />
               <asp:Parameter Name="Measurements" Type="String" />
               <asp:Parameter Name="SupplierId" Type="Int32" />
               <asp:Parameter Name="CategoryId" Type="Int32" />
               <asp:Parameter Name="CGST" Type="Decimal" />
               <asp:Parameter Name="SGST" Type="Decimal" />
               <asp:Parameter Name="PofitPercent" Type="Decimal" />
               <asp:Parameter Name="Id" Type="Int32" />
           </UpdateParameters>
       </asp:SqlDataSource>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        
          SelectCommand="SELECT * FROM [Product] WHERE ([Name] LIKE '%' + @Name + '%')" 
   
        
        UpdateCommand ="UPDATE [Product] SET [Name] = @Name, [Description] = @Description, [Quantity] = @Quantity, [CostPrice] = @CostPrice, [SellPrice] = @SellPrice, [Measurements] = @Measurements, [SupplierId] = @SupplierId, [CategoryId] = @CategoryId, [CGST] = @CGST, [SGST] = @SGST, [PofitPercent] = @PofitPercent WHERE [Id] = @original_Id" 
        DeleteCommand="DELETE FROM [Product] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Product] ([Name], [Description], [Quantity], [CostPrice], [SellPrice], [Measurements], [SupplierId], [CategoryId], [CGST], [SGST], [PofitPercent]) VALUES (@Name, @Description, @Quantity, @CostPrice, @SellPrice, @Measurements, @SupplierId, @CategoryId, @CGST, @SGST, @PofitPercent)"
        >
         <SelectParameters>
            <asp:ControlParameter ControlID="searchString"  Name="Name" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="CostPrice" Type="Decimal" />
            <asp:Parameter Name="SellPrice" Type="Decimal" />
            <asp:Parameter Name="Measurements" Type="String" />
            <asp:Parameter Name="SupplierId" Type="Int32" />
            <asp:Parameter Name="CategoryId" Type="Int32" />
            <asp:Parameter Name="CGST" Type="Decimal" />
            <asp:Parameter Name="SGST" Type="Decimal" />
            <asp:Parameter Name="PofitPercent" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
         <asp:Parameter Name="Description" Type="String" />
         <asp:Parameter Name="Quantity" Type="Int32" />
         <asp:Parameter Name="CostPrice" Type="Decimal" />
         <asp:Parameter Name="SellPrice" Type="Decimal" />
         <asp:Parameter Name="Measurements" Type="String" />
         <asp:Parameter Name="SupplierId" Type="Int32" />
         <asp:Parameter Name="CategoryId" Type="Int32" />
         <asp:Parameter Name="CGST" Type="Decimal" />
         <asp:Parameter Name="SGST" Type="Decimal" />
          <asp:Parameter Name="PofitPercent" Type="Decimal" />
            <asp:Parameter Name="original_Id" Type="Int32" />
        </UpdateParameters>


    </asp:SqlDataSource>
</asp:Content>

