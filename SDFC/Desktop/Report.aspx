<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SDFC.Desktop.WebForm1" %>
<asp:Content ID="ReportHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/home.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/report.css" />
</asp:Content>

<asp:Content ID="ReportContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    
    <div id="divContent">
        <asp:Label id="lblReportTitle" CssClass="titleCss" runat="server">Reports</asp:Label>
        <div id="reportSearchPanel">
            <div id="reportSearchPanelContents">
                <div class="searchPanelDiv">
                    <label>Start Date:</label>
                    <input runat="server" id="txtStartDate" type="date"/>
                    <br />
                    <label>End Date:</label>
                    <input runat="server" id="txtEndDate" type="date"/>
                </div>
                <div class="searchPanelDiv">
                    <label>Activity:</label>
                    <select multiple="multiple" id="multActivity">
                        <option id="Option1" runat="server" value="option1">Intramurals</option>
                        <option id="Option2" runat="server" value="option1">Sport Clubs</option>
                        <option id="Option3" runat="server" value="option1">Informal Recreation</option>
                        <option id="Option4" runat="server" value="option1">Group Fitness</option>
                        <option id="Option5" runat="server" value="option1">Kid's Camp</option>
                        <option id="Option6" runat="server" value="option1">Swim Rental</option>
                        <option id="Option7" runat="server" value="option1">Special Event</option>
                        <option id="Option8" runat="server" value="option1">Other</option>
                    </select>

                    <br />
                    
                    <label>Location:</label>
                    <select multiple="multiple" id="multLocation">
                        <option id="Option9" runat="server" value="option1">Maroon Gym</option>
                        <option id="Option10" runat="server" value="option1">Gold Gym</option>
                        <option id="Option11" runat="server" value="option1">Green Gym</option>
                        <option id="Option12" runat="server" value="option1">Two-Bay Gym</option>
                        <option id="Option13" runat="server" value="option1">Mac Gym</option>
                        <option id="Option14" runat="server" value="option1">Three-Bay Gym</option>
                        <option id="Option15" runat="server" value="option1">Indoor Track</option>
                        <option id="Option16" runat="server" value="option1">Outdoor Track</option>
                        <option id="Option17" runat="server" value="option1">Pool</option>
                        <option id="Option18" runat="server" value="option1">Locker Room</option>
                        <option id="Option19" runat="server" value="option1">West Weight Room</option>
                        <option id="Option20" runat="server" value="option1">East Weight Room</option>
                        <option id="Option21" runat="server" value="option1">Wellness Suite</option>
                        <option id="Option22" runat="server" value="option1">Assessment Lab</option>
                        <option id="Option23" runat="server" value="option1">Upstairs Loft West</option>
                        <option id="Option24" runat="server" value="option1">Upstairs Loft East</option>
                        <option id="Option25" runat="server" value="option1">Raquetball Court</option>
                        <option id="Option26" runat="server" value="option1">Small Gym</option>
                        <option id="Option27" runat="server" value="option1">Field</option>
                        <option id="Option28" runat="server" value="option1">Other</option>
                    </select>
                </div>
                <div class="searchPanelDiv">
                    <label>Sort</label>
                    <ul>
                        <li><input type="radio" value="dateasc" /></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div id="btnDiv">
            <button runat="server" id="btnExportCsv" value="exportcsv" class="btnClass rightalign">Export .CSV</button>
            <button runat="server" id="btnExportXls" value="exportxls" class="btnClass rightalign">Export .XLS</button>
        </div>

        <div id="reportResults">
            <div id="gvDiv">
                <form runat="server" id="gvForm">
                    <asp:GridView runat="server" ID="gvReportResults" AllowPaging="false" AllowSorting="false" AutoGenerateColumns="false" CssClass="gvReportResults">
                        <Columns>
                            <asp:BoundField HeaderText="ASU ID" DataField="asuID" />
                            <asp:BoundField HeaderText="Victim" DataField="treatmentProvider" />
                            <asp:BoundField HeaderText="Address" DataField="address" />
                            <asp:BoundField HeaderText="Phone" DataField="phone" />
                            <asp:BoundField HeaderText="Age" DataField="age" />
                            <asp:BoundField HeaderText="Location" DataField="locationName" />
                            <asp:BoundField HeaderText="Summary" DataField="description" />
                        </Columns>
                    </asp:GridView>
                </form>
            </div>
        </div>

    </div>

</asp:Content>

