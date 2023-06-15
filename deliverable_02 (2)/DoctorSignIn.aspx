<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorSignIn.aspx.cs" Inherits="WebApplication2.DoctorSignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Sign In</title>
</head>
<body style="background-color: transparent; background-image: url('background.jpg');
background-repeat: no-repeat; background-size: cover;backdrop-filter: blur(10px);">
    <form id="form1" runat="server">
    <div align="center">
       <center>
       <h1 style = "background-color: firebrick"> Doctor Sign In</h1>
       </center>
        <img src="logo.png" />
      <p style="font-size:35px">  &nbsp &nbsp Doctor Name:
    <asp:TextBox id="tb4" TextMode="multiline"  columns="25" runat="server" /> </p>

     <p style="font-size:36px"> &nbsp &nbsp Doctor ID: 
       &nbsp 
      <asp:TextBox id="TextBox1" TextMode="multiline"  columns="25" runat="server" /></p>
       &nbsp &nbsp 
       <asp:CheckBox ID="CheckBox1" runat="server" /> <asp:Label ID="Label1" runat="server" Text="Remember Me"></asp:Label>
       &nbsp &nbsp 
       &nbsp &nbsp  <asp:Label ID="Label2" runat="server" Text="Forgot Passowrd?"></asp:Label>
        <br />
        <br/>
         &nbsp &nbsp 
         <asp:Button ID="Button1" runat="server" style="font-size:32px; background-color:firebrick" Text="Sign In" />   
    
    </div>
    </form>
</body>
</html>
