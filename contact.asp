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
<input type="button" value="KİM NEREDE" class="menu_bt"  style="background:#111;color: white"/>
</a>
<a class="menu_button" href="map.asp">
<input type="button" value="HARİTA" class="menu_bt"/>
</a>

</div></div>
<div style="height: 70px">
</div>


<% 
if Session("username")="" then
response.redirect("login.asp?e=1")

end if


%>



<div class="login_main" style="width:78%" >
<table width="100%"  cellpadding="0" border="0" bgcolor=#768d87 font="georgian" style="color:white;color:#000;margin-top:20px;word-break:break-all;" class="tb">
<caption style="color:white;margin-bottom:20px;font-size:30px;"><u>Kullanıcı Bilgileri</u></caption>
		<tr><th>ID</th><th>Kullanıcı Adı</th><th>Adı</th><th>Soyadı</th><th>Cinsiyet</th><th>Yaş</th><th>E-mail</th><th>Ülke</th><th>Hobbileri</th></tr>
		<%
		set conn=Server.Createobject("ADODB.Connection")
		conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
		qry="select * from users"
		set res=conn.execute(qry)
		c=1
		do while not res.eof
		%>
		<tr><td><%=c%></td><td><%=res("username")%></td><td><%=res("fname")%></td><td><%=res("lname")%></td><td><%=res("gender")%></td><td><%=year(date)-year(res("birth_day"))%></td><td><%=res("email")%></td><td><%=res("country")%></td><td><%=res("hobbies")%></td></tr>
		<% 
		res.movenext
		c=c+1
		loop
		%>
</table>
            
     
</div>



</div>
</div>
</div>

</body>


</html>