<%@ Page Language="C#" AutoEventWireup="true" CodeFile="musterigiris.aspx.cs" Inherits="Musteri_giris" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="MSCaptcha" namespace="MSCaptcha" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
         

         function chat_go() {
           
             var a = document.getElementById("HiddenField1").value;
            
            
             if (a == "1") {

                 //window.open("Musterichat.aspx", "yenipencere2", "width=625,height=530,resizable=0");
                 // window.parent.close();
             }
             else {
                 setTimeout(chat_go, 1000);
             }
         }
         function git() {
             
         }
     </script>
   
    <style type="text/css">
        #form1
        {
            height: 400px;
            width: 500px;
        }
        .style1
        {
            width: 600px;
            height: 360px;
        }
        .style6
        {
            width: 783px;
            height: 21px;
        }
        .style9
        {
            width: 783px;
            height: 24px;
        }
        .style11
        {
            width: 783px;
            height: 182px;
        }
        .style13
        {
            width: 330px;
        }
        .style15
        {
            width: 806px;
            height: 24px;
        }
        .style16
        {
            width: 806px;
            height: 21px;
        }
        .style17
        {
            width: 806px;
            height: 182px;
        }
        .style18
        {
            height: 70px;
        }
        .style19
        {
            width: 30px;
            height: 24px;
        }
        .style20
        {
            width: 30px;
            height: 21px;
        }
        .style21
        {
            width: 30px;
            height: 182px;
        }
        .style24
        {
            width: 600px;
            height: 112px;
        }
        .style26
        {
            height: 75px;
        }
        .style28
        {
        }
        .style29
        {
            width: 190px;
        }
    </style>
   
</head>
<body onload="chat_go();" style="width: 609px; height: 470px; margin-right: 0px; margin-bottom: 0px">
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
    <asp:Panel ID="Panel2" runat="server">
        <table class="style1">
            <tr>
                <td align="center" class="style18" colspan="3" 
                
                
                    style="background-image: url('images/img/banner.png'); background-repeat: no-repeat; background-position: left">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    
                    
                </td>
            </tr>
            <tr>
                <td align="right" class="style19" valign="baseline">
                    &nbsp;</td>
                <td align="right" class="style9" valign="baseline">
                    <asp:Label ID="Label1" runat="server" Text="İsim Soyisim / Şirket Adı:"></asp:Label>
                </td>
                <td class="style15" valign="baseline">
                    <asp:TextBox ID="TextBox1" runat="server" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style20" valign="baseline">
                    &nbsp;</td>
                <td align="right" class="style6" valign="baseline">
                    <asp:Label ID="Label5" runat="server" Text="E-Mail Adresiniz:"></asp:Label>
                </td>
                <td class="style16" valign="baseline">
                    <asp:TextBox ID="TextBox3" runat="server" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style20" valign="baseline">
                    &nbsp;</td>
                <td align="right" class="style6" valign="baseline">
                    <asp:Label ID="Label3" runat="server" Text="Departman Seçiniz."></asp:Label>
                </td>
                <td class="style16" valign="baseline">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="DEPADI" DataValueField="DEPID" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="325px">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td align="right" class="style21" valign="top">
                    &nbsp;</td>
                <td align="right" class="style11" valign="top">
                    <asp:Label ID="Label2" runat="server" Text="Mesajınız:"></asp:Label>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:onlineDBConnectionString2 %>" 
                    
                    
                        SelectCommand="SELECT [DEPID], [DEPADI] FROM devonline.DEPARTMAN ORDER BY [DEPADI]">
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="style17" valign="top">
                    <asp:TextBox ID="TextBox2" runat="server" Height="180px" TextMode="MultiLine" 
                    Width="320px"></asp:TextBox>
                    <table class="style13">
                        <tr valign="top">
                            <td align="left" class="style28" colspan="2">
                                <asp:Label ID="Label7" runat="server" 
                                    Text="Aşağıdaki Karakterleri Yanındaki Kutucuğa Giriniz..."></asp:Label>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td align="left" class="style29">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <cc1:CaptchaControl ID="CaptchaControl1" runat="server" 
                                            CaptchaBackgroundNoise="Medium" CaptchaHeight="35" CaptchaMinTimeout="1" 
                                            Height="34px" Width="160px" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Font-Size="X-Large" Height="31px" 
                                    Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style28" colspan="2">
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/images/img/konusmayabaslabtn.png" onclick="ImageButton1_Click" />
                                <br />
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    ImageUrl="~/images/img/mesajbirakbtn.png" onclick="ImageButton2_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style28" colspan="2">
                                <asp:Label ID="Label8" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" Height="116px">
                    <table cellpadding="0" cellspacing="0" class="style24">
                        <tr>
                            <td class="style26" 
                                style="background-image: url('images/img/banner.png'); background-repeat: no-repeat; background-position: left">
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="13pt" 
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
               
    </form>
</body>
</html>
