<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Giris.aspx.cs" Inherits="Giris" %>

<%@ Register assembly="C1.Web.UI.Controls.2" namespace="C1.Web.UI.Controls.C1Window" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #deneme
        {
            width: 519px;
            padding-left:512px;
        }
        .style1
        {
            width: 255px;
        }
        .style6
        {
            width: 98px;
        }
        .style7
        {
            width: 329px;
            height: 55px;
        }
        .style72
        {
            width: 329px;
            height: 35px;
        }
        .style12
        {
            width: 98px;
            height: 15px;
        }
        .style13
        {
            height: 15px;
        }
        .style73
        {
            width: 277px;
        }
        .style74
        {
            width: 98px;
            height: 20px;
        }
        .style75
        {
            height: 20px;
        }
        .style76
        {
            width: 128px;
            height: 15px;
        }
        .style77
        {
            height: 20px;
            width: 128px;
        }
        .style78
        {
            width: 128px;
        }
        .style79
        {
            width: 48px;
            height: 48px;
        }
        .style80
        {
            width: 116px;
        }
        .style81
        {
            width: 7px;
        }
        .style82
        {
            width: 154px;
        }
    </style>
</head>
<body style="background-image: url('images/win7-desktop-bg.jpg');">
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        
        <cc1:C1Window ID="C1Window1" runat="server" AnimationEffectOnShowing="DropInFromTop" 
            AllowMove="False" AllowResize="False" 
            ControlBox="False" Height="266px" VerticalAlign="Middle" X="450" 
            HorizontalAlign="Right" VisualStyle="Vista" 
            OffsetElementId="deneme" ShowOnLoad="True" StartPosition="Manual" 
            AutoExpand="False" ImageHeight="0" ImageWidth="0" Width="375px" 
            AnimationDurationOnShowing="3000" Text="Lütfen Giriş Yapınız" 
            StatusVisible="False" Y="150" 
            ImageUrl="~/images/icons/mini/yoneticigiris.png">
<CaptionButtons>
<CollapseExpandButton Visible="False"></CollapseExpandButton>

<CloseButton Visible="True"></CloseButton>

<Icon Visible="True"></Icon>

<MaximizeButton Visible="True"></MaximizeButton>

<MinimizeButton Visible="True"></MinimizeButton>

<PinButton Visible="False"></PinButton>

<ReloadButton Visible="False"></ReloadButton>
</CaptionButtons>
            <ContentTemplate>
                <table align="center" cellpadding="0" cellspacing="0" class="style7" 
                    style="background-image: url('images/sabitback.png'); background-repeat: repeat-x; background-position: center top">
                    <tr>
                        <td align="center" class="style81">
                            &nbsp;</td>
                        <td align="center" class="style80">
                            <img alt="" class="style79" 
                                src="images/icons/giris.png" />
                        </td>
                        <td align="center" class="style82">
                            <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="Large" 
                                ForeColor="White" Text="Yönetici Girişi"></asp:Label>
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td class="style74">
                        </td>
                        <td class="style77">
                        </td>
                        <td class="style75">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Kullanıcı Adı: "></asp:Label>
                        </td>
                        <td class="style78">
                            <asp:TextBox ID="TextBox1" runat="server" style="margin-top: 0px"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style78">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6">
                            <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="Şifre: "></asp:Label>
                        </td>
                        <td class="style78">
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            </td>
                        <td align="right" class="style76">
                        </td>
                        <td align="right" class="style13">
                            &nbsp;</td>
                    </tr>
                </table>
                <table align="center" cellpadding="0" cellspacing="0" class="style72" 
                    
                    style="background-image: url('images/sabitback.png'); background-repeat: repeat-x; background-position: center center">
                    <tr>
                        <td align="right" class="style73">
                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" 
                                Font-Size="Medium" Font-Underline="False" ForeColor="White" 
                                onclick="LinkButton1_Click">Giriş</asp:LinkButton>
                        </td>
                        <td align="right">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </ContentTemplate>
        </cc1:C1Window>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
       <center>
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>
           <div id="aaa" runat="server" 
                   style="font-size: x-large; margin-top: 150px; font-weight: bold; ">
           
               <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="10000" 
                   ontick="Timer1_Tick">
               </asp:Timer>
               <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Corbel" 
                   ForeColor="#333333"></asp:Label>
               <br />
               <img alt="" class="style76" 
                   src="images/icons/loader.gif" />
           
           </div>
           </ContentTemplate>
           </asp:UpdatePanel>
       
       
       </center>
    </div>
    </form>
</body>
</html>
