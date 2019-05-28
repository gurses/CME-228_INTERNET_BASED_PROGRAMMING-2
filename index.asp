<html>
<head>
    <meta charset="utf-8">
<title>BAL Mezunları</title>
<link  rel="stylesheet" href="style.css" />
    <link rel="SHORTCUT ICON" href="imgs/site2.png">
</head>


<body>
<div class="main_div">
<div class="main_div_2">
<div style="padding-top:2px;">

<div id="kutu2"><p style="font-size: 46px; text-align: right;">
<div style="width:0;height:8px;margin:auto;">
</div>

<div style="width:1100px;margin-top:270px;font-size: 16px">
<a class="menu_button" href="index.asp">
<input type="button" value="ANASAYFA" class="menu_bt" style="background:#111;color: white"/>
</a>
<a class="menu_button" href="signup.asp">
<input type="button" value="KAYDOL" class="menu_bt" />
</a>
<a class="menu_button" href="login.asp">
<input type="button" value="GİRİŞ YAP" class="menu_bt"/>
</a>
<a class="menu_button" href="forum.asp">
<input type="button" value="FORUM" class="menu_bt"/>
</a>
<a class="menu_button" href="people.html">
<input type="button" value="KİŞİLER" class="menu_bt"/>
</a>
<a class="menu_button" href="video.html">
<input type="button" value="VIDEO" class="menu_bt"/>
</a>
<a class="menu_button" href="photo.html">
<input type="button" value="FOTOĞRAF" class="menu_bt"/>
</a>
<a class="menu_button" href="contact.asp">
<input type="button" value="KİM NEREDE" class="menu_bt"/>
</a>
<a class="menu_button" href="map.asp">
<input type="button" value="HARİTA" class="menu_bt"/>
</a>

</div></div>
<div style="height: 70px">
</div>



<div class="login_main" style="width:50%" >


<% 
if Session("username")<>"" then
response.write("<div style="color: black;text-align: center" class='welcome'>Hoşgeldin "&Session("username")&"</div>")
end if
%>
<img src="imgs/omar.jpg" width="100%" style="margin-bottom:20px;text-align: center"/>

<a href="https://www.facebook.com/TCBALJD/" target="_blank" style="text-decoration:none;margin-left:280px;">
<img class="logo-fa" style="text-align: center">
<a href="https://twitter.com/search?q=bayraktar%20anadolu%20lisesi&src=typd" target="_blank" style="text-decoration:none;">
<img class="logo-tw" style="text-align: center" >
<a href="sosyalaglar.html" target="_blank" style="text-decoration:none;">
<img class="logo-ins" >


<div id="kutu5" style="font-family:sans-serif; font-size: 13px; text-align: center;">

<p><font face='Gill Sans' size="4" color="#ffffff">
<b> <br><br>
    Bayraktar Anadolu Lisesi Mezun Platformu, Bayraktar Anadolu Lisesi ortamından yararlanmanı sağlamasının yanı sıra, dünyanın dört bir yanından eski sınıf arkadaşlarınla da  bağlantı kurmanı sağlar.</b></font></p>
        
<div id="kutu3" style="margin-top: 65px">       
<p>© 2019 Gürses Armutcu</p>
</div></div>

</div>
</div>
</div>

</body>


</html>