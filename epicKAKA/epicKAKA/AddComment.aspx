<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddComment.aspx.cs" Inherits="epicKAKA.AddComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 834px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">

            <br />
            Thesis Serial No.:&nbsp;
            <asp:TextBox ID="SerialNo" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            Date:&nbsp;
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <br />
            Comment:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Comment" runat="server" Height="91px" Width="372px"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Height="29px" Text="Submit" Width="90px" OnClick="Button1_Click" />

        </div>
    </form>
</body>
</html>
