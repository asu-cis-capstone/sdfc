<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SDFC.Desktop.WebForm2" %>
<asp:Content ID="ManageHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/desktop.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/manage.css" />
    <script type="text/javascript" src="scripts/ManageScripts.js"></script>
</asp:Content>

<asp:Content ID="ManageContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    
    <div id="divContent">
        <div id="recentRecords">
            <div id="divRecent" class="recentRecord" runat="server">
                <asp:Label id="lblTitle" CssClass="titleCss" runat="server">Manage my Employees</asp:Label>
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
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                
            </div>
        </div>

                <div class="divRepeater">
                        <table class="tblRepeater">
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    3/15/15
                                </td>
                                <td class="trHdr">
                                    Type: 
                                </td>
                                <td class="trVal">
                                     Accident Report
                                </td>
                            </tr>
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Submitted By:
                                </td>
                                <td class="trVal">
                                     Facility Manager
                                </td>
                                <td class="trHdr">
                                    Victim:
                                </td>
                                <td class="trVal">
                                    Tim O'Leary
                                </td>
                                <td>

                                </td>
                            </tr>
                            <tr class="trRepeaterSpace">
                            </tr>
                    </table>
                    <table class="empDetails">
                        <tr>
                            <td class="trHdr">
                                Date: 
                            </td>
                            <td class="trVal">
                                3/15/15
                            </td>
                            <td class="trHdr">
                                Type: 
                            </td>
                            <td class="trVal">
                                 Accident Report
                            </td>
                        </tr>
                        <tr>
                            <td class="trHdr">
                                Date: 
                            </td>
                            <td class="trVal">
                                3/15/15
                            </td>
                            <td class="trHdr">
                                Type: 
                            </td>
                            <td class="trVal">
                                 Accident Report
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="divRepeater">
                        <table class="tblRepeater">
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    3/15/15
                                </td>
                                <td class="trHdr">
                                    Type: 
                                </td>
                                <td class="trVal">
                                     Accident Report
                                </td>
                            </tr>
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Submitted By:
                                </td>
                                <td class="trVal">
                                     Facility Manager
                                </td>
                                <td class="trHdr">
                                    Victim:
                                </td>
                                <td class="trVal">
                                    Tim O'Leary
                                </td>
                            </tr>
                    </table>
                    <table class="empDetails">
                        <tr>
                            <td class="trHdr">
                                Date: 
                            </td>
                            <td class="trVal">
                                3/15/15
                            </td>
                            <td class="trHdr">
                                Type: 
                            </td>
                            <td class="trVal">
                                 Accident Report
                            </td>
                        </tr>
                        <tr>
                            <td class="trHdr">
                                Date: 
                            </td>
                            <td class="trVal">
                                3/15/15
                            </td>
                            <td class="trHdr">
                                Type: 
                            </td>
                            <td class="trVal">
                                 Accident Report
                            </td>
                        </tr>
                    </table>
                </div>
                    

    </div>

</asp:Content>
