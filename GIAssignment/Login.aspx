<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GIAssignment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login/SignUp</title>
    <style>
        #divMain {
            background-color: #cccccc;
            width: 30%;
            height: 315px;
            text-align: center;
            font-family: Arial;
        }

        table {
            height: 250px;
        }

        #divlogin {
            background-color: #e6e6e6;
        }

        td {
            text-align: left;
            padding: 2px;
        }

        divMain, divlogin, td {
            font-family: Arial;
            font-size: small;
        }

        .button {
            background-color: #cccccc;
            color: black;
            border: 2px solid #e6e6e6;
            padding: 6px 12px;
            text-align: center;
            display: inline-block;
            cursor: pointer;
        }

            .button:hover {
                background-color: black;
                color: white;
            }

        .linkbutton:link, .linkbutton:visited {
            background-color: #cccccc;
            color: black;
            border: 2px solid #e6e6e6;
            padding: 6px 14px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-family: Arial;
        }

        .linkbutton:hover, .linkbutton:active {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divMain" runat="server">
            <asp:Label ID="lblDisplay" runat="server" Text="GIAssignment Sign-In/ Sign-up"></asp:Label>
            <br />
            <br />

            <div id="divlogin" runat="server">
                <table>
                    <tr id="trddloptions" runat="server">
                        <td>
                            <asp:Label ID="lblSelectoption" runat="server" Text="Select Option"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnklogin" runat="server" OnClick="lnklogin_Click" class="linkbutton">Login</asp:LinkButton>

                            &nbsp;/
                            <asp:LinkButton ID="lnksignup" runat="server" OnClick="lnksignup_Click" class="linkbutton">Sign Up</asp:LinkButton>

                        </td>

                    </tr>
                    <tr id="trphone" runat="server">
                        <td>
                            <asp:Label ID="lblCellNo" runat="server" Text="Your Mobile Number"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCellNo" runat="server" Height="20px"></asp:TextBox>
                            &nbsp;<br />
                            &quot;Format +91xxxxxxxxxx&quot;</td>
                    </tr>
                    <tr id="trsendotp" runat="server">
                        <td></td>
                        <td>
                            <%--text changes after requesting OTP--%>
                            <asp:Button ID="btngetOTP" runat="server" Text="Get OTP" OnClick="btngetOTP_Click" class="button" />
                            &nbsp;<asp:Label ID="lblOTPmessage1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="trreceiveotp" runat="server">
                        <td>
                            <asp:Label ID="lblDisplayOTP" runat="server" Text="Enter OTP"></asp:Label>


                        </td>
                        <td>
                            <asp:TextBox ID="txtOTP" runat="server" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="trverifyotp" runat="server">
                        <td>
                            
                        </td>
                        <td>

                            <asp:Button ID="btnOTPVerify" runat="server" Text="Verify OTP" OnClick="btnOTPVerify_Click" class="button" />

                            &nbsp;
                            <asp:Label ID="lblOTPmessage" runat="server" Text=""></asp:Label>

                        </td>
                    </tr>
                    <tr id="tremailid" runat="server">
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Enter your E-Mail:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="trname" runat="server">
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="Enter your Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr id="trregister" runat="server">
                        <td></td>
                        <td>

                            <asp:Button ID="btnregister" runat="server" Text="Register Me" OnClick="btnregister_Click" class="button" />

                        </td>
                    </tr>
                    <tr id="trdiaplaymessage" runat="server">
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
