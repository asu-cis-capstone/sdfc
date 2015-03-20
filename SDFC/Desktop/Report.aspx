<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/Desktop.master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SDFC.Desktop.WebForm1" %>
<asp:Content ID="ReportHeadContent" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/home.css" />
    <link type="text/css" rel="stylesheet" href="stylesheets/report.css" />
</asp:Content>

<asp:Content ID="ReportContent" ContentPlaceHolderID="DesktopContentPlaceholder" runat="server">
    
    <div id="divHomeContent">
        <asp:Label id="lblReportTitle" runat="server">Reports</asp:Label>
        <div id="reportSearchPanel">
            <label>Start Date:</label>
            <input runat="server" id="txtStartDate" type="text" />
            <label>End Date:</label>
            <input runat="server" id="txtEndDate" type="text" />

        </div>

        <div id="reportResults">
            <button runat="server" id="btnExportCsv" value="exportcsv">Export as .CSV</button>
            <button runat="server" id="btnExportXls" value="exportxls">Export as .XLS</button>

            <form runat="server">
                <asp:GridView runat="server" ID="gvReportResults" AllowPaging="false" AllowSorting="false" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Date" DataField="date" />
                        <asp:BoundField HeaderText="Type" DataField="type" />
                        <asp:BoundField HeaderText="Victim" DataField="victim" />
                        <asp:BoundField HeaderText="Employee" DataField="employee" />
                        <asp:BoundField HeaderText="Location" DataField="date" />
                        <asp:BoundField HeaderText="Summary" DataField="notes" />
                    </Columns>
                </asp:GridView>
            </form>
        </div>
    </div>

</asp:Content>

