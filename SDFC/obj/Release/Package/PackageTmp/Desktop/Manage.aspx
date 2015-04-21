<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="SDFC.Desktop.WebForm2"  EnableEventValidation="false" %>
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
                <form runat="server">
                <asp:Repeater runat="server" ID="rptrEmp" >
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
                            <table>
                                <tr>
                                    <th>
                                        ASU ID
                                    </th>
                                    <th>
                                        ASURITE
                                    </th>
                                    <th>
                                        Password
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtAsuID" Text=<%# DataBinder.Eval(Container.DataItem, "asuID")%>></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtAsurite" Text=<%# DataBinder.Eval(Container.DataItem, "asurite")%>></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtPassword" Text=<%# DataBinder.Eval(Container.DataItem, "password")%>></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        First Name
                                    </th>
                                    <th>
                                        Last Name
                                    </th>
                                    <th>
                                        Position
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtFirstName" Text=<%# DataBinder.Eval(Container.DataItem, "firstName")%>></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtLastName" Text=<%# DataBinder.Eval(Container.DataItem, "lastName")%>></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtPosition" Text=<%# DataBinder.Eval(Container.DataItem, "position")%>></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Active
                                    </th>
                                    <th>
                                        Manager
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtActive" Text=<%# DataBinder.Eval(Container.DataItem, "active")%>></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtManager" Text=<%# DataBinder.Eval(Container.DataItem, "manager")%>></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Button Text="Update" runat="server" OnClick="Update_Click"/>
                                    </td>
                                </tr>
                            </table>
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
