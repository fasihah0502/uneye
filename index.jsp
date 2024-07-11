<%@ include file='menu.jsp' %>
<body background='portfolio/pic/b5.png'>

<%
if (session.getAttribute("userlevel")!= null){
	if (session.getAttribute("userlevel").equals("admin")){
		out.println("<a href='admin/index.jsp'>[Go to admin page]</a>");
	}else if (session.getAttribute("userlevel").equals("user")){
		out.println("<a href='user/index.jsp'>[Go to user page]</a>");
	}
}
%>
<style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
input[type=submit] {
  background-color: #b38600;
  border-radius: 8px;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
</head><br>

<body><br>
<div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Attention!</strong> Please login to view my portfolio <3</div>
<link rel='stylesheet' href='portfolio/css.css'>
<html>
<br>
<head>
<title>Portfolio</title>
<style>
table {
	font-size:15px; 
	font-family:sans serif; 
	padding:10px;
}
</style>
<center><img src='portfolio/pic/pic1.jpg' style="width:300px;border-radius:10px;"><br><br>
<table style='align:right; color:white ; border-radius:10px 0px; background-color:#666; padding: 10px;' id="demo"></table><br></center>
<script>
const d = new Date();
document.getElementById("demo").innerHTML = d;
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<header>
  <h2>PORTFOLIO</h2>
</header>

<section> 
  <article>
    <br><center><img src='portfolio/pic/john.jpg' style='width:200px;'></center>
    <p>This site consists of all my experiences during my studies.</p>
  </article>
</section>
<footer>
</footer>

</body>
</html>

