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
if request.form("del_bt")<>"" then
id=Cint(request.form("del"))
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="delete from comment where id="&id&""
conn.execute(qry)
conn.close
end if
%>
<%
page=request.querystring("page")
comm_num=0
if page="" or page="1" then
page_number=1
else
page_number=Cint(page)
end if
set conn=Server.Createobject("ADODB.Connection")
conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
qry="select count(*) from comment where user_id=0"
res=conn.execute(qry)
if res(0)<>"" then
comm_num=Cint(res(0))
end if
conn.close

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
qry="insert into comment(username,comment,comment_date,user_id)values('"&Session("username")&"','"&com&"','"&now&"',0)"
conn.execute(qry)
conn.close
else
msg="Lütfen Boş Yorum Bırakmayın"
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
<input type="button" value="GİRİŞ YAP" class="menu_bt"/>
</a>
<a class="menu_button" href="forum.asp">
<input type="button" value="FORUM" class="menu_bt" style="background:#111;color: white"/>
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
<div style="padding-bottom:5px;color:white;font-size:30px;border-bottom:3px solid white;width:120px;margin-left:25px;">
FORUM
</div>

<div style="margin:auto;color:black;font-size:16px;margin-top:30px;margin-bottom:20px;">
<form action="forum.asp" method="post">
<div style="display:inline-block;width:75%;margin-bottom:20px;margin-left:20px;" >
YORUM
<br>
<textarea type="text" style="width: 500px;height: 150px;border-radius: 10px;font-size: 20px" placeholder="Yorumunu Buraya Yaz..." name="comment">
</textarea>
</div>



<div style="margin-top:10px;margin-bottom:20px;margin-left:20px;">
<input class="myButton" type="submit" value="Gönder" name="send"/>
</div>
</form>
<div class="erorr"><%=msg%></div>
<div class="number_div">
<% 
cc=fix(comm_num/5)
cc2=comm_num/5
if cc2-cc<>0 then
cc=cc+1
end if
for i=1 to cc
%>
<form action="forum.asp" method="get" class="form">
<input type="submit" value="<%=i%>" name="page"/>
</form>
<% next%>
</div>
<table width="100%"  cellpadding="0" border="0" bgcolor=#768d87 font="georgian" style="color:white;color:#000" class="tb">
		<tr>
		<%
		if Session("username")="omar" then
		%>
		<th>Admin</th>
		<%
		end if
		%>
		<th>ADI</th><th>YORUM</th><th>TARİH</th></tr>
		<%
		set conn=Server.Createobject("ADODB.Connection")
		conn.Open("DRIVER={Microsoft Access DRIVER (*.mdb)};Dbq="&Server.MapPath("my.mdb"))
		qry="select * from comment where user_id=0 order by comment_date desc"
		set res=conn.execute(qry)
		dd=1
		do while not res.eof
		if dd>5*(page_number-1) and dd<=5*page_number then
		%>
		<tr>
		<% if Session("username")="omar" then
		%>
		<td>
		<form action="forum.asp" method="post">
		<input type="hidden" value="<%=res("id")%>" class="myButton" name="del" style="margin-top:15px;"/>
		<input type="submit" value="delete" class="myButton" name="del_bt" style="margin-top:15px;">
		</form>
		</td>
		<%
			end if
		%>		
		<td><%=res("username")%></td><td><%=res("comment")%></td><td><%=res("comment_date")%></td></tr>
		<% 
		end if
		dd=dd+1
		res.Movenext
		loop
		%>
</table>




</div>
</div>
</div>
</div>
</div>

</body>


</html>