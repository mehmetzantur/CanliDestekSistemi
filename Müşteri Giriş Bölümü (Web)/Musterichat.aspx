<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Musterichat.aspx.cs" Inherits="Musteri_giris" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        var tek=1;
        var cift = 2;

        var sol = "";
        var sag = "";
        var msj = "--- Mesaj Var ---";
        var hiz = 500;
        var degistir = setTimeout("title_degis(0)", hiz);

        function title_degis(deger) {
            if (deger == 1) {
            document.title = sol + msj + sag;
            msj = msj.substring(1, msj.length) + msj.charAt(0);
            degistir = setTimeout("title_degis(1)", hiz);
        }
            if (deger == 0) {
                document.title = "Destek";
                clearTimeout(degistir);
            }
            
        }
        




        function saatgoster(id) {
            var d = new Date();
            var Saat = ("00" + d.getHours()).substr(("00" + d.getHours()).length - 2, 2);
            var Dakika = ("00" + d.getMinutes()).substr(("00" + d.getMinutes()).length - 2, 2);
            var Saniye = ("00" + d.getSeconds()).substr(("00" + d.getSeconds()).length - 2, 2);
            document.getElementById("saat" + id).innerHTML = Saat + ":" + Dakika + ":" + Saniye + "<br><br>";
            
        }
       
       
        function goayrildi() {
            //alert("basliyor");
            $.ajax({
                type: "POST",
                url: "WebService.asmx/ayrildi",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                  //i  alert(msg.d);
                    //alert("msj1");
                },
                Error: function (error) {
                    alert(error);
                }
            });
            //alert("bitti");
        }



       function SetScrollPosition() {
           var div = document.getElementById("divmsj");
           div.scrollTop = 500;
       }

      
       function btn() {
           
           frm = document.forms[0]
           frm.Button2.disabled = true;

       }

      function mesajekle() {
           
           var msj = document.getElementById("TextBox2").value;
           var ben = document.getElementById("HiddenField1").value;
           var musid = document.getElementById("sanalmusid").innerHTML;
         
           if (msj != "") {

               if (musid == document.getElementById("divmsj").lastChild.id) {

                   document.getElementById("divmsj").innerHTML += "<div id=" + musid + ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + msj + "</div>";
                   title_degis(0);
               }
               else {

                   document.getElementById("divmsj").innerHTML += "<br><div class=musbaslikback>&nbsp;&nbsp;" + ben + "</div><div class=mussaatback id=saat" + musid + tek + "></div><div id=" + musid + ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + msj + "</div>";
                   saatgoster(musid + tek);
                   tek++;
                   title_degis(0);
               }
                       
           var div = document.getElementById("divmsj");
           div.scrollTop += 500;
           document.getElementById("TextBox2").value = "";
           document.getElementById("TextBox2").focus();
           
           $.ajax({
               type: "POST",
               url: "WebService.asmx/mesajekle",
               data: "{mesaj:'" + msj + "'}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (msg) {
                   // document.getElementById("divmsj").innerHTML += JSON.stringify(msg.d);
                
                   
               }
           });
        }
           
       }

     
       function al() {

           $.ajax({
               type: "POST",
               url: "WebService.asmx/mesaj_yaz",
               data: "{}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (msg) {
                   frm = document.forms[0]
                   frm.Button2.disabled = false;

                   document.getElementById("sanalmesajlar").innerHTML = msg.d;

                   for (var i = 0; i < document.getElementById("sanalmesajlar").childNodes.length; i++) {

                       var msjid = document.getElementById("sanalmesajlar").childNodes.item(i).childNodes.item(0).id;

                       okunduyap(msjid);
                       var opadi = document.getElementById("sanalmesajlar").childNodes.item(i).title;


                       if (document.getElementById("sanalmesajlar").childNodes.item(i).id == document.getElementById("divmsj").lastChild.title) {

                           document.getElementById("divmsj").innerHTML += document.getElementById("sanalmesajlar").childNodes.item(i).innerHTML;
                           title_degis(1);
                       }
                       else {
                           if (document.getElementById("divmsj").lastChild.title == null) {
                               document.getElementById("divmsj").innerHTML += "<div class=opbaslikback>&nbsp;&nbsp;" + opadi + "</div><div class=opsaatback id=saat" + msjid + cift + ">saat</div>" + document.getElementById("sanalmesajlar").childNodes.item(i).innerHTML;
                               saatgoster(msjid + cift);
                               cift++;
                               cift++;
                               title_degis(1);
                           }
                           else {
                               document.getElementById("divmsj").innerHTML += "<br><div class=opbaslikback>&nbsp;&nbsp;" + opadi + "</div><div class=opsaatback id=saat" + msjid + cift + ">saat</div>" + document.getElementById("sanalmesajlar").childNodes.item(i).innerHTML;
                               saatgoster(msjid + cift);
                               cift++;
                               cift++;
                               title_degis(1);
                           }


                       }


                   }
                   oncekiSayi = sonrakiSayi;
                   clearTimeout(ktimer);
                   clearTimeout(dtimer);
                   clearInterval(altimer);
                   var div = document.getElementById("divmsj");
                   div.scrollTop += 500;
               },
               Error: function (error) {
                   alert(error);
               }
           });
       }


       function okunduyap(MESAJID) {

           $.ajax({
               type: "POST",
               url: "WebService.asmx/okunduyap",
               data: "{MESAJID:'" + MESAJID + "'}",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (msg) {
               

               }
           });

       }


       var gelendurum = 0;
        var oncekiSayi = 0;
        var sonrakiSayi = 0;
        var timer;
        var dtimer;
        var ktimer;
        var altimer;
        $(document).ready(function () {

            setTimeout(onlinekontrol, 1000);
            timer = setTimeout(count, 1000);
            //altimer = window.setInterval(al, 1000);
            ktimer = setTimeout(kartkontrol, 1000);
            dtimer = setTimeout(durumkontrol, 1000);


            function kartkontrol() {
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/depkart",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (gelendurum != 2) {
                            $("#divkart").html(msg.d);
                            //document.getElementById("divkart").innerHTML = JSON.stringify(msg.d);

                            frm = document.forms[0]
                            if (frm.Button2.disabled == true) {
                                setTimeout(durumkontrol, 1000);
                            }

                        }
                        else
                        { }


                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }


            function durumkontrol() {
                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/chatdurum",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (gelendurum != 2) {


                            $("#divdurum").html(msg.d);

                            frm = document.forms[0]
                            if (frm.Button2.disabled == true) {
                                setTimeout(kartkontrol, 1000);
                            }

                        }
                        else
                        { }
                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }


            function onlinekontrol() {

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/onlinedurum",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {

                        gelendurum = msg.d;

                        if (gelendurum == 2) {

                            document.getElementById("divdurum").innerHTML = "<font color=red><b>" + "Sistem Mesajı: Operatörümüz Konuşmayı Sonlandırmıştır...</b></font>" + "<br><hr />";
                            document.getElementById("divkart").innerHTML = " <table class=style22><tr><td >Operatör: </td><td class=kirmizilar>-</td></tr><tr><td>Departman: </td><td class=kirmizilar>-</td></tr><tr><td>Durum: </td><td class=kirmizilar>Sona Erdi</td></tr></table>";
                            frm = document.forms[0]
                            frm.Button2.disabled = true;
                            clearTimeout(timer);
                        }
                        else {
                            setTimeout(count, 1000);
                            setTimeout(onlinekontrol, 1000);

                        }


                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }

            function count() {

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/count_al",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (value) {

                        sonrakiSayi = value.d;
                        if (oncekiSayi != sonrakiSayi) {

                            al();

                        }

                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }
        });
    </script>

    <style type="text/css">
        #form1
        {
            height: 532px;
            width: 500px;
            margin-bottom: 0px;
        }
        .style1
        {
            width: 600px;
            height: 318px;
        }
        .style5
        {
            width: 600px;
            margin-top: 0px;
            height: 70px;
        }
        .style6
        {
        }
        .style7
        {
            width: 490px;
        }
        .style8
        {
            height: 156px;
            width: 496px;
        }
        .style9
        {
            width: 496px;
        }
        .style10
        {
            width: 600px;
            height: 70px;
        }
        .style19
        {
        }
        .style20
        {
            width: 600px;
            height: 70px;
        }
        .style21
        {
            width: 391px;
        }
         .style22
        {
            font-size:12px;
        }
         #divkart
        {
            margin-left: 20px;
            margin-top: 0px;
        }
        .kirmizilar
        {
          color: Red;   
          
        }
        
        .yesiller
        {
          color: Green;   
        }
        
        #Button2
        {
            width: 100px;
            height: 70px;
        }
        .gndr
        {
          background-image:url('images/img/gndrbtn.png');
          color:White;
        }
        </style>
</head>
<body onbeforeunload="goayrildi()" onload="btn()"
    style="height: 512px; width: 499px; margin-right: 0px; margin-bottom: 0px">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
   
         <span id="dummy"></span>


    <asp:HiddenField ID="HiddenField1" runat="server" />

    <table cellpadding="0" cellspacing="0" class="style10">
        <tr>
            <td class="style19" 
                valign="top" 
                style="background-image: url('images/img/banner.png'); background-repeat: no-repeat; background-position: left center">
                <table cellpadding="0" cellspacing="0" class="style20">
                    <tr>
                        <td class="style21">
                            &nbsp;</td>
    
                    
                        <td 
                            valign="top" 
                            style="background-image: url('images/img/opkart.png'); background-repeat: no-repeat; background-position: right">
                            <div id="divkart">
                            
                            </div>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

            <table cellpadding="3" cellspacing="0" class="style1">
                <tr>
                    <td class="style9" valign="top">
                     <div id="divdurum" style="font-size: 14px; font-weight: bold">
                     
                     </div>
                     </td>
                    <td class="style6" valign="top" rowspan="2" 
                        style="background-image: url('images/img/sagreklam.png'); background-repeat: no-repeat; background-position: center top">
                        &nbsp;</td>
                </tr>
                <tr valign="top">
                    <td class="style8" valign="top">
                    <div id="divmsj" runat="server"  
                            style="width: 490px; height: 290px; overflow: auto; font-family:Calibri; font-size: 15px;">

                        

                        </div>
                    </td>
                </tr>
            </table>

    <table cellpadding="0" cellspacing="0" class="style5">
        <tr>
            <td align="left" class="style7" valign="top">
                                <asp:TextBox ID="TextBox2" runat="server" Font-Names="Calibri" 
                                    Height="70px" TextMode="MultiLine" Width="496px" Font-Size="12pt"></asp:TextBox>
                    </td>
            <td valign="top" align="center">
                     
                                <input id="Button2" type="button" onclick="mesajekle()" 
                                    class="gndr" /></td>
        </tr>
    </table>
    <br />
      <div id="sanalmesajlar" style="display:none;">
      
      </div> 
       <div id="sanalmusid" runat="server" style="display:none;"></div>
    </form>
    
</body>
</html>
