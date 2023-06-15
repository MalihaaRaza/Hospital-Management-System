<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorSignUp.aspx.cs" Inherits="WebApplication2.DoctorSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Sign up</title>
</head>
<body style="background-color: transparent; background-image: url('background.jpg');
 background-repeat: no-repeat; background-size: cover;backdrop-filter: blur(10px);">
    <form id="form1" runat="server">
    <div align="center">
     <h1 style = "background-color: firebrick"> Create An Account</h1>
        <img src="logo.png" />
     <p style="font-size:35px">  &nbsp &nbsp  Doctor Name:
     <asp:TextBox id="tb4" TextMode="multiline"  columns="25" runat="server" /> 
     </p>

     <p style="font-size:36px"> &nbsp &nbsp  Doctor ID: 
     <asp:TextBox id="TextBox1" TextMode="multiline"  columns="25" runat="server" />
     </p>
     <p style="font-size:35px">  &nbsp &nbsp  Age:
     <asp:TextBox id="TextBox2" TextMode="multiline"  columns="25" runat="server" /> 
     </p>
     <p style="font-size:35px"> 
     &nbsp &nbsp  Gender: 
     &nbsp &nbsp 
     <asp:CheckBox ID="CheckBox1" runat="server" />
      Male 
      &nbsp &nbsp 
      <asp:CheckBox ID="CheckBox2" runat="server" />
      Female </p>
      <br/>
      &nbsp &nbsp 
      <asp:Button ID="Button1" runat="server" style="font-size:32px; background-color:firebrick" Text="Create Account" />
    </div>
    </form>
</body>
</html>
