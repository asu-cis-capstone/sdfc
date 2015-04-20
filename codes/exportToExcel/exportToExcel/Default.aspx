<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="exportToExcel.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h2 style="color: #808000; font-size: x-large; font-weight: bolder;">Trial for SDFC</h2>
        <br />
    <div>
        <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" CellPadding="6"
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
<Columns>                  
    <asp:BoundField DataField="asuID" HeaderText="ASU ID" ReadOnly="true"/>
    <asp:BoundField DataField="treatmentProvider" HeaderText="Victim"/>
    <asp:BoundField DataField="address" HeaderText="Address"/>
    <asp:BoundField DataField="phone" HeaderText="Phone"/>
    <asp:BoundField DataField="age" HeaderText="Age"/>
    <asp:BoundField DataField="locationName"   HeaderText="Location"/>
    <asp:BoundField DataField="description" HeaderText="Summary"/>
</Columns> 
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Export to Excel" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Export to CSV" OnClick="Button2_Click" />
    </div>
    </form>
</body>
</html>
