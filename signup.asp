<html>
<head>
    <meta charset="utf-8">
<title>BAL Mezunları</title>
<link  rel="stylesheet" href="style.css" />
    <link rel="SHORTCUT ICON" href="imgs/site2.png">
</head>
<%
msg=""
if request.form("submit")<>"" then 
fname=request.form("fname")
lname=request.form("lname")
username=request.form("username")
psw=request.form("psw")
psw_again=request.form("psw_again")
birth_day=request.form("birth_day")
gender=request.form("gender")
hobbies=request.form("hobbies")
country=request.form("country")
email=request.form("email")
if username<>"" and psw<>"" then
if psw=psw_again then
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="select * from users where username='"&username&"'"
set res=conn.Execute(qry)
if res.eof then
conn.close
conn.open
qry="insert into users(fname,lname,username,psw,birth_day,gender,hobbies,email,country)values('"&fname&"','"&lname&"','"&username&"','"&psw&"','"&birth_day&"','"&gender&"','"&hobbies&"','"&email&"','"&country&"')"
conn.Execute(qry)
conn.close
response.redirect("login.asp")
else
msg="Bu Kullanıcı Adı Daha Önce Kullanıldı Lütfen Başka Bir Kullanıcı Adı Alın"
end if
else
msg="Paralolar Eşleşmiyor"
end if
else
msg=""
end if
end if
%>

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
<input type="button" value="KAYDOL" class="menu_bt" style="background:#111;color: white" />
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
<div class="login_main" >
<p style=text-align:center;font-size:30px;text-decoration:underline >KAYDOL</p> 

<div class="erorr"><%=msg%></div>
<form action="signup.asp" method="post">
<div style="margin:auto;color:black;font-size:16px;margin-top:30px;">
<div style="display:inline-block;width:40%;margin-left:36px;margin-bottom:20px">
Adı
<br>
<input type="text" class="input_text" name="fname"/>
</div>

<div style="display:inline-block;width:40%;margin-left:20px;">
Soyadı
<br>
<input type="text" class="input_text" name="lname"/>
</div>

<div style="display:inline-block;width:40%;margin-left:36px;margin-bottom:20px">
Kullanıcı Adı
<br>
<input type="text" class="input_text" name="username"/>
</div>

<div style="display:inline-block;width:40%;margin-left:20px;">
E-mail
<br>
<input type="text" class="input_text" name="email"/>
</div>

<div style="display:inline-block;width:40%;margin-left:36px;margin-bottom:20px">
Şifre
<br>
<input type="password" class="input_text" name="psw"/>
</div>

<div style="display:inline-block;width:40%;margin-left:20px;">
Şifre Tekrar Gir
<br>
<input type="password" class="input_text" name="psw_again"/>
</div>

<div style="display:inline-block;width:40%;margin-left:36px;margin-bottom:20px;">
Doğum Günü
<input type="date" class="input_text" name="birth_day"/>
</div>


<select class="textbox" style="margin-left:21px;width:40%;" name="Ülke">
        <option>ÜLKE</option>
        <option>Türkiye</option>
		<option>Amerika Birleşik Devletleri</option>
		<option>Rusya</option>
        <option>Azerbaycan</option>
		<option>İngiltere</option>
		<option>Litvanya</option>
		<option>OTHER</option>
		
</select>
<p style="font-family:georgian;color:black;font-size:20px;margin-left:35px;"><u>Cinsiyet</u></p>
<input type="radio" name="gender" value="Erkek" style="margin-left:35px;margin-bottom:20px;">
<font color="black">Erkek</font>
<input type="radio" name="gender" value="Kadın">
<font color="black">Kadın</font>
<p style="font-family:georgian;color:black;font-size:20px;margin-left:35px;"><u>Hobiler</u></p>
<input type="checkbox" value="Resim" style="margin-left:35px;margin-bottom:20px;" name="hobbies">
<font color="black">Resim</font>
<input type="checkbox" value="Kitap Okumak" name="hobbies">
<font color="black">Kitap Okumak</font>
<input type="checkbox" value="Gezmek" name="hobbies">
<font color="black">Gezmek</font>

<input type="checkbox" value="Dağcılık" name="hobbies">
<font color="black">Dağcılık</font>

<br>
<div style="margin-left:40px;margin-top:10px;">

<input class="myButton"type="submit" value="Gönder" name="submit" /></br>
</form>
    
<div id="kutu5" style="font-family:sans-serif; font-size: 13px; text-align: center;margin-top: 45px">

<p><font face='Gill Sans' size="4" color="#ffffff">
<b> <br><br>
    Bayraktar Anadolu Lisesi Mezun Platformu, Bayraktar Anadolu Lisesi ortamından yararlanmanı sağlamasının yanı sıra, dünyanın dört bir yanından eski sınıf arkadaşlarınla da  bağlantı kurmanı sağlar.</b></font></p>
        
<div id="kutu3" style="margin-top: 65px">       
<p>© 2019 Gürses Armutcu</p>
</div></div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>