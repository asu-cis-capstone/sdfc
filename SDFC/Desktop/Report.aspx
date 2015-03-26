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
                <label>Start Date:</label>
                <input runat="server" id="txtStartDate" type="text" />
                <label>End Date:</label>
                <input runat="server" id="txtEndDate" type="text" />
            </div>
        </div>

        <div id="reportResults">
            <button runat="server" id="btnExportCsv" value="exportcsv" class="btnClass rightalign">Export .CSV</button>
            <button runat="server" id="btnExportXls" value="exportxls" class="btnClass rightalign">Export .XLS</button>

            <form runat="server" id="gvForm">
                <asp:GridView runat="server" ID="gvReportResults" AllowPaging="false" AllowSorting="false" AutoGenerateColumns="false">
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

</asp:Content>

