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
                        <div class="recordDetails">
                            <h1>Arizona State University - Sun Devil Fitness Complex - Accident/Injury Report</h1>
                            <div class="victimInfo">
                                <table>
                                    <tr>
                                        <td class="trHdr">
                                            Victim's Name: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "victimName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Address: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            <%# DataBinder.Eval(Container.DataItem, "address")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Phone: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "phone")%>
                                        </td>
                                        <td class="trHdr">
                                            Age: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "age")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Gender: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "genderMale")%>
                                        </td>
                                        <td class="trHdr">
                                            ASU ID#: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "asuID")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Status: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            Student
                                            <%--<%# DataBinder.Eval(Container.DataItem, "address")%>--%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="reportInfo">
                                <table>
                                    <tr>
                                        <td class="trHdr">
                                            Activity: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "activityName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Accident/Injury Location: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "locationName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Action Taken: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "actionName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Suspected Type of Injury: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "injuryTypeName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Location of Injury: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "injuryLocationName")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Method of Treatment: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "treatmentName")%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="treatmentInfo">
                                <table>
                                    <tr>
                                        <td class="trHdr">
                                            Name of Person Providing Treatment: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "treatmentProvider")%>
                                        </td>
                                        <td class="trHdr">
                                            Position Title: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "positionTitle")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Was the Facility Manager Called: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "managerCalled")%>
                                        </td>
                                        <td class="trHdr">
                                            If not, why: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "notWhy")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Was 911 Called: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "emergencyCalled")%>
                                        </td>
                                        <td class="trHdr">
                                            Time Called: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "timeCalled")%>
                                        </td>
                                        <td class="trHdr">
                                            Arrival Time: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "arrival")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            911 Report #: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "emergencyReportNum")%>
                                        </td>
                                        <td class="trHdr">
                                            Transported To: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "transported")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Medical Report #: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "medicalReportNum")%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="description">
                                <table>
                                    <tr>
                                        <td class="trHdr">
                                            Description: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "description")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Witness Name: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "witnessName")%>
                                        </td>
                                        <td class="trHdr">
                                            Witness Phone: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "witnessPhone")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Victim's Signature: 
                                        </td>
                                        <td class="trVal">
                                            <%# DataBinder.Eval(Container.DataItem, "victimSig")%>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
        
</asp:Content>