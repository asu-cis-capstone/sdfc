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
                <form>
                <asp:Repeater runat="server" ID="rptrEmp">
                    <HeaderTemplate>
                        
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table id="tblRecords" class="tblRepeater">
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Employee: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "firstName")%>
                                    <%# DataBinder.Eval(Container.DataItem, "lastName")%>
                                </td>
                                <td class="trHdr">
                                    Position: 
                                </td>
                                <td class="trVal">
                                     <%# DataBinder.Eval(Container.DataItem, "position")%>
                                </td>
                            </tr>
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    ASURITE:
                                </td>
                                <td>
                                     <%# DataBinder.Eval(Container.DataItem, "asurite")%>
                                </td>
                                <td class="trHdr">
                                    ASU ID:
                                </td>
                                <td class="trVal">
                                     <%# DataBinder.Eval(Container.DataItem, "asuID")%>
                                </td>
                            </tr>
                        </table>
                        <div class="empDetails">

                        </div>

                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
                </form>
                
            </div>
        </div>
                    

    </div>

</asp:Content>
