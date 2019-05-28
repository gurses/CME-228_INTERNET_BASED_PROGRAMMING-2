<html>
<head>
    <meta charset="utf-8">
<title>BAL Mezunları</title>
<link  rel="stylesheet" href="style.css" />
    <link rel="SHORTCUT ICON" href="imgs/site2.png">
</head>
<% 
if request.form("logout")<>"" then
Session.contents.RemoveAll()
end if
%>
<%
msg="" 
if request.querystring("e")="1" then
msg="Diğer Sayfalara Erişmek İçin Giriş yapın"
end if
if request.form("submit")<>"" then 
u=request.form("username")
p=request.form("psw")
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="select * from users where username='"&u&"' and psw='"&p&"'"
set res=conn.Execute(qry)
if not res.eof then
Session("username")=u
response.redirect("index.asp")
else
msg="Hatalı Kullanıcı Adı veya Şifre"
end if
end if
%>

<body>

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
<input type="button" value="GİRİŞ YAP" class="menu_bt" style="background:#111;color: white"/>
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



<div class="login_main" >
<div style="padding-bottom:5px;color:white;font-size:30px;border-bottom:3px solid white;width:185px;margin-left:25px;">
GİRİŞ YAP
</div>
<div style="margin:auto;color:#ccc;font-size:16px;margin-top:30px;">
<form action="login.asp" method="post">
<div style="display:inline-block;width:40%;margin-left:5%;">
Kullanıcı Adı
<br>
<input type="text" class="input_text" name="username"/>
</div>

<div style="display:inline-block;width:40%;margin-left:20px;">
Şifre
<br>
<input type="password" class="input_text" name="psw"/>
</div>

<div style="margin-left:40px;margin-top:20px;">
<% if Session("username")="" then %>
<input class="myButton"type="submit" value="Giriş" name="submit" />
<%else%>
<input class="myButton"type="submit" value="Çıkış" name="logout" />
<%end if%>
</div>
<div class="erorr"><%=msg%></div>
</form>
</div>
</div>

</div>
</div>
</div>

</body>


</html>