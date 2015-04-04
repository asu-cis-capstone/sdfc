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
                                    Victim Name: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "victimName")%>
                                </td>
                                <td class="trHdr">
                                    ASU ID: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "asuID")%>
                                </td>
                            </tr>
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Location:
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "locationName")%>
                                </td>
                                <td class="trHdr">
                                    Submitted By:
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "treatmentProvider")%>
                                </td>
                            </tr>
                        </table>
                        <%--second table is actual form when expanded and wha you download as pdf--%>
                        <div>
                            
                        </div>
                        <table class="recordDetails">
                            <tr>
                                <td class="trHdr">
                                    Victim Address: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "address")%>
                                </td>
                                <td class="trHdr">
                                    Victim Phone: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "phone")%>
                                </td>
                            </tr>
                            <tr>
                                <td class="trHdr">
                                    Victim Age: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "age")%>
                                </td>
                                <td class="trHdr">
                                    Description of Event: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "description")%>
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

            </div>
        </div>
    </div>
        
</asp:Content>