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
<input type="button" value="ANASAYFA" class="menu_bt"/>
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
<input type="button" value="HARİTA" class="menu_bt" style="background:#111;color: white"/>
</a>

</div></div>
<div style="height: 70px">
</div>
  
<div class="login_main" style="width:78%" >


<%
if request.form("reset")<>"" then
Session("w")=""
end if 
max_width=500
max_hieght=375
if Session("w")="" then 
Session("zoom")=1
Session("w")=9655 
Session("h")=5300 
Session("l")=-3240
Session("t")=-625
Session("pix")=100
end if
%>
<%
msg=""
zoom_bt=request.form("zoom_bt")
zoom=request.form("zoom")
sf=request.form("shift_pixel")
if zoom_bt<>""  then 
Session("zoom")=CDbl(zoom)
w=Session("w")
h=Session("h")
Session("w")=9655 * CDbl(zoom)
Session("h")=5300 * CDbl(zoom)
xx=(-Session("l"))/(w-500)
yy=(-Session("t"))/(h-375)
xx=-xx
yy=-yy
Session("l")=xx*(Session("w")-500)
Session("t")=yy*(Session("h")-375)
if IsNumeric(sf) then
Session("pix")=cint(sf)
else
msg="Please enter a numeric value"
end if
end if
%>
<% 
l=request.form("left")
r=request.form("right")
t=request.form("up")
b=request.form("down")
tl=request.form("top_left")
tr=request.form("top_right")
bl=request.form("down_left")
br=request.form("down_right")
if l<>"" then 
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="You can't go left any more"
end if
elseif r<>"" then
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="You can't go right any more"
end if
elseif t<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="You can't go up any more"
end if
elseif b<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="You can't go down any more"
end if
elseif tl<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="You can't go up any more"
end if
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="You can't go left any more"
end if
elseif tr<>"" then
if Session("pix")+Session("t")<0 then
Session("t")=Session("t")+Session("pix")
else
Session("t")=0
msg="You can't go up any more"
end if
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="You can't go right any more"
end if
elseif bl<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="You can't go down any more"
end if
if Session("pix")+Session("l")<0 then
Session("l")=Session("l")+Session("pix")
else
Session("l")=0
msg="You can't go left any more"
end if
elseif br<>"" then
if -(Session("t")-Session("pix"))<(Session("h")-375) then
Session("t")=Session("t")-Session("pix")
else
Session("t")=-(Session("h")-375)
msg="You can't go down any more"
end if
if -(Session("l")-Session("pix"))<(Session("w")-500) then
Session("l")=Session("l")-Session("pix")
else
Session("l")=-(Session("w")-500)
msg="Daha Fazla Sağa Götüremezsin"
end if
end if
%>
<form action="map.asp" method="post" class="zoom_form" style="display:block;text-align:center;">
<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Yakınlaştır :</font>
<select name="zoom" class="textbox" style="width:100px;">
<%  
for x=1 to 10
z=""
if Session("zoom")=x/10 then
z="option selected='selected'"
end if
response.write("<option value='"&x/10&"' "&z&">"&x/10&"</option>")
next
%>
</select><br/><br/>
<div class="people_info1" style="margin-bottom:20px;">
<font class="people_info2">Pikselleri Değiştir:</font>
<input type="text" value="<%=Session("pix")%>" name="shift_pixel" class="textbox" style="width:100px;"/><br/><br/>
<input class="myButton" type="submit" value="Gönder" name="zoom_bt" id="comment_bt"/>
</form>
<div class="erorr"><%=msg%></div>
<div class="cc_map">
<form action="map.asp" method="post">
  <input type="hidden" value="left" name="left" />
  <input type="submit" value="" id="map_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="right" name="right" />
  <input type="submit" value="" id="map_right" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="up" name="up" />
  <input type="submit" value="" id="map_up" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down" name="down" />
  <input type="submit" value="" id="map_down" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="top_left" name="top_left" />
  <input type="submit" value="" id="map_top_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="top_right" name="top_right" />
  <input type="submit" value="" id="map_top_right" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down_left" name="down_left" />
  <input type="submit" value="" id="map_down_left" class="map_bt"/>
</form>
<form action="map.asp" method="post">
  <input type="hidden" value="down_right" name="down_right" />
  <input type="submit" value="" id="map_down_right" class="map_bt"/>
</form>
<div class="container_map">
  <img style="margin-left:<%=Session("l")%>px;margin-top:<%=Session("t")%>px;width:<%=Session("w")%>px;height:<%=Session("h")%>px;" src="http://www.kgm.gov.tr/SiteCollectionImages/KGMimages/Haritalar/turistik.jpg" />
</div>
   
</div>

</div>
</div>
</div>

</body>


</html>