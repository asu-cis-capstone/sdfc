<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" MasterPageFile="~/Desktop/Desktop.master" Codebehind="Home.aspx.cs" EnableEventValidation="false" %>
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
                
                
                <form runat="server">

                <asp:Repeater runat="server" ID="rptrHome">
                    <HeaderTemplate>
                        <div class="divRepeater">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%--first table is for record snippet collapsed--%>
                        <table class="tblRepeater"> 
                            <tr class="trRepeater">
                                <td class="trHdr">
                                    Report ID: 
                                </td>
                                <td class="trVal">
                                    <%--<<%# DataBinder.Eval(Container.DataItem, "reportID")%>--%>
                                    <asp:Label ID="lblReportID" Text='<%# DataBinder.Eval(Container.DataItem, "reportID")%>'  runat="server" />
                                </td>
                                <td class="trHdr">
                                    Date: 
                                </td>
                                <td class="trVal">
                                    <%# DataBinder.Eval(Container.DataItem, "dateFiled")%>
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
                                            <%--<%# DataBinder.Eval(Container.DataItem, "victimName")%>--%>
                                            <asp:Label ID="lblVictimName" Text='<%# DataBinder.Eval(Container.DataItem, "victimName")%>'  runat="server" />
                                        </td>
                                        <td class="trHdr">
                                            Date Submitted: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "address")%>--%>
                                            <asp:Label ID="lblDateFiled" Text='<%# DataBinder.Eval(Container.DataItem, "dateFiled")%>'  runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Address: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "address")%>--%>
                                            <asp:Label ID="lblAddress" Text='<%# DataBinder.Eval(Container.DataItem, "address")%>'  runat="server" />
                                        </td>
                                        <td class="trHdr">
                                            Employee: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "address")%>--%>
                                            <asp:Label ID="lblEmployee" Text='<%# DataBinder.Eval(Container.DataItem, "lastName")%>'  runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Phone: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "phone")%>--%>
                                            <asp:Label ID="lblPhone" Text='<%# DataBinder.Eval(Container.DataItem, "phone")%>'  runat="server" />
                                        </td>
                                        <td class="trHdr">
                                            Age: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "age")%>--%>
                                            <asp:Label ID="lblAge" Text='<%# DataBinder.Eval(Container.DataItem, "age")%>'  runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Gender: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "genderMale")%>--%>
                                            <%--<%# DataBinder.Eval(Container.DataItem, "genderMale").ToString() == "1" ? "Male" : "Female" %>--%>
                                            <asp:Label ID="lblGender" Text='<%# DataBinder.Eval(Container.DataItem, "genderMale").ToString() == "1" ? "Male" : "Female" %>'  runat="server" />
                                        </td>
                                        <td class="trHdr">
                                            ASU ID#: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "asuID")%>--%>
                                            <asp:Label ID="lblAsuID" Text='<%# DataBinder.Eval(Container.DataItem, "asuID")%>'  runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Status: 
                                        </td>
                                        <td class="trVal" colspan="3">
                                            Student
                                            <%--<asp:Label ID="lblStatus" Text='<%# DataBinder.Eval(Container.DataItem, "victimName")%>'  runat="server" />--%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="reportInfo">
                                <p class="hdr">
                                    Activity: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "activityName")%>--%>
                                    <asp:Label ID="lblActivity" Text='<%# DataBinder.Eval(Container.DataItem, "activityName")%>'  runat="server" />
                                </p>
                                <p class="hdr">
                                    Accident/Injury Location: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "locationName")%>--%>
                                    <asp:Label ID="lblLocationName" Text='<%# DataBinder.Eval(Container.DataItem, "locationName")%>'  runat="server" />
                                </p>
                                <p class="hdr">
                                    Action Taken: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "actionName")%>--%>
                                    <asp:Label ID="lblActionName" Text='<%# DataBinder.Eval(Container.DataItem, "actionName")%>'  runat="server" />
                                </p>
                                <p class="hdr">
                                    Suspected Type of Injury: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "injuryTypeName")%>--%>
                                    <asp:Label ID="lblInjuryTypeName" Text='<%# DataBinder.Eval(Container.DataItem, "injuryTypeName")%>'  runat="server" />
                                </p>
                                <p class="hdr">
                                    Location of Injury: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "injuryLocationName")%>--%>
                                    <asp:Label ID="lblInjuryLocationName" Text='<%# DataBinder.Eval(Container.DataItem, "injuryLocationName")%>'  runat="server" />
                                </p>
                                <p class="hdr">
                                    Method of Treatment: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "treatmentName")%>--%>
                                    <asp:Label ID="lblTreatmentName" Text='<%# DataBinder.Eval(Container.DataItem, "treatmentName")%>'  runat="server" />
                                </p>
                            </div>
                            <div class="treatmentInfo">
                                <div class="treatmentContent">
                                    <table>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                Name of Treatment Provider: 
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "treatmentProvider")%>--%>
                                                <asp:Label ID="lblTreatmentProvider" Text='<%# DataBinder.Eval(Container.DataItem, "treatmentProvider")%>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                Was the Facility Manager Called: 
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "managerCalled").ToString() == "1" ? "Yes" : "No" %>--%>
                                                <asp:Label ID="lblManagerCalled" Text='<%# DataBinder.Eval(Container.DataItem, "managerCalled").ToString() == "1" ? "Yes" : "No" %>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                Was 911 Called: 
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "emergencyCalled").ToString() == "1" ? "Yes" : "No" %>--%>
                                                <asp:Label ID="lblEmergencyCalled" Text='<%# DataBinder.Eval(Container.DataItem, "emergencyCalled").ToString() == "1" ? "Yes" : "No" %>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr">
                                                911 Report #: 
                                            </td>
                                            <td>
                                                <%--<%# DataBinder.Eval(Container.DataItem, "emergencyReportNum")%>--%>
                                                <asp:Label ID="lblEmergencyReportNum" Text='<%# DataBinder.Eval(Container.DataItem, "emergencyReportNum")%>'  runat="server" />
                                            </td>
                                            <td class="hdr">
                                                Medical Report #: 
                                            </td>
                                            <td>
                                                <%--<%# DataBinder.Eval(Container.DataItem, "medicalReportNum")%>--%>
                                                <asp:Label ID="lblMedicalReportNum" Text='<%# DataBinder.Eval(Container.DataItem, "medicalReportNum")%>'  runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="treatmentContent">
                                    <table>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                Position Title: 
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "positionTitle")%>--%>
                                                <asp:Label ID="lblPositionTitle" Text='<%# DataBinder.Eval(Container.DataItem, "positionTitle")%>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                If not, why: 
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "notWhy")%>--%>
                                                <asp:Label ID="lblNotWhy" Text='<%# DataBinder.Eval(Container.DataItem, "notWhy")%>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr">
                                                Time Called: 
                                            </td>
                                            <td>
                                                <%--<%# DataBinder.Eval(Container.DataItem, "timeCalled")%>--%>
                                                <asp:Label ID="lblTimeCalled" Text='<%# DataBinder.Eval(Container.DataItem, "timeCalled")%>'  runat="server" />
                                            </td>
                                            <td class="hdr">
                                                Arrival Time: 
                                            </td>
                                            <td>
                                                <%--<%# DataBinder.Eval(Container.DataItem, "arrival")%>--%>
                                                <asp:Label ID="lblArrival" Text='<%# DataBinder.Eval(Container.DataItem, "arrival")%>'  runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="hdr" colspan="2">
                                                Transported To:
                                            </td>
                                            <td colspan="2">
                                                <%--<%# DataBinder.Eval(Container.DataItem, "transported")%>--%>
                                                <asp:Label ID="lblTransported" Text='<%# DataBinder.Eval(Container.DataItem, "transported")%>'  runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="description">
                                <p class="hdr">
                                    Description: 
                                </p>
                                <p class="val">
                                    <%--<%# DataBinder.Eval(Container.DataItem, "description")%>--%>
                                    <asp:Label ID="lblDescription" Text='<%# DataBinder.Eval(Container.DataItem, "description")%>'  runat="server" />
                                </p>
                                <table>
                                    <tr>
                                        <td class="trHdr">
                                            Witness Name: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "witnessName")%>--%>
                                            <asp:Label ID="lblWitnessName" Text='<%# DataBinder.Eval(Container.DataItem, "witnessName")%>'  runat="server" />
                                        </td>
                                        <td class="trHdr">
                                            Witness Phone: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "witnessPhone")%>--%>
                                            <asp:Label ID="lblWitnessPhone" Text='<%# DataBinder.Eval(Container.DataItem, "witnessPhone")%>'  runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Victim's Signature: 
                                        </td>
                                        <td class="trVal">
                                            <%--<%# DataBinder.Eval(Container.DataItem, "victimSig")%>--%>
                                            <asp:Label ID="lblVictimSig" Text='<%# DataBinder.Eval(Container.DataItem, "victimSig")%>'  runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <br /><br />
                                <div class="riskMgmtContent">
                                <table>
                                    <tr>
                                        <td colspan="2" class="bold">
                                            For Risk Management Use Only
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Date:
                                        </td>
                                        <td>
                                            datetime.now
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Reviewed By:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtMgrReview" Text=<%# DataBinder.Eval(Container.DataItem, "mgrReviewedBy") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mgrReviewedBy").ToString()) ? DataBinder.Eval(Container.DataItem, "mgrReviewedBy") : "" %>></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Position:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtMgrPosition" Text=<%# DataBinder.Eval(Container.DataItem, "mgrPosition") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mgrPosition").ToString()) ? DataBinder.Eval(Container.DataItem, "mgrPosition") : "" %>></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Was the employee referred to a physician/Student health for a follow-up?:
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtMgrReferred" Text=<%# DataBinder.Eval(Container.DataItem, "mgrReferred") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mgrReferred").ToString()) ? DataBinder.Eval(Container.DataItem, "mgrReferred") : "" %>></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="trHdr">
                                            Follow-up:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox runat="server" ID="txtMgrFollowup" Rows="5" CssClass="full-width" Text=<%# DataBinder.Eval(Container.DataItem, "mgrFollowup") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "mgrFollowup").ToString()) ? DataBinder.Eval(Container.DataItem, "mgrFollowup") : "" %>></asp:TextBox>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            </div>
                            <div class="btnPdf">
                                <asp:Button runat="server" Text="Export as PDF" CssClass="btnClass btnPdf" OnClick="exportPdf_Click"/>
                                <asp:Button runat="server" Text="Save Followup" CssClass="btnClass btnPdf" OnClick="saveFollowup_Click"/>
                            </div>

                        </div>
                        <div class="riskMgmt">
                            
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                    
                </form>

            </div>
        </div>
    </div>
        
</asp:Content>