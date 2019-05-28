<html>
<head>
    <meta charset="utf-8">
<title>BAL Mezunları</title>
<link  rel="stylesheet" href="style.css" />
    <link rel="SHORTCUT ICON" href="imgs/site2.png">
</head>
<% 
if Session("username")="" then
response.redirect("login.asp?e=1")

end if


%>
<% 
user_id=request.querystring("id")
if user_id="2" then
name="ONUR"
lastname="BOYNUEĞRİ"
gender="ERKEK"
birth_day="25/06/1995"
country="TÜRKİYE"
email="onurba34@gmail.com"
img_url="imgs/onur.jpg"
elseif user_id="3" then
name="MUHAMMET"
lastname="TOPCU"
gender="ERKEK"
birth_day="11/25/1997"
country="TÜRKİYE"
email="mtopcu06@gmail.com"
img_url="imgs/mami.jpg"
elseif user_id="4" then
name="MURAT"
lastname="KOCAOĞLU"
gender="ERKEK"
birth_day="22/12/1997"
country="TÜRKİYE"
email="muratkocaohlu@gmail.com"
img_url="imgs/murat.jpg"
elseif user_id="1" then
name="HÜSEYİN"
lastname="ÇAPA"
gender="ERKEK"
birth_day="15/05/1997"
country="TÜRKİYE"
email="huseyin.capa27@gmail.com"
img_url="imgs/capa.jpg"
end if
%>
<%
mgs=""
if Session("username")="" then
response.redirect("index.asp?hata=1")
end if
com=request.form("comment")
com=Trim(com)
if request.form("send")<>""  then
if com<>"" then
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="insert into comment(username,comment,comment_date,user_id)values('"&Session("username")&"','"&com&"','"&now&"',"&Cint(user_id)&")"
conn.execute(qry)
conn.close
else
msg="Lütfen Boş Yorum Yapma"
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
<input type="button" value="KAYDOL" class="menu_bt" />
</a>
<a class="menu_button" href="login.asp">
<input type="button" value="GİRİŞ YAP" class="menu_bt"/>
</a>
<a class="menu_button" href="forum.asp">
<input type="button" value="FORUM" class="menu_bt"/>
</a>
<a class="menu_button" href="people.html">
<input type="button" value="KİŞİLER" class="menu_bt" style="background:#111;color: white"/>
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
<img src="<%=img_url%>" style="margin-left:130px;margin-bottom:20px;"/>

<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Adı:</font> <%=name%>
</div>
<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Soyadı :</font> <%=lastname%>
</div>
<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Cinsiyet :</font> <%=gender%>
</div>
<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Doğum Günü :</font> <%=birth_day%>
</div>
<div class="people_info1" style="margin-left:30px;margin-bottom:5px;">
<font class="people_info2">Ülke :</font> <%=country%>
</div>
<div class="people_info1" style="margin-left:30px;margin-bottom:20px;">
<font class="people_info2">E-MAIL :</font> <%=email%>
</div>

<div style="display:inline-block;width:75%;margin-bottom:20px;margin-left:20px;" >
<br>
    
    
    
<form action="person.asp?id=<%=user_id%>" method="post">
<textarea type="text" style="width: 500px;height: 150px;border-radius: 10px;font-size: 20px" placeholder="Yorumunu Buraya Yaz ..." name="comment">
</textarea>
</div>



<div style="margin-top:10px;margin-bottom:20px;margin-left:20px;">
<input class="myButton"type="submit" value="Gönder" name="send" />
</div>
</form>
<div class="erorr"><%=msg%></div>
<table width="100%"  cellpadding="0" border="0" bgcolor=#768d87 font="georgian" style="color:white;color:#000" class="tb">
		<tr><th>Adı</th><th>Yorumu</th><th>Tarih</th></tr>
				<%
		set conn=Server.Createobject("ADODB.Connection")
		conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
		qry="select * from comment where user_id="&Cint(user_id)&" order by comment_date desc"
		set res=conn.execute(qry)
		do while not res.eof
		%>
		<tr><td><%=res("username")%></td><td><%=res("comment")%></td><td><%=res("comment_date")%></td></tr>
		<% 
		res.Movenext
		loop
		%>
</table>



</div>


</div>
</div>
</div>

</body>


</html>