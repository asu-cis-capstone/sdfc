<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SDFC.Desktop.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="stylesheets/login.css" />

    <!--Link to google hosted JQuery Library-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <!--Link to JS files -->
    <script type="text/javascript" src="scripts/interaction.js"></script>

    <script type="text/javascript">
        var clicked = true;

        $(document).on('click', '.loginButton', function () {
            if (clicked) {
                $('#main').animate({ top: '375px' }, 500);
            }
            else {
                $('#main').animate({ top: '100px' }, 500);
            }
            clicked = !clicked;
        });
    </script>

    <title>SDFC LOGIN</title>
</head>

<body>
<section class="container">
    <div class="login">
      <h1>Login to SDFC Forms</h1>
      <form runat="server" >
                <asp:Label ID="lblUser" runat="server" Text="Username"></asp:Label>
                <asp:TextBox runat="server" ID="tbxUsername" required="required"></asp:TextBox>
			
			    <!-- password -->
                <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" required="required"></asp:TextBox>

                <asp:Label ID="lblLoginError" runat="server" Visible="false">Invalid Username or Password</asp:Label>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me"/>
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><asp:Button runat="server" ID="Button2" OnClick="btnLogin_Click" Text="Login"/></p>
      </form>
    </div>
  </section>
    <section>
    <p class="footer">
      &copy; 2015, Sun Devil Fitness Complex
        </p>
  </section>
  

</body>

</html>


