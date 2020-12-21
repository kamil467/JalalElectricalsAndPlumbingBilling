<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="NemisisWebApp.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <fieldset>
      <legend>InVoice Type</legend>
   
   <p>
    <asp:Button ID="cInvoice" runat="server" Text="Create Advanced Tax Invoice" OnClick="GoToCreateInvoicePage" />
    
    </p>
    <p>
     <asp:Button ID="Button1" runat="server" Text="Create Standard Invoice" OnClick="GoToCreateStandardInvoicePage" />
     </p>

     </fieldset>
</asp:Content>
