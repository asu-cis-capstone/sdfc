<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" MasterPageFile="~/Desktop/Desktop.master" Codebehind="Home.aspx.cs" %>
<%@ MasterType VirtualPath="~/Desktop/Desktop.master" %>

<asp:Content ID="HomeHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/desktop.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/home.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/HomeScripts.js"></script>

</asp:Content>

<asp:Content ID="HomeContent" runat="server" ContentPlaceHolderID="DesktopContentPlaceholder">

    <div id="divContent">
        <asp:Label id="lblTitle" CssClass="titleCss" runat="server">Welcome, [insert name]</asp:Label>

        <div id="recentRecords">
            <div id="divRecent" class="recentRecord" runat="server">
                <asp:Label id="lblHomeTitle" runat="server">Recently Submitted</asp:Label>
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

                    <%--<table id="tblRecent">
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
                        </table>--%>
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
                    <table class="recordDetails">
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
                    <table class="recordDetails">
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
        </div>
    </div>
        
</asp:Content>