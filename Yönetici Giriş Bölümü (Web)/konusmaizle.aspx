<%@ Page Language="C#" AutoEventWireup="true" CodeFile="konusmaizle.aspx.cs" Inherits="uygayarlari" %>

<%@ Register assembly="NickLee.Web.UI" namespace="NickLee.Web.UI" tagprefix="NickLee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <link href="images/adminstil.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
       var musID;
       var opID;
       var oncekiSayi = 0;
       var sonrakiSayi = 0;
       var musteriID;
       var operatorID;
       var kapat = 1;


       setTimeout(konusmalistesi, 3000);


       function sonlandir() {
           kapat = 0;
           document.getElementById("izlemeyidurdur").innerHTML = "&nbsp;&nbsp;&nbsp;İzleme Durduruldu.Pencereyi Kapatabilirsiniz...";
           document.getElementById("izlemeyidurdur").style.color = "green";
       }


       function konusmalistesi() {
           if (kapat==1) {
                 $.ajax({
               type: "POST",
               url: "WebService.asmx/konusmalistesi_yon",
               data: "{}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (msg) {
                   document.getElementById("liste").innerHTML = msg.d;
                   var KisiSayisi = document.getElementById("liste").childNodes.length / 2;
                   document.getElementById("gorusmesayisi").innerHTML = "Şu Anda Görüşmede " + KisiSayisi + " Kişi Vardır.";
                   document.getElementById("renkbilgi").style.display = "block";
                   setTimeout(konusmalistesi, 3000);
               },
               Error: function (error) {
                   alert(error);
               }
           });
           }
          
       }

      
       function kisianaliz(musID, opID, konusmaid) {

           musteriID = musID;
           operatorID = opID;
           document.getElementById("izlenenkonusma").innerHTML = document.getElementById(konusmaid).innerHTML;
           document.getElementById("konusmalar").innerHTML = "<div style='margin-top: 90px; width:70px; height:70px;' align=center><img style='margin-left: 106px;'  src=images/loader.gif /></div>";
           konusmacount();

       }

       function izlenenkonusmalar() {
           if (kapat==1) {
               $.ajax({
               type: "POST",
               url: "WebService.asmx/konusmayaz_yon",
               data: "{musID:'" + musteriID + "',opID:'" + operatorID + "'}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (msg) {

                   document.getElementById("konusmalar").innerHTML = msg.d;
                   oncekiSayi = sonrakiSayi;
                   var div = document.getElementById("konusmalar");
                   div.scrollTop += 500;
                   setTimeout(konusmacount, 3000);
               }
           });
         }
       }
          


                   function konusmacount() {
                       if (kapat==1) {
                           $.ajax({
                           type: "POST",
                           url: "WebService.asmx/konusmacount_yon",
                           data: "{musID:'" + musteriID + "',opID:'" + operatorID + "'}",
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: function (value) {

                               sonrakiSayi = value.d;
                               if (oncekiSayi != sonrakiSayi) {

                                   setTimeout(izlenenkonusmalar, 3000);

                               }
                               else {
                                     setTimeout(konusmacount,3000);
                               }
                              
                           },
                           Error: function (error) {
                               alert(error);
                           }
                       });  
                       }
                      
            }
        
//       function konusmayaz() {

//           $.ajax({
//               type: "POST",
//               url: "WebService.asmx/konusmayaz_yon",
//               data: "{musID:'" + musID + "',opID:'" + opID + "'}",
//               contentType: "application/json; charset=utf-8",
//               dataType: "json",
//               success: function (msg) {
//                   alert(msg.d);
//                   document.getElementById("konusmalar").innerHTML = msg.d;
//                   konusmayaz();
//               },
//               Error: function (error) {
//                   alert(error);
//               }
//           });
//       }

       //yazı:#00C12B
       //


   </script>
   
   
   
    <style type="text/css">
        #form1
        {
            height: 444px;
        }
       
        
        
    </style>
</head>
<body bgcolor="#cccccc">
    <form id="form1" runat="server" style="font-family:Calibri; ">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="izlemeyidurdur" align="center" style="width:525px; height:20px; cursor:pointer; font-size:13px; color:red; font-weight:bold;" onclick="sonlandir();">&nbsp;&nbsp;&nbsp;Bu Pencereyi Kapatmadan Önce Buraya Tıklayarak İzlemeyi Durdurunuz...</div>
  
    <div style="font-size:15px; font-weight:bold;">
    <div style="width: 222px; float:left; background-image:url('images/konusmaizleheader1.png'); height: 40px;">
      <div style=" margin-top:10px; width: 77px; margin-left: 76px;">Görüşmeler</div>
    </div>
    <div style=" width: 304px; float:left; height: 40px;">
       <div style="background-image:url('images/konusmaizleheader2-1.png'); height:40px; float:left; width: 16px; "></div> 
        <div style="background-image:url('images/konusmaizleheader2-2.png'); height:40px; float:left; width: 270px;">
      <div style=" margin-top:10px; width: 108px; margin-left: 80px;">Görüşme Ekranı</div>
        </div> 
        <div style="background-image:url('images/konusmaizleheader2-3.png'); height:40px; float:left; width: 16px;"></div>
    </div>
    </div><br />
    
   

    <br />
    <div id="gorusmesayisi" 
        style="margin-left:10px; font-size:12px; color:#4078D1; font-weight:bold; width: 200px; float:left;">
    </div>

    <div id="renkbilgi" 
        
        style="display:none; margin-left:26px; font-size:12px; color:#4078D1; font-family:Calibri; font-weight:bold; width: 275px; float:left;" 
        align="center">
        <asp:Label ID="Label1" runat="server" ForeColor="Green" Text="Operatör"></asp:Label>
        &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="Müşteri"></asp:Label>
    </div>
   
   <div style=" font-size:12px;">
   
    <div id="liste" style=" width: 202px; float:left; height:350px; background-color:#DDDDDD; margin-left: 10px; overflow:auto;">
      
    </div>
    <div  id="konusmalar" 
        style="width: 282px; float:left; height: 260px; background-color:#DDDDDD; margin-left: 20px; overflow:auto;" >
    
   
        </div>
    </div>
     <div id="izlenenkonusma" style="font-size:15px; font-family:Calibri; width: 282px; margin-left: 233px; margin-top:285px; background-color:#DDDDDD; height: 80px;"></div>
   
   
   
    </form>
</body>
</html>
