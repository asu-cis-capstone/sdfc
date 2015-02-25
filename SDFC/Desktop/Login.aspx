<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SDFC.Desktop.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/login.css" />

    <!--Link to google hosted JQuery Library-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <!--Link to JS files -->
    <script type="text/javascript" src="scripts/interaction.js"></script>

    <script type="text/javascript">
        var clicked = true;

        $(document).on('click', '.loginButton', function () {
            if (clicked) {
                $('#main').animate({ top: '600px' }, 500);
            }
            else {
                $('#main').animate({ top: '0px' }, 500);
            }
            clicked = !clicked;
        });
    </script>

    <title></title>
</head>

<body>
    
    <div id="navbar">
            <span>formz</span>
        <div id="navbarContents">
            <ul>
                <li class="loginButton">Login</li>
                <li class="loginButton">Register</li>
            </ul>
        </div>
    </div>



    <div id="main">
        <div id="mainTitleDiv">
            <h1>formz</h1>
            <span>Managing and Submitting Forms, Documents, and Reports has never been easier</span>
            <div class="mainButton">how it works</div>
        </div>
        <div id="mainContent">
            <span>instructions brah</span>
        </div>
    </div>



    <div id="loginDiv"> <%--z index--%>
        <form runat="server">
            <!-- username -->
            <asp:Label runat="server" Text="Username:"></asp:Label><br />
            <asp:TextBox runat="server" ID="tbxUsername" required="required"></asp:TextBox>
			<br /><br />
			
			<!-- password -->
            <asp:Label runat="server" Text="Password:"></asp:Label><br />
            <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" required="required"></asp:TextBox>

            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" />
        </form>
    </div>

    <div id="footer"></div>

</body>
</html>
