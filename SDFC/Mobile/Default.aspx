<%@ Page Language="C#" AutoEventWireup="true" Inherits="Mobile_Default" MasterPageFile="~/Mobile/Mobile.master" Codebehind="Default.aspx.cs" %>
<%@ MasterType VirtualPath="~/Mobile/Mobile.master" %>

<asp:Content ID="DefaultMobileContent" runat="server" ContentPlaceHolderID="MobileContent">
    <div id="welcome" class="horizontalCenter">
        <asp:Label ID="welcomeLabel" runat="server" ClientIDMode="Static"></asp:Label>
    </div>
    <div id="select">
        <asp:Hyperlink runat="server" NavigateUrl="Form.aspx?ID=1">
            <div class="panel horizontalCenter selection">
                <asp:Label runat="server">Accident Report</asp:Label>
            </div>
        </asp:Hyperlink>
    </div>
</asp:Content>
