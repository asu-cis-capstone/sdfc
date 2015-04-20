<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #description {
            height: 96px;
            width: 662px;
        }
        #address {
            width: 450px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- name -->
        <label for="name">Name:</label>
        <input id="name" name="name" type="text"/><br />

        <!-- address -->
        <label for="address">Address:</label>
        <input id="address" name="address" type="text"/><br />

        <!-- time -->
        <label for="time">Time:</label>
        <input id="time" name="time" type="time" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <!-- phonenumber -->
        <label for="phoneNumber">&nbsp; Phone Number:</label>
        <input id="phoneNumber" name="phoneNumber" type="tel"/><br />

        <!-- age -->
        <label for="age">Age:</label>
        <input id="age" name="age" type="number"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <!-- gender -->
        <label for="Gender">&nbsp;&nbsp; Gender: </label>
        <select id="gender" name="gender">
            <option value="">Choose one</option>
            <option value="male">Male</option>
            <option value="female">Female</option>            
        </select><br />

        <!-- asuID -->
        <label for="asuID">ASU ID:</label>
        <input id="asuID" name="asuID" type="number"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <!-- Date -->
        <label for="date">Date:</label>
        <input id="date" name="date" type="date" />
        <br />
        
        
        <!-- Selection Parts below -->
        <!-- other/special selection -->
        <script type="text/javascript">
            function checkOther(val) {
                var element = document.getElementById('other');
                if (val=='other') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }                
            }
        </script>

        <!-- SpecialActivity -->
        <script type="text/javascript">
            function checkSpecial(val) {
                var element = document.getElementById('special');
                if (val == 'special') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }
            }
        </script>

        <!-- OtherStatus -->
        <script type="text/javascript">
            function checkOtherStatus(val) {
                var element = document.getElementById('otherStatus');
                if (val == 'otherStatus') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }
            }
        </script>

        <!-- OtherLocation -->
        <script type="text/javascript">
            function checkOtherLocation(val) {
                var element = document.getElementById('otherLocation');
                if (val == 'otherLocation') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }
            }
        </script>

        <!-- OtherAction -->
        <script type="text/javascript">
            function checkOtherAction(val) {
                var element = document.getElementById('otherAction');
                if (val == 'otherAction') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }
            }
        </script>

        <!-- OtherType -->
        <script type="text/javascript">
            function checkOtherType(val) {
                var element = document.getElementById('otherType');
                if (val == 'otherType') {
                    element.style.display = 'block';
                }
                else {
                    element.style.display = 'none';
                }
            }
        </script>

        <!-- Status -->
        <label for="Status">Status: </label>
        <select id="status" name="status" onchange="checkOtherStatus(this.value)">
            <option value="">Choose one</option>
            <option value="student">Student</option>
            <option value="faculty">Faculty</option>
            <option value="staff">Staff</option>
            <option value="guest">Guest</option>
            <option value="sdfs">Sun Devil Fitness Staff</option>
            <option value="otherStatus">Other</option>
        </select><br />
        <br />
        <div id="otherStatus" style="display: none;"> If other, please specify: <input type="text" name="otherStatus" /><br /></div>

        <!-- Activity -->
        <label for="Activity">Activity: </label>
        <select id="activity" name="activity" onchange="checkOther(this.value), checkSpecial(this.value);">
            <option value="">Select an activity...</option>
            <option value="Intramurals">Intramurals</option>
            <option value="informalRec">Informal Rec</option>
            <option value="kidcamp">Kid's Camp</option>            
            <option value="sportclubs">Sport Clubs</option>
            <option value="groupfit">Group Fitness</option>
            <option value="swimrental">Swim Rental</option>
            <option value="special">Special Event</option>
            <option value="other">Others...</option>
        </select><br />
        <br />
        <div id="other" style="display: none;"> If others, please specify: <input type="text" name="otherActivity" /><br /></div>
        <div id="special" style="display: none;"> If Special Event, please specify: <input type="text" name="specialEvent" /><br /></div>
                
        <!-- Location -->
        <label for="Location">Location: </label>
        <select id="location" name="location" onchange="checkOtherLocation(this.value)">
            <option value="">Choose one</option>
            <option value="assessmentlab">Assessment Lab</option>
            <option value="field">Field</option>
            <option value="goldgym">Gold Gym</option>
            <option value="greengym">Green Gym</option>
            <option value="indoortrack">Indoor Track</option>
            <option value="locker">Locker Room</option>
            <option value="macgym">Mac Gym</option>
            <option value="maroongym">Maroon Gym</option>
            <option value="outdoortrack">Outdoor Track</option>
            <option value="pe">PE</option>
            <option value="pool">Pool</option>
            <option value="racquetball">Racquetball/Squash Crts</option>
            <option value="smallgym">Small Gym</option>
            <option value="threebay">Three-Bay Gym</option>
            <option value="twobay">Two-Bay Gym</option>
            <option value="loft">Upstairs Loft/Cardio E or W</option>
            <option value="weightroom">Weight Room E or W</option>
            <option value="wellness">Wellness Suite</option>            
            <option value="otherLocation">Other</option>
        </select><br />
        <br />
        <div id="otherLocation" style="display: none;"> If other, please specify: <input type="text" name="otherLocation" /><br /></div>

        <!-- Action Taken-->
        <label for="action">Action Taken: </label>
        <select id="action" name="action" onchange="checkOtherAction(this.value)">
            <option value="">Choose one</option>
            <option value="1">Participant refused aid from SDFC staff</option>
            <option value="2">No treatment was given and participant was returned to activity</option>
            <option value="3">SDFC Staff provided treatment and the participant was returned to activity</option>
            <option value="4">SDFC Staff provided treatment and advised the pariticipant to seek additional medical attention</option>
            <option value="5">SDFC Staff provided treatment and a friend took participant to seek additional medical attention</option>
            <option value="6">SDFC provided treatment and participant was transported to hospital by ambulance</option>
            <option value="otherAction">Other</option>
        </select><br />
        <div id="otherAction" style="display: none;"> If other, please specify: <input type="text" name="otherStatus" /><br /></div>
        
        <!-- injuryType-->
        <label for="type">Suspected Type of Injury: </label>
        <select id="type" name="type" onchange="checkOtherType(this.value)">
            <option value="">Choose one</option>
            <option value="1">Abrasion</option>
            <option value="2">Break</option>
            <option value="3">Bruise</option>
            <option value="4">Concussion</option>
            <option value="5">Dislocation</option>
            <option value="6">Laceration</option>
            <option value="7">Puncture</option>
            <option value="8">Sprain</option>
            <option value="otherType">Other</option>
        </select><br />
        <div id="otherType" style="display: none;"> If other, please specify: <input type="text" name="otherType" /><br /></div>
        
        <!-- Injury Location (NOT COMPLETED)-->
        <fieldset>
            <legend>Location of Injury?</legend>
            <input type="checkbox" name="injuryLocation" value="1" />Abdomen<br />
            <input type="checkbox" name="injuryLocation" value="2" />Ankle<br />
            <input type="checkbox" name="injuryLocation" value="3" />Arm<br />
            <input type="checkbox" name="injuryLocation" value="4" />Back<br />
            <input type="checkbox" name="injuryLocation" value="5" />Chest<br />
        </fieldset>

        <fieldset>
            <legend>Left/Right/Center?</legend>
            <input type="checkbox" name="lrc" value="1" />Left<br />
            <input type="checkbox" name="lrc" value="2" />Right<br />
            <input type="checkbox" name="lrc" value="3" />Center<br />        
        </fieldset>

        <br />

        <br />

        <!-- treatment person -->
        <label for="treatPerson">Name of Person Providing Treatment:</label>
        <input id="treatment" name="treatment" type="text"/><br />

        <!-- position title -->
        <label for="positionTitle">Position Title:</label>
        <input id="position" name="position" type="text"/><br />

        <!-- facility manager called? -->

        <!-- 911 called? -->

        <!-- Time called / Arrival Time -->
        <label for="timeCalled">Time Called:</label>
        <input id="timeCalled" name="timeCalled" type="time" />&nbsp;&nbsp;&nbsp;
        <label for="arrivalTime">Arrival Time:</label>
        <input id="arrivalTime" name="arrivalTime" type="time" /><br />

        <!-- Report Number -->
        <label for="reportNumber">911 Report #:</label>
        <input id="reportNumber" name="reportNumber" type="number"/><br />

        <label for="medicalNumber">Medical Report #:</label>
        <input id="medicalNumber" name="medicalNumber" type="number"/><br />

        <!-- Transported -->
        <label for="transported">Transported to:</label>
        <input id="transported" name="transported" type="text"/><br />
        <br />

        <!-- Description and Witness -->
        <label for="desc">Description and Cause of the Accident/Injury:</label><br />
        <input id="description" name="description" type="text"/><br />

        <label for="witnessName">Witness Name:</label><br />
        <input id="witnessName" name="witnessName" type="text"/><br />

        <label for="witnessPhone">Witness Phone #:</label><br />
        <input id="witnessPhone" name="witnessPhone" type="tel"/><br />

        
        <%--<asp:TextBox ID="UserID" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="Password" runat="server"></asp:TextBox><br />--%>
        <input value="Submit" type="submit"/>
    </div>
    </form>
</body>
</html>
