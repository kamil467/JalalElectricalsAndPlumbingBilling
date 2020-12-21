<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NemisisWebApp._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Jalal Electricals & Plumbing!
    </h2>
    <p style="text-align:center">
        <asp:Image ID="Image1" runat="server" Height="200px" style="text-align:center" 
            Width="476px" ImageAlign="Middle" ImageUrl="~/Scripts/logo.jpg" />
    </p>



    <p>
       One stop solution for all of your billing problems.
       
    </p>
    <p>
    You can do follwoing actions.
    </p>
    <ol>
    <li>Add/Edit/Delete Products to Inventory</li>
    <li>Create Customer(currently you can do this during invoice generation).</li>
    <li>Generate Invoice</li> 
    </ol>
    <p>
        For queries and issues, please reach out to Kamil at +918884081427/8884081427 or email :kamil467@gmail.com
    </p>
</asp:Content>
