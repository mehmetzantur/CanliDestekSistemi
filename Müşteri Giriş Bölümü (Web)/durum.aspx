<%@ Page Language="C#" AutoEventWireup="true" CodeFile="durum.aspx.cs" Inherits="durum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
     <script language="javascript" type="text/javascript">

         function musteri_go() {
           
             window.open("musterigiris.aspx",
                         "yenipencere", "width=610,height=540");
         }

         kontrol();

         function kontrol() {
             $.ajax({
                 type: "POST",
                 url: "WebService.asmx/onofdurum_yon",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (msg) {
                     if (msg.d == 1) {
                        
                         document.getElementById("divkontrol").style.backgroundImage = "url(images/on.png)";
                     }
                     else {
                      
                         document.getElementById("divkontrol").style.backgroundImage = "url(images/off.png)";
                     }
                 },
                 Error: function (error) {
                     alert(error);
                 }
             });
         }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="divkontrol" style="width:105px; height:105px; background-repeat:no-repeat; cursor:pointer;" onclick="musteri_go();">
    </div>
    </form>
</body>
</html>
