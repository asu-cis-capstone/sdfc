<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SDFC.Desktop.WebForm1" %>
<asp:Content ID="ReportHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/home.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/report.css" />
</asp:Content>

<asp:Content ID="ReportContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    
    <div id="divContent">
        <form runat="server">
        <asp:Label id="lblReportTitle" CssClass="titleCss" runat="server">Reports</asp:Label>
        <div id="reportSearchPanel">
            
            <div id="reportSearchPanelContents">
                <div class="searchPanelDiv text-center">
                    <label class="bold">Start Date:</label>
                    <input runat="server" id="txtStartDate" type="date" required="required"/>
                    <br />
                    <label class="bold">End Date:</label>
                    <input runat="server" id="txtEndDate" type="date" required="required"/>
                </div>
                <div class="searchPanelDiv text-center">
                    <label class="bold">Activity:</label>
                    <br />
                    <select multiple="true" id="multActivity" class="text-left full-height" runat="server">
                        <option value="1" runat="server">Intramurals</option>
                        <option runat="server" value="5">Sport Clubs</option>
                        <option runat="server" value="2">Informal Recreation</option>
                        <option runat="server" value="6">Group Fitness</option>
                        <option runat="server" value="3">Kid's Camp</option>
                        <option runat="server" value="7">Swim Rental</option>
                        <option runat="server" value="4">Special Event</option>
                        <option runat="server" value="8">Other</option>
                    </select>
                    <br />
                </div>

                <div class="searchPanelDiv text-center">
                    <label class="bold">Location:</label>
                    <br />
                    <select multiple="true" id="multLocation" class="text-left full-height" runat="server">
                        <option runat="server" value="1">Maroon Gym</option>
                        <option runat="server" value="2">Gold Gym</option>
                        <option runat="server" value="3">Green Gym</option>
                        <option runat="server" value="4">Two-Bay Gym</option>
                        <option runat="server" value="5">Mac Gym</option>
                        <option runat="server" value="6">Three-Bay Gym</option>
                        <option runat="server" value="7">Indoor Track</option>
                        <option runat="server" value="8">Outdoor Track</option>
                        <option runat="server" value="9">Pool</option>
                        <option runat="server" value="10">Locker Room</option>
                        <option runat="server" value="11">West Weight Room</option>
                        <option runat="server" value="11">East Weight Room</option>
                        <option runat="server" value="12">Wellness Suite</option>
                        <option runat="server" value="16">Assessment Lab</option>
                        <option runat="server" value="13">Upstairs Loft West</option>
                        <option runat="server" value="13">Upstairs Loft East</option>
                        <option runat="server" value="14">Raquetball Court</option>
                        <option runat="server" value="15">Small Gym</option>
                        <option runat="server" value="17">Field</option>
                        <option runat="server" value="18">Other</option>
                    </select>
                </div>
                
                <div class="searchPanelDiv text-center">
                    <label class="bold">Sort</label>
                    <br />
                    <ul id="sortparm" class="text-left">
                        <asp:RadioButtonList runat="server" ID="rdoSort">
                            <asp:ListItem Text="Date DESC" Value="datedesc"/>
                            <asp:ListItem Text="Date ASC" Value="dateasc"/>
                            <asp:ListItem Text="Name DESC" Value="namedesc" />
                            <asp:ListItem Text="Name ASC" Value="nameasc" />
                        </asp:RadioButtonList>
                    </ul>
                </div>

                <div class="searchPanelDiv">
                    <asp:Button runat="server" Text="Search" OnClick="report_Click"/>
                </div>
            </div>
        </div>
        
        <div id="btnDiv">
            <button runat="server" id="btnExportCsv" value="exportcsv" class="btnClass rightalign">Export .CSV</button>
            <button runat="server" id="btnExportXls" value="exportxls" class="btnClass rightalign">Export .XLS</button>
        </div>
        
        <div id="reportResults">
            <div id="gvDiv">
                    <asp:GridView runat="server" ID="gvReportResults" AllowPaging="false" AllowSorting="false" AutoGenerateColumns="false" CssClass="gvReportResults" >
                        <Columns>
                            <asp:BoundField HeaderText="ASU ID" DataField="asuID" />
                            <asp:BoundField HeaderText="Victim" DataField="victimName" />
                            <asp:BoundField HeaderText="Address" DataField="address" />
                            <asp:BoundField HeaderText="Phone" DataField="phone" />
                            <asp:BoundField HeaderText="Age" DataField="age" />
                            <asp:BoundField HeaderText="Gender" DataField="genderMale" />
                            <asp:BoundField HeaderText="Activity" DataField="activityName" />
                            <asp:BoundField HeaderText="Location" DataField="locationName" />
                            <asp:BoundField HeaderText="Action" DataField="actionName" />
                            <asp:BoundField HeaderText="Injury Type" DataField="injuryTypeName" />
                            <asp:BoundField HeaderText="Injury Location" DataField="injuryLocationName" />
                            <asp:BoundField HeaderText="Treatment" DataField="treatmentName" />
                            <asp:BoundField HeaderText="Treatment Provider" DataField="treatmentProvider" />
                            <asp:BoundField HeaderText="Manager Called" DataField="managerCalled" />
                            <asp:BoundField HeaderText="Why Not" DataField="notWhy" />
                            <asp:BoundField HeaderText="Emergency Called" DataField="emergencyCalled" />
                            <asp:BoundField HeaderText="Emergency Report#" DataField="emergencyReportNum" />
                            <asp:BoundField HeaderText="Medical Report#" DataField="medicalReportNum" />
                            <asp:BoundField HeaderText="Position" DataField="positionTitle" />
                            <asp:BoundField HeaderText="Time Called" DataField="timeCalled" />
                            <asp:BoundField HeaderText="Arrival" DataField="arrival" />
                            <asp:BoundField HeaderText="Transported" DataField="transported" />
                            <asp:BoundField HeaderText="Description" DataField="description" />
                            <asp:BoundField HeaderText="Witness" DataField="witnessName" />
                            <asp:BoundField HeaderText="Witness Phone" DataField="witnessPhone" />
                        </Columns>
                    </asp:GridView>
            </div>
        </div>

        </form>
    </div>

</asp:Content>

