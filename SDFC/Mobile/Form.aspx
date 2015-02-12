<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="SDFC.Mobile.Form" MasterPageFile="~/Mobile/Mobile.master" %>
<%@ MasterType VirtualPath="~/Mobile/Mobile.master" %>

<asp:Content ID="Form" runat="server" ContentPlaceHolderID="MobileContent">
    <div class="panel horizontalCenter">
        <div id="formInputs" class="horizontalCenter">
            <asp:Label ID="name" runat="server" ClientIDMode="Static">name</asp:Label>
            <br />
            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            
            <asp:Label ID="date" runat="server" ClientIDMode="Static">date</asp:Label>
            <br />
            <asp:TextBox ID="txtDate" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
            <br />

            <asp:Label ID="description" runat="server" ClientIDMode="Static">description</asp:Label>
            <br />
            <asp:TextBox ID="txtDescription" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="signature" runat="server" ClientIDMode="Static">signature</asp:Label>
            <br />
            <div id="signatureTemp">
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>

            <asp:Button ID="submitButton" runat="server" ClientIDMode="Static" CssClass="button" Text="submit" OnClick="submitButton_Click"/>
            <div class="clearFix"></div>
        </div>
    </div>
</asp:Content>