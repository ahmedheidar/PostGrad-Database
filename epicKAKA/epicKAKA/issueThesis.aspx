<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issueThesis.aspx.cs" Inherits="epicKAKA.issueThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h3{
            text-align:center;
        }
        .auto-style1 {
            position: absolute;
            top: 80px;
            left: 30px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 130px;
            left: 30px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 180px;
            left: 30px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 230px;
            left: 30px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 230px;
            left: 190px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 130px;
            left: 190px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 80px;
            left: 190px;
            z-index: 1;
        }
        .auto-style10 {
            position: absolute;
            top: 180px;
            left: 190px;
            z-index: 1;
        }
        .auto-style11 {
            position: absolute;
            top: 314px;
            left: 52px;
            z-index: 1;
            width: 281px;
            right: 1048px;
        }
        .cont{
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class ="cont">

    <form id="form1" runat="server">
        <div>
        </div>
        <h3>--- Issue Thesis Payment ---</h3>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="Thesis Serial No.:"></asp:Label>
        <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Text="Amount:"></asp:Label>
        <asp:Label ID="Label3" runat="server" CssClass="auto-style3" Text="No. of Installments:"></asp:Label>
        <asp:Label ID="Label4" runat="server" CssClass="auto-style4" Text="Fund Percentage:"></asp:Label>
        <asp:TextBox ID="serial" runat="server" CssClass="auto-style9"></asp:TextBox>
        <asp:TextBox ID="amount" runat="server" CssClass="auto-style8"></asp:TextBox>
        <asp:TextBox ID="no" runat="server" CssClass="auto-style10"></asp:TextBox>
        <asp:TextBox ID="fund" runat="server" CssClass="auto-style7"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style11" Text="Issue Payment" OnClick="Button1_Click" />
    </form>

    </div>
    </body>
</html>
