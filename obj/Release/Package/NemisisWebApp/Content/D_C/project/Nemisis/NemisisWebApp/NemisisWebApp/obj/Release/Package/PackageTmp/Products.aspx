<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Products.aspx.cs" Inherits="NemisisWebApp.Products" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Button ID="Button1" runat="server" Text="Add Product"  
        OnClick="AddButtonClick" Width="138px"/>
    <asp:TextBox ID="searchString" runat="server" ontextchanged="TextBox1_TextChanged" 
        Width="135px"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="Search" OnClick="SearchProduct" />
   <div>
  

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
        GridLines="None" style="margin-top: 24px" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                ReadOnly="True" InsertVisible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity"  >
            <ControlStyle Width="16px" />
            <ItemStyle Width="4px" />
            </asp:BoundField>
            <asp:BoundField DataField="CostPrice" HeaderText="CostPrice" 
                SortExpression="CostPrice" >
            <ControlStyle Width="72px" />
            </asp:BoundField>
            <asp:BoundField DataField="SellPrice" HeaderText="SellPrice" 
                SortExpression="SellPrice" >
            <ControlStyle Width="72px" />
            </asp:BoundField>
            <asp:BoundField DataField="Measurements" HeaderText="Measurements" 
                SortExpression="Measurements" >
            <ControlStyle Width="72px" />
            </asp:BoundField>
            <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" 
                SortExpression="SupplierId" />
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
                SortExpression="CategoryId" />
            <asp:BoundField DataField="CGST" HeaderText="CGST" SortExpression="CGST" >
            <ControlStyle Width="16px" />
            </asp:BoundField>
            <asp:BoundField DataField="SGST" HeaderText="SGST" SortExpression="SGST" >
            <ControlStyle Width="16px" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        
        
        SelectCommand="SELECT * FROM [Product] WHERE ([Name] LIKE '%' + @Name + '%')" 

        
        UpdateCommand ="UPDATE [Product] SET [Name] = @Name, [Description] = @Description, [Quantity] = @Quantity, [CostPrice] = @CostPrice, [SellPrice] = @SellPrice, [Measurements] = @Measurements, [SupplierId] = @SupplierId, [CategoryId] = @CategoryId, [CGST] = @CGST, [SGST] = @SGST WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([CostPrice] = @original_CostPrice) OR ([CostPrice] IS NULL AND @original_CostPrice IS NULL)) AND (([SellPrice] = @original_SellPrice) OR ([SellPrice] IS NULL AND @original_SellPrice IS NULL)) AND (([Measurements] = @original_Measurements) OR ([Measurements] IS NULL AND @original_Measurements IS NULL)) AND (([SupplierId] = @original_SupplierId) OR ([SupplierId] IS NULL AND @original_SupplierId IS NULL)) AND (([CategoryId] = @original_CategoryId) OR ([CategoryId] IS NULL AND @original_CategoryId IS NULL)) AND (([CGST] = @original_CGST) OR ([CGST] IS NULL AND @original_CGST IS NULL)) AND (([SGST] = @original_SGST) OR ([SGST] IS NULL AND @original_SGST IS NULL))" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Product] WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([CostPrice] = @original_CostPrice) OR ([CostPrice] IS NULL AND @original_CostPrice IS NULL)) AND (([SellPrice] = @original_SellPrice) OR ([SellPrice] IS NULL AND @original_SellPrice IS NULL)) AND (([Measurements] = @original_Measurements) OR ([Measurements] IS NULL AND @original_Measurements IS NULL)) AND (([SupplierId] = @original_SupplierId) OR ([SupplierId] IS NULL AND @original_SupplierId IS NULL)) AND (([CategoryId] = @original_CategoryId) OR ([CategoryId] IS NULL AND @original_CategoryId IS NULL)) AND (([CGST] = @original_CGST) OR ([CGST] IS NULL AND @original_CGST IS NULL)) AND (([SGST] = @original_SGST) OR ([SGST] IS NULL AND @original_SGST IS NULL))" InsertCommand="INSERT INTO [Product] ([Name], [Description], [Quantity], [CostPrice], [SellPrice], [Measurements], [SupplierId], [CategoryId], [CGST], [SGST]) VALUES (@Name, @Description, @Quantity, @CostPrice, @SellPrice, @Measurements, @SupplierId, @CategoryId, @CGST, @SGST)"
        >
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_CostPrice" Type="Decimal" />
            <asp:Parameter Name="original_SellPrice" Type="Decimal" />
            <asp:Parameter Name="original_Measurements" Type="String" />
            <asp:Parameter Name="original_SupplierId" Type="Int32" />
            <asp:Parameter Name="original_CategoryId" Type="Int32" />
            <asp:Parameter Name="original_CGST" Type="Decimal" />
            <asp:Parameter Name="original_SGST" Type="Decimal" />
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
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="searchString" DefaultValue="P-" Name="Name" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
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
          <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Quantity" Type="Int32" />
            <asp:Parameter Name="original_CostPrice" Type="Decimal" />
            <asp:Parameter Name="original_SellPrice" Type="Decimal" />
            <asp:Parameter Name="original_Measurements" Type="String" />
            <asp:Parameter Name="original_SupplierId" Type="Int32" />
            <asp:Parameter Name="original_CategoryId" Type="Int32" />
            <asp:Parameter Name="original_CGST" Type="Decimal" />
            <asp:Parameter Name="original_SGST" Type="Decimal" />
        </UpdateParameters>


    </asp:SqlDataSource>
</asp:Content>

