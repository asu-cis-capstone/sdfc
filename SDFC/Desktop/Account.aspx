<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="SDFC.Desktop.WebForm3" %>

<asp:Content ID="AccountHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/desktop.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/account.css" />
    <script type="text/javascript" src="scripts/AccountScripts.js"></script>
</asp:Content>

<asp:Content ID="AccountContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    <div id="divContent">
        <asp:Label id="lblTitle" CssClass="titleCss" runat="server">My Account</asp:Label>

    </div>
</asp:Content>
