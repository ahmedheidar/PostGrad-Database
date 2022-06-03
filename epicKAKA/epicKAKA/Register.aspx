<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="epicKAKA.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 101px;
            left: 129px;
            z-index: 1;
            width: 162px;
            right: 1551px;
        }
        .auto-style2 {
            position: absolute;
            top: 151px;
            left: 126px;
            z-index: 1;
            width: 161px;
            bottom: 354px;
        }
        .auto-style3 {
            position: absolute;
            top: 196px;
            left: 125px;
            z-index: 1;
            width: 162px;
            height: 24px;
        }
        .auto-style4 {
            position: absolute;
            top: 246px;
            left: 124px;
            z-index: 1;
            width: 165px;
        }
        .auto-style5 {
            position: absolute;
            top: 284px;
            left: 121px;
            z-index: 1;
            width: 206px;
        }
        .auto-style6 {
            position: absolute;
            top: 327px;
            left: 118px;
            z-index: 1;
            width: 207px;
            height: 40px;
            right: 846px;
        }
        .auto-style7 {
            position: absolute;
            top: 378px;
            left: 16px;
            right: 771px;
            z-index: 1;
            height: 26px;
        }
        .auto-style8 {
            position: absolute;
            top: 477px;
            left: 119px;
        }
        .auto-style9 {
            position: absolute;
            top: 521px;
            left: 120px;
        }
        .auto-style10 {
            position: absolute;
            top: 565px;
            left: 119px;
        }
        .auto-style11 {
            position: absolute;
            top: 609px;
            left: 119px;
        }
        .auto-style12 {
            position: absolute;
            top: 653px;
            left: 123px;
        }
        .auto-style13 {
            position: absolute;
            top: 373px;
            left: 400px;
            z-index: 1;
            height: 33px;
        }
        .auto-style14 {
            position: absolute;
            top: 653px;
            left: 401px;
            z-index: 1;
            width: 83px;
        }
        .auto-style15 {
            position: absolute;
            top: 917px;
            left: 10px;
        }
        .auto-style16 {
            position: absolute;
            top: 741px;
            left: 127px;
        }
        .auto-style17 {
            position: absolute;
            top: 785px;
            left: 124px;
        }
        .auto-style18 {
            position: absolute;
            top: 829px;
            left: 128px;
        }
        .auto-style19 {
            position: absolute;
            top: 873px;
            left: 127px;
        }
        .auto-style20 {
            position: absolute;
            top: 917px;
            left: 400px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Register:<br />
            <br />
            Register as a student:<br />
            <br />
            First Name:&nbsp;&nbsp;
            <asp:TextBox ID="firstname1" runat="server" CssClass="auto-style1"  ></asp:TextBox>
            <br />
            <br />
            Last Name:&nbsp;&nbsp;
            <asp:TextBox ID="lastname1" runat="server" CssClass="auto-style2"  ></asp:TextBox>
            <br />
            <br />
            Password:&nbsp;&nbsp;
            <asp:TextBox ID="password1" runat="server" CssClass="auto-style3"  ></asp:TextBox>
            <br />
            <br />
            Faculty:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="faculty1" runat="server" CssClass="auto-style4"  ></asp:TextBox>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email1" runat="server" CssClass="auto-style5"  ></asp:TextBox>
            <br />
            <br />
            Address:
            <asp:TextBox ID="address1" runat="server" CssClass="auto-style6"  ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:CheckBox ID="GUCIAN" runat="server" CssClass="auto-style7" Text="Check Only if You're a GUCian Student"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="register1" runat="server" OnClick="signupStudent" CssClass="auto-style13" Text="Register" />
            <br />
            <br />
            Register as a supervisor:<br />
            <br />
            First Name:&nbsp;&nbsp;
            <asp:TextBox ID="firstname2" runat="server" CssClass="auto-style8" style="z-index: 1"  ></asp:TextBox>
            <br />
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="lastname2" runat="server" CssClass="auto-style9" style="z-index: 1"  ></asp:TextBox>
            <br />
            <br />
            Password:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="password2" runat="server" CssClass="auto-style10" style="z-index: 1"  ></asp:TextBox>
            <br />
            <br />
            Faculty:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="faculty2" runat="server" CssClass="auto-style11" style="z-index: 1"  ></asp:TextBox>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email2" runat="server" CssClass="auto-style12" style="z-index: 1" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="register2" runat="server" OnClick="signupSupervisor" CssClass="auto-style14" Text="Register" />
            <br />
            <br />
            Register as an examiner:<br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="name3" runat="server" CssClass="auto-style16" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="password3" runat="server" CssClass="auto-style17" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email3" runat="server" CssClass="auto-style18" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            FieldOfWork:
            <asp:TextBox ID="fieldOfWork3" runat="server" CssClass="auto-style19" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="Egyptian" runat="server" CssClass="auto-style15" Text="Check Only if You're an Egyptian" style="z-index: 1" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="register3" runat="server" CssClass="auto-style20" OnClick="signupExaminer" style="z-index: 1" Text="Register" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
