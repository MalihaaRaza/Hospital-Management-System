<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DB_Project.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital Management System</title>
</head>
<body style="background-color: transparent; background-image: url('images/background.jpg');
background-repeat: no-repeat; background-size: cover;backdrop-filter: blur(10px);">
    <form id="form1" runat="server">
        <div>
            <center>

            <h1 style = "background-color: firebrick"> Hspital Management System</h1>
    
            <img src="images/logo.png" />

              <br /> <br />
            <asp:LinkButton ID="LinkButton1" runat="server" style="font-size:32px; background-color:firebrick" Text="Patient Sign In" ForeColor="Black" href="patientSignIn.aspx"> </asp:LinkButton>
              <br /> <br />
            <asp:LinkButton ID="LinkButton2" runat="server" style="font-size:32px; background-color:firebrick" Text="Patient Sign Up" ForeColor="Black" href="patientSignUp.aspx"> </asp:LinkButton>
              <br /> <br />
            <asp:LinkButton ID="LinkButton3" runat="server" style="font-size:32px; background-color:firebrick" Text="Doctor Sign In" ForeColor="Black" href="doctorSignIn.aspx"> </asp:LinkButton>
              <br /> <br />
            <asp:LinkButton ID="LinkButton4" runat="server" style="font-size:32px; background-color:firebrick" Text="Doctor Sign Up" ForeColor="Black" href="doctorSignUp.aspx"> </asp:LinkButton>
              <br /> <br />
            
            </center>
        </div>
    </form>
</body>
</html>
