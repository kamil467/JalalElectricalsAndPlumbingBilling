<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSales.aspx.cs" Inherits="NemisisWebApp.ViewSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
      <fieldset class="register">
      <legend>Search Filter</legend>

      <p>
       <asp:Label ID="Label" runat="server" Text="Start Date" 
              AssociatedControlID="cName" Font-Bold="True"></asp:Label><asp:TextBox ID="startDate"
        runat="server"    CssClass="textEntry"
         ></asp:TextBox>
            </p>
      </fieldset>
 
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>

    <asp:GridView ID="InvoiceListGrid" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
       CellPadding="3" style="margin-top: 24px" DataKeyNames="InvoiceNumber" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" 
        >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="InvoiceNumber" HeaderText="InvoiceNumber" SortExpression="InvoiceNumber" 
                ReadOnly="True" InsertVisible="False" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="InvoiceDate" HeaderText="InvoiceDate" 
                SortExpression="InvoiceDate" />
            <asp:BoundField DataField="SalesValue" HeaderText="SalesValue" 
                SortExpression="SalesValue"  >
            </asp:BoundField>
            <asp:BoundField DataField="DiscountAmount" HeaderText="DiscountAmount" 
                SortExpression="DiscountAmount" >
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
</asp:Content>
