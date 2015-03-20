<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SDFC.Desktop.WebForm2" %>
<asp:Content ID="ManageHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/home.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/manage.css" />
</asp:Content>

<asp:Content ID="ManageContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    
    <div id="divHomeContent">
        <div id="recentRecords">
            <div id="divRecent" class="recentRecord" runat="server">
                <asp:Label id="lblManageTitle" runat="server">Manage my Employees</asp:Label>
                <asp:Repeater runat="server" ID="rptrRecent">
                    <HeaderTemplate>
                        <table id="tblRecords">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="trRepeater">
                            <td>
                                Date: 
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "date")%>
                            </td>
                            <td>
                                Type: 
                            </td>
                            <td>
                                 <%# DataBinder.Eval(Container.DataItem, "reportType")%>
                            </td>
                        </tr>
                        <tr class="trRepeater">
                            <td>
                                Submitted By:
                            </td>
                            <td>
                                 <%# DataBinder.Eval(Container.DataItem, "submittedBy")%>
                            </td>
                            <td>
                                Victim:
                            </td>
                            <td>
                                 <%# DataBinder.Eval(Container.DataItem, "victim")%>
                            </td>
                        </tr>
                        <tr class="trRepeaterSpace">

                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

                <table id="tblRecent">
                        <tr class="trRepeater">
                            <td class="trHdr">
                                Employee: 
                            </td>
                            <td class="trVal">
                                John Smith
                            </td>
                            <td class="trHdr">
                                Role: 
                            </td>
                            <td class="trVal">
                                 Facility Manager
                            </td>
                        </tr>
                        <tr class="trRepeater">
                            <td class="trHdr">
                                Manager:
                            </td>
                            <td class="trVal">
                                 Johnny Manziel
                            </td>
                            <td class="trHdr">
                                Permissions:
                            </td>
                            <td class="trVal">
                                Accident Reports, Nightly Reports
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr class="trRepeaterSpace">

                        </tr>

                    <tr class="trRepeater">
                            <td class="trHdr">
                                Employee: 
                            </td>
                            <td class="trVal">
                                Tim Hightower
                            </td>
                            <td class="trHdr">
                                Role: 
                            </td>
                            <td class="trVal">
                                 Facility Manager
                            </td>
                        </tr>
                        <tr class="trRepeater">
                            <td class="trHdr">
                                Manager:
                            </td>
                            <td class="trVal">
                                 Johnny Manziel
                            </td>
                            <td class="trHdr">
                                Permissions:
                            </td>
                            <td class="trVal">
                                Accident Reports, Nightly Reports
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr class="trRepeaterSpace">

                        </tr>
                </table>

            </div>
        </div>
    </div>

</asp:Content>
