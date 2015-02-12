<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SDFC.Mobile.Login" MasterPageFile="~/Mobile/Mobile.master" %>
<%@ MasterType VirtualPath="~/Mobile/Mobile.master" %>

<asp:Content ID="LoginForm" runat="server" ContentPlaceHolderID="MobileContent">
    <div class="panel horizontalCenter">
        <div id="loginInputs" class="horizontalCenter">
            <asp:Label ID="username" runat="server" ClientIDMode="Static">username</asp:Label>
            <br />
            <asp:TextBox ID="txtusername" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            
            <asp:Label ID="password" runat="server" ClientIDMode="Static">password</asp:Label>
            <br />
            <asp:TextBox ID="txtpassword" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="loginButton" runat="server" ClientIDMode="Static" CssClass="button" Text="login" OnClick="loginButton_Click"/>
            <div class="clearFix"></div>
        </div>
    </div>
</asp:Content>

