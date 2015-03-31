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

    <title>LOGIN</title>
</head>

<body id="container">
    
    <div id="navbar">
        <div id="navbarContents">
            <ul>
                <li class="brand">SDFC Forms Management</li>
                <li class="loginButton">Register</li>
                <li class="loginButton">Login</li>
                
            </ul>
        </div>
    </div>

    <div id="main" runat="server">
        <div id="mainTitleDiv">
            <h1>Data Reporting and Management Application</h1>
            <span class="mainText">Managing and Submitting Forms, Documents, and Reports has never been easier!</span>
            <br /><br />

            <a href="#instructions">Learn More...</a>
        </div>
        <div id="mainContent">
            <h1><a id="instructions">Instructions Brah</a></h1>
        </div>

        <div id="footer">
            <h1>
                &copy;2015, SDFC
            </h1>
    </div>

    </div>

    <div id="loginDiv"> <%--z index--%>
        <form id="login" runat="server">
            <!-- username -->
            <br />
            <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox runat="server" ID="tbxUsername" required="required"></asp:TextBox>
			<br /><br />
			
			<!-- password -->
            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" required="required"></asp:TextBox>
            <br /><br />

            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Login"/>
            <br /><br />

            <asp:Label ID="lblLoginError" runat="server" Visible="false">Invalid Username or Password</asp:Label>
        </form>
    </div>

    

    
</body>
</html>
