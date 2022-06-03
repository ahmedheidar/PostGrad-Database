<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="epicKAKA.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <style type="text/css">

        .auto-style3 {
            position: absolute;
            top: 100px;
            margin: auto;
            width: 50%;
            z-index: 1;
            text-align:center;
            left: 355px;
        }

        .auto-style4 {
            position: absolute;
            top: 170px;
            margin: auto;
            z-index: 1;
            width: 50%;
            text-align:center;
            left: 355px;
        }

        .auto-style5 {
            position: absolute;
            top: 240px;
            margin: auto;
            z-index: 1;
            width: 50%;
            left: 355px;
            text-align:center;
            
        }
        h3 {
            text-align:center;
        }

        .auto-style6 {
            position: absolute;
            top: 273px;
            left: 652px;
            z-index: 1;
            font-size: large;
        }

        .auto-style7 {
            position: absolute;
            top: 310px;
            margin: auto;
            z-index: 1;
            width: 50%;
            left: 355px;
            text-align:center;
            
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
            <h3>--- Admin ---</h3>

        <asp:Button ID="allSupervisors" runat="server" CssClass="auto-style3" Text="List All Supervisors" OnClick="allSupervisors_Click" />
        <asp:Button ID="allThesis" runat="server" CssClass="auto-style4" Text="List All Thesis" OnClick="allThesis_Click" />
        <asp:Button ID="onGoingThesis" runat="server" CssClass="auto-style5" Text="View Ongoing Thesis Count" onclick="onGoingThesis_Click" />
        <asp:Label ID="Label1" runat="server" CssClass="auto-style6" ></asp:Label>
        <asp:Button ID="IssueThesisP" runat="server" CssClass="auto-style7" Text="Issue A Thesis Payment" onclick="IssueThesisP_Click" />

    </form>
</body>
</html>
