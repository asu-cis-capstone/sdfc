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
                
                <asp:Repeater runat="server" ID="rptrHome">
                    <HeaderTemplate>
                        <div class="divRepeater">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--first table is for record snippet collapsed--%>
                        <table class="tblRepeater"> 
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                                <td class="trHdr">
                                    Type: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                            </tr>
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Submitted By:
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                                <td class="trHdr">
                                    Victim:
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                            </tr>
                        </table>
                        <%--second table is actual form when expanded and wha you download as pdf--%>
                        <table class="recordDetails">
                            <tr>
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                                <td class="trHdr">
                                    Type: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                            </tr>
                            <tr>
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "date")%>
                                </td>
                                <td class="trHdr">
                                    Type: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "type")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button class="btnClass">Export .PDF</button>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>


                <%--test data start--%>
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
                <%--test data end--%>


            </div>
        </div>
    </div>
        
</asp:Content>