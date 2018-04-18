 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="chatpro.aspx.cs" Inherits="chatpro" %>

<%@ Register Assembly="C1.Web.UI.Controls.2" Namespace="C1.Web.UI.Controls.C1TabStrip"
    TagPrefix="cc3" %>

<%@ Register Assembly="C1.Web.UI.Controls.2" Namespace="C1.Web.UI.Controls.C1Window"
    TagPrefix="cc1" %>

<%@ Register assembly="C1.Web.UI.Controls.2" namespace="C1.Web.UI.Controls.C1TabControl" tagprefix="cc2" %>

<%@ Register assembly="C1.Web.UI.Controls.2" namespace="C1.Web.UI.Controls.C1Accordion" tagprefix="cc4" %>
<%@ Register assembly="C1.Web.UI.Controls.2" namespace="C1.Web.UI.Controls.C1HeaderContentControl" tagprefix="cc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="images/chatprostil.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.2.6.pack.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
            var oncekiSayi = 0;
            var oncekiSayikisiler = 0;
            var oncekiSayikisileroffline = 0;
            var sonrakiSayi = 0;
            var sonrakiSayikisiler = 0;
            var sonrakiSayikisileroffline = 0;
            var ktimer;
            var gelendiv;
            var onofdegisken = 1;
            var app = 0;
            
                


            function onof() {

                if (onofdegisken == 1) {
                    document.getElementById("onofdiv").innerHTML = "";
                    document.getElementById("onofdiv").innerHTML = "<img src='images/icons/offline.png' /> Çevrimdışı";
                    
                    onofdegisken = 0;
                }
                else {
                    document.getElementById("onofdiv").innerHTML = "";
                    document.getElementById("onofdiv").innerHTML = "<img src='images/icons/online.png' /> Çevrimiçi";
                    
                    onofdegisken = 1;
                }

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/onof_yon",
                    data: "{onofdeger:'" + onofdegisken + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {

                        if (msg.d == 1) {
                            //document.getElementById("onofdiv").innerHTML = "<img src='images/icons/online.png' /> Çevrimiçi";
                            onofdegisken = 1;
                            count();
                        }
                        else {
                            //document.getElementById("onofdiv").innerHTML = "<img src='images/icons/offline.png' /> Çevrimdışı";
                            onofdegisken = 0;

                        }

                    },
                    Error: function (error) {
                        alert(error);
                    }
                });




            }



            function divtasi(hangidiv) {
                
                hangidiv = hangidiv.substring(0, hangidiv.length - 1);
                if (dizim2[hangidiv] != hangidiv) {                    
                    gelendiv = document.getElementById(hangidiv);
                    document.getElementById(gelendiv.id + "g2").style.display = "none";
                    document.getElementById("yenidiv").appendChild(gelendiv);
                    dizim2[hangidiv] = hangidiv;
                    var divsc = document.getElementById(hangidiv + "altbolum");
                    divsc.scrollTop += 10000;              
                }
                else {
                    gelendiv = document.getElementById(hangidiv);
                    dizim2[hangidiv] = null;
                    document.getElementById(gelendiv.id + "g2").style.display = "block";
                    document.getElementById("chatalani").appendChild(gelendiv);
                    document.getElementById("v" + hangidiv).focus();
                    var divsc = document.getElementById(hangidiv + "altbolum");
                    divsc.scrollTop += 999999;
                    document.getElementById(hangidiv).childNodes.item(1).childNodes.item(0).style.backgroundImage = "url(images/chatpropencereback.png)"
                }
                
            }


            function divsil(hangidiv) {
                var temp = new Array();
                temp = hangidiv.split('k');
                hangidiv = temp[0];
                
                   document.getElementById(hangidiv).style.display="none";
                
            }



            var dizim2 = new Array();
            var dizim = new Array();
            var mesajlarim = new Array();
            var kisilerdizi = new Array();
            var durumlardizi = new Array();
            var kimeiddizi = new Array();
            var tempkimeid = new Array();

            function divyarat(gelen) {
                var temp = new Array();
                temp = gelen.split('a');
                gelen = temp[0];
                if (dizim[gelen] == gelen) {
                    document.getElementById(gelen).style.display = "block";
                    if (onofdegisken == 0) {
                       onof();  
                    }
                     
                }

                if (dizim[gelen] != gelen) {
                    dizim[gelen] = gelen;

                    var divicerik = " <div id=cerceve" + gelen + " style='float:right; margin-right:2px; border: thin groove #000000;'><div id=" + gelen + "g1 class='pencerebacks'><div id=" + gelen + "w style='height:20px; width:160px; float:left; align=left; cursor:pointer;' onclick='divtasi(this.id)'>" + document.getElementById(gelen + "a").innerHTML + "</div><div id=sagbolum style='height:20px; width:40px; float:left;' align=right><input id=" + gelen + "k type=button class='pencerex' onclick=divsil(this.id) /></div></div><div id=" + gelen + "g2 style='height:250px; width:200px;'><div id=" + gelen + "altbolum style='height:229px; width:200px; overflow:auto; background-color:white; font-size:13px;'></div><input id=v" + gelen + " type=text style='height:15px; width:196px; font-size:12px;' onkeypress='return enterbas(event,this.id,this.value)' /></div></div>";

                     var divler = document.createElement("div");
                     divler.id = gelen;
                     divler.innerHTML = divicerik;
                     document.getElementById("chatalani").appendChild(divler);
                     document.getElementById("v" + gelen).focus();
                     var divsc = document.getElementById(gelen + "altbolum");
                     divsc.scrollTop += 500
                     
                 }
                
            }



            function kisilistesi() {

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/kisilistesi_yon",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        document.getElementById("kisialani").innerHTML = msg.d;
                        if (onofdegisken == 1) {
                            document.getElementById("onofdiv").innerHTML = "<img src='images/icons/online.png' /> Çevrimiçi";
                        }
                        if (app == 0) {
                            setTimeout(count, 2000);
                            app = 1;
                        }

                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }
            
            function yazar(gelen) {

                var temp = new Array();
                var temp1 = new Array();
                var temp2 = new Array();
                var tempgrup = new Array();

                for (var i = 0; i < document.getElementById("kisialani").childNodes.length; i++) {
                    tempgrup[i] = document.getElementById("kisialani").childNodes.item(i).id.split("a");
                    var q = tempgrup[i].toString();
                    q = q.substring(0, q.length - 1);
                       mesajlarim[q] = "";
                    }
                

                for (var i = 0; i < document.getElementById("aaa").childNodes.length; i++) {
                    temp[i] = document.getElementById("aaa").childNodes.item(i).id.split("msj");
                    var mesaj = document.getElementById("aaa").childNodes.item(i).innerHTML;
                    var a = temp[i].toString();
                    a = a.substring(0, a.length - 1);
                    mesajlarim[a] += mesaj;
                }



                for (var i = 0; i < document.getElementById("kisialani").childNodes.length; i++) {

                    var a5 = document.getElementById("kisialani").childNodes.item(i).id;
                    a5 = a5.substring(0, a5.length - 1);
                  
                    if (dizim[a5] == null) {
                        if (mesajlarim[a5].toString().length != 0) {
                           divyarat(a5);
                        
                            if (mesajlarim[a5] != document.getElementById(a5 + "altbolum").innerHTML) {
                                document.getElementById(a5).style.display = "block";
                                document.getElementById(a5 + "altbolum").innerHTML = mesajlarim[a5].toString();
                                
                                document.getElementById(a5 + "altbolum").scrollTop = document.getElementById(a5 + "altbolum").innerHTML.length;                           
                                document.getElementById("v" + a5).focus();
                            }
                        } 
                    } 
                    else {

                        if (mesajlarim[a5] != document.getElementById(a5 + "altbolum").innerHTML) {
                            if (document.getElementById(a5 + "g2").style.display == "none") {
                                document.getElementById(a5).childNodes.item(1).childNodes.item(0).style.backgroundImage = "url(images/chatpropencerebackmsj.png)"
                            }
                            document.getElementById(a5).style.display = "block";
                            document.getElementById(a5 + "altbolum").innerHTML = mesajlarim[a5].toString();
                            
                            document.getElementById(a5 + "altbolum").scrollTop = document.getElementById(a5 + "altbolum").innerHTML.length;
                            document.getElementById("v" + a5).focus();
                        }
                    }

                   
                    
                  }
              
                }


                function kisidurumayar() {

                    for (var i = 0; i < document.getElementById("bbb").childNodes.length; i++) {
                        kisilerdizi[i] = document.getElementById("bbb").childNodes.item(i).id.split("n");
                        var kisino = kisilerdizi[i].toString();
                        kisilerdizi[i] = kisino.substring(0, kisino.length - 1);

                        durumlardizi[i] = document.getElementById("bbb").childNodes.item(i).innerHTML;

                        var durumno = durumlardizi[i].toString().substring(0, 1);

                    }

                    for (var i = 0; i < document.getElementById("bbb").childNodes.length; i++) {

                        var q = kisilerdizi[i].toString();

                        if (dizim[q] != null) {

                            document.getElementById(q + "w").innerHTML = "";

                        }

                    }


                    for (var i = 0; i < document.getElementById("bbb").childNodes.length; i++) {

                        var q = kisilerdizi[i].toString();

                        if (dizim[q] != null) {

                            document.getElementById(q + "w").innerHTML = durumlardizi[i].toString();
                        }

                    }



                }

            
            function al() {

                $.ajax({
                    type: "POST",
                    url: "WebService.asmx/mesaj_yaz_yon",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {

                        oncekiSayi = sonrakiSayi;

                        document.getElementById("aaa").innerHTML = msg.d;

                        yazar(msg.d);
                        
                    },
                    Error: function (error) {
                        alert(error);
                    }
                });
            }



            function enterbas(e,kime,mesaj) {
                if (e.keyCode == 13) {
                    kime = kime.substring(1, kime.length);
                    kime = kime + "s";
                    mesajekle(kime, mesaj);
                    return false;
                }
            }




            function mesajekle(kimeID,mesj) {

                
                if (mesj != "") {
                    var benkimim = document.getElementById("Hidden1").value;
                    var temp5 = new Array();
                    
                temp5[0] = kimeID.split("s");
                kimeID = temp5[0].toString();
                kimeID = kimeID.substring(0, kimeID.length - 1);

                      document.getElementById("v" + kimeID).value="";
                      document.getElementById("v" + kimeID).focus();
                      //document.getElementById(kimeID + "altbolum").innerHTML += "<FONT COLOR=#696969>" + benkimim + ": " + mesj + "</FONT><br>";
                      document.getElementById(kimeID + "altbolum").innerHTML += "<div id=" + kimeID + "msj " + " style='width:180px;' ><FONT COLOR=#696969>" + benkimim + ":<br>&nbsp;&nbsp;" + mesj + "</font></div>";
                      var divsc = document.getElementById(kimeID + "altbolum");
                      divsc.scrollTop += 500;
                      $.ajax({
                          type: "POST",
                          url: "WebService.asmx/mesajekle_yon",
                          data: "{mesaj:'" + mesj + "',kimegidecek:'" + kimeID + "'}",
                          contentType: "application/json; charset=utf-8",
                          dataType: "json",
                          success: function (msg) {
                             
                              
                          }
                      });
                }

            }





                //setTimeout(count, 2000);
                setTimeout(kisilistesi, 1000);
                //setTimeout(online_control, 3000);

                function count() {

                    $.ajax({
                        type: "POST",
                        url: "WebService.asmx/count_al_yon",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (value) {
                            //alert("onceki sayi= " + oncekiSayi + "   sonraki sayi= " + sonrakiSayi);
                            sonrakiSayi = value.d;
                            //alert("onceki sayi= " + oncekiSayi + "   sonraki sayi= " + sonrakiSayi);
                            if (oncekiSayi != sonrakiSayi) {

                               setTimeout(al, 1000);

                            }

                            setTimeout(kisilistesi, 3000);
                            setTimeout(online_control, 3000);
                            
                           if (onofdegisken == 1) {
                                setTimeout(count, 2000);
                           }
                            
                        },
                        Error: function (error) {
                            alert(error);
                        }
                    });
                }


                function online_control() {

                    $.ajax({
                        type: "POST",
                        url: "WebService.asmx/onlinekontrol_yon",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (value) {

                            document.getElementById("bbb").innerHTML = value.d;
                            setTimeout(kisidurumayar, 3000);
                            
                        },
                        Error: function (error) {
                            alert(error);
                        }
                    });
                }



    </script>
    <style type="text/css">
        #kucult
        {
            height: 20px;
        }
        #kapat
        {
            height: 20px;
        }
        #Button1
        {
            height: 27px;
            width: 25px;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width: 700px; height: 300px;">
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <input id="Hidden1" runat="server" type="hidden" />
        <div id="aaa" style="display:none; overflow:auto; height:300px; width:200px;">aaa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            p&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p</div>
        <div id="bbb" style="display:none;">j</div>
        <div id="ccc" style="display:none;">konuşmalar</div>
        <div id="ses"></div>

        <div style=" bottom:50px; height:280px; width: 700px; position:fixed; float:right; right:185px;">
          <div id="chatalani" style="overflow:auto; height:280px; width:700px;"></div>
        </div>
        <div class="chatprosabitdiv">
          <div id="yenidiv" style="overflow:auto; width:700px; height:40px;"></div>
        </div>
       
        <div  style="border: medium groove #000000; float :left;  bottom:0px; right:0px; position:fixed;">
           <div>
           <div id="kisilerbaslik" class="kisilistesiback" >
             <div style="width: 69px; float:left; background-image:url('images/icons/kisilistesi.png'); background-repeat:no-repeat; margin-left: 2px;">&nbsp;&nbsp;&nbsp;&nbsp; 
                 Kişiler</div> 
               <div id="onofdiv" onclick="onof()" style="float:left; width: 100px; margin-right: 2px;" 
                   align="right">.</div>
           </div>
           <div id="kisialani" style="overflow:auto; background-color:White; height: 304px;">d</div>
          </div>
        </div>
        
        <img src="images/smiley/g2.gif" />
        
    </div>
    </form>

</body>
</html>
