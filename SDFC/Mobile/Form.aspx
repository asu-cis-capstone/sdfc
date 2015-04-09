<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="SDFC.Mobile.Form" MasterPageFile="~/Mobile/Mobile.master" %>
<%@ MasterType VirtualPath="~/Mobile/Mobile.master" %>

<asp:Content ID="Form" runat="server" ContentPlaceHolderID="MobileContent">
    <asp:SqlDataSource ID="ActionList" runat="server" SelectCommand="SELECT actionsID, actionName from actions" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ActivityList" runat="server" SelectCommand="SELECT activityID, activityName from activity" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource ID="InjuryLocationList" runat="server" SelectCommand="SELECT injuryLocationID, injuryLocationName FROM injuryLocation" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LocationList" runat="server" SelectCommand="SELECT locationID, locationName FROM location" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource ID="InjuryTypeList" runat="server" SelectCommand="SELECT injuryTypeID, injuryTypeName FROM injuryType" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TreatmentList" runat="server" SelectCommand="SELECT treatmentID, treatmentName FROM treatment" ProviderName="Mysql.Data.MySqlClient"></asp:SqlDataSource>
    <div class="horizontalCenter">
        <div id="formInputs" class="horizontalCenter">
            <asp:Label ID="name" runat="server" ClientIDMode="Static">ASU ID</asp:Label>
            <br />
            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />                                                

            <asp:Label ID="comments" runat="server" ClientIDMode="Static">Description</asp:Label>
            <br />
            <asp:TextBox ID="txtComments" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <br />
            
            <asp:Label ID="victimName" runat="server" ClientIDMode="Static">Victim Name</asp:Label>
            <br />
            <asp:TextBox ID="txtVictimName" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />

            <asp:Label ID="address" runat="server" ClientIDMode="Static">Address</asp:Label>
            <br />
            <asp:TextBox ID="txtAddress" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />

            <asp:Label ID="phone" runat="server" ClientIDMode="Static">Phone</asp:Label>
            <br />
            <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />

            <asp:Label ID="age" runat="server" ClientIDMode="Static">Age</asp:Label>
            <br />
            <asp:TextBox ID="txtAge" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />

            <asp:Label ID="gender" runat="server">Gender</asp:Label>
            <br />
            <asp:RadioButtonList ID="genderSelect" runat="server" CssClass="radio">
                <asp:ListItem ID="genderMale" runat="server" Text="Male"></asp:ListItem>
                <asp:ListItem ID="genderFemale" runat="server" Text="Female"></asp:ListItem>
            </asp:RadioButtonList>
            <%--<asp:RadioButton ID="genderMale" runat="server" Text="Male" GroupName="genderSelection"/>
            <asp:RadioButton ID="genderFemale" runat="server" Text="Female" GroupName="genderSelection"/>--%>
            <br />

            <asp:Label ID="activity" runat="server">Activity</asp:Label>
            <br />
            <asp:DropDownList ID="txtActivity" runat="server" DataSourceID="ActivityList" DataTextField="activityName" DataValueField="activityID"></asp:DropDownList>
            <br />

            <asp:Label ID="location" runat="server">Location</asp:Label>
            <br />
            <asp:DropDownList ID="txtLocation" runat="server" DataSourceID="LocationList" DataTextField="locationName" DataValueField="locationID"></asp:DropDownList>
            <br />


            <asp:Label ID="action" runat="server">Action Taken</asp:Label>
            <br />
            <asp:DropDownList ID="txtAction" runat="server" DataSourceID="ActionList" DataTextField="actionName" DataValueField="actionsID"></asp:DropDownList>
            <br />

            <asp:Label ID="injuryType" runat="server">Suspected Injury Type</asp:Label>
            <br />
            <asp:DropDownList ID="txtInjuryType" runat="server" DataSourceID="InjuryTypeList" DataTextField="injuryTypeName" DataValueField="injuryTypeID"></asp:DropDownList>
            <br />

            <asp:Label ID="injuryLocation" runat="server">Location of Injury</asp:Label>
            <br />
            <asp:DropDownList ID="txtInjuryLocation" runat="server" DataSourceID="InjuryLocationList" DataTextField="injuryLocationName" DataValueField="injuryLocationID"></asp:DropDownList>
            <br />

            <asp:Label ID="treatment" runat="server">Method of Treatment</asp:Label>
            <br />
            <asp:DropDownList ID="txtTreatment" runat="server" DataSourceID="TreatmentList" DataTextField="treatmentName" DataValueField="treatmentID"></asp:DropDownList>
            <br />            

            <asp:Label ID="treator" runat="server">Name of Treator</asp:Label>
            <br />
            <asp:TextBox ID="txtTreator" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="facMan" runat="server" >Fac. Man. Contacted?</asp:Label>
            <br />            
            <asp:RadioButtonList ID="facManSelection" runat="server" CssClass="radio">
                <asp:ListItem ID="facManYes" runat="server" Text="Yes"></asp:ListItem>
                <asp:ListItem ID="facManNo" runat="server" Text="No"></asp:ListItem>
            </asp:RadioButtonList>
            <br />

            <asp:Label ID="contacted" runat="server">911 Contacted?</asp:Label>
            <br />
            <asp:RadioButtonList ID="contactedSelection" runat="server" CssClass="radio">
                <asp:ListItem ID="contactedYes" runat="server" Text="Yes"></asp:ListItem>
                <asp:ListItem ID="contactedNo" runat="server" Text="No"></asp:ListItem>
            </asp:RadioButtonList>
            <br />            

            <asp:Label ID="ReportNum" runat="server">911 Report Number</asp:Label>
            <br />
            <asp:TextBox ID="txtReportNum" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="timeCalled" runat="server">Time Called</asp:Label>
            <br />
            <asp:TextBox ID="txtTimeCalled" runat="server" TextMode="DateTime"></asp:TextBox>
            <br />

            <asp:Label ID="arrivalTime" runat="server">Arrival Time</asp:Label>
            <br />
            <asp:TextBox ID="txtArrivalTime" runat="server" TextMode="DateTime"></asp:TextBox>
            <br />

            <asp:Label ID="transportedTo" runat="server">Transported To</asp:Label>
            <br />
            <asp:TextBox ID="txtTransportedTo" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="MedicalReport" runat="server">Medical Report Number</asp:Label>
            <br />
            <asp:TextBox ID="txtMedicalReport" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="PositionTitles" runat="server">Position Title</asp:Label>
            <br />
            <asp:TextBox ID="txtPositionTitles" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="managerCalled" runat="server">Manager Called</asp:Label>
            <asp:CheckBox ID="txtManagerCalled" runat="server" />
            <br />

            <asp:Label ID="NotWhy" runat="server">If Not, Why?</asp:Label>
            <br />
            <asp:TextBox ID="txtNotWhy" runat="server"></asp:TextBox>
            <br />            
            
            <asp:Label ID="Description" runat="server">Description and cause</asp:Label>
            <br />
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="WitnessName" runat="server">Witness Name</asp:Label>
            <br />
            <asp:TextBox ID="txtWitnessName" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="WitnessPhone" runat="server">Witness Phone Number</asp:Label>
            <br />
            <asp:TextBox ID="txtWitnessPhone" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="victimSignature" runat="server" ClientIDMode="Static">victim signature</asp:Label>
            <br />
            <div class="sig sigWrapper">
                <div class="typed"></div>
                <canvas class="pad" height="200" width="600"></canvas>
                <input type="hidden" id="output" name="output" class="output" runat="server" />
                <%--<asp:HiddenField ID="output" runat="server" />--%>
            </div>

            <asp:Button ID="submitButton" runat="server" ClientIDMode="Static" CssClass="button" Text="submit" OnClick="submitButton_Click"/>
            <div class="clearFix"></div>
        </div>
    </div>
</asp:Content>