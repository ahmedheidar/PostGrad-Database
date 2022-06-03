<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGrade.aspx.cs" Inherits="epicKAKA.AddGrade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 499px">
    <form id="form1" runat="server">
        <div>
            Thesis Serial No.:&nbsp;
            <asp:TextBox ID="SerialNo" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            Date:&nbsp;
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            <br />
            <br />
            Grade:&nbsp;
            <asp:TextBox ID="Grade" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Submit" Height="32px" OnClick="Button1_Click" Width="75px" />
        </div>
    </form>
</body>
</html>
