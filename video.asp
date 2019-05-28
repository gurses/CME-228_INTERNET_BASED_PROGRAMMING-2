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
<input type="button" value="VIDEO" class="menu_bt"style="background:#111;color: white"/>
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
<% 
id=request.querystring("id")
if id="3" then
name="Game Of Thrones"
src="https://www.youtube.com/embed/_RRGqLi9YBA"
elseif id="4" then
name="Boston dynamics"
src="https://www.youtube.com/embed/OnWolLQSZic"
elseif id="5" then
name="Dynamics"
src="https://www.youtube.com/embed/rVlhMGQgDkY"
elseif id="6" then
name="Hans Zimmer"
src="https://www.youtube.com/embed/FkmWxOfsPuE"
end if

%>
<%
mgs=""
if Session("username")="" then
response.redirect("login.asp?e=1")
end if
com=request.form("comment")
com=Trim(com)
if request.form("send")<>""  then
if com<>"" then
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="insert into album(username,comment,comment_date,album_id)values('"&Session("username")&"','"&com&"','"&now&"',"&Cint(id)&")"
conn.execute(qry)
conn.close
else
msg="Lütfen Boş Yorum Yapma"
end if
end if
%>
<div class="login_main" >
<div style="padding-bottom:5px;color:white;font-size:15px;border-bottom:3px solid white;width:100px;margin-bottom:15px;margin-left:20px">
<%=name%>
</div>
<form action="video.asp?id=<%=id%>" method="post">
<iframe style="width:45vw; height:25vw;display:block;margin:auto;border:2px solid #ccc;box-shadow:0 0 20px #ccc;" src="<%=src%>" allowfullscreen="allowfullscreen"></iframe>
<div style="display:inline-block;width:75%;margin-bottom:20px;margin-left:20px;" >
<br>
<textarea type="text" style="width: 500px;height: 150px;border-radius: 10px;font-size: 20px" placeholder="Yorumunu Buraya Yaz..." name="comment">
</textarea>
</div>



<div style="margin-top:10px;margin-bottom:20px;margin-left:20px;">
<input class="myButton"type="submit" value="Gönder" name="send" />
</div>
</form>
<div class="erorr"><%=msg%></div>
<table width="100%"  cellpadding="0" border="0" bgcolor=#768d87 font="georgian" style="color:white;color:#000;margin-top:20px;" class="tb">
		<tr><th>Adı</th><th>Yorum</th><th>Tarih</th></tr>
		<%
		set conn=Server.Createobject("ADODB.Connection")
		conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
		qry="select * from album where album_id="&Cint(id)&" order by comment_date desc"
		set res=conn.execute(qry)
		do while not res.eof
		%>
		<tr><td><%=res("username")%></td><td><%=res("comment")%></td><td><%=res("comment_date")%></td></tr>
		<% 
		res.Movenext
		loop
		%>
</table>

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
</div>

</body>


</html>