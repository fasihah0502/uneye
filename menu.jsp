<link rel='stylesheet' href='mystyles.css'>
<h1 style='font-size:40px; margin:0px;'>Selamat datang &#127800;&#127800;&#127800;</h1>
<br>
<%
String currentFile = this.getClass().getSimpleName().replaceFirst("_jsp",".jsp");
String[] fileList= {"index.jsp","news.jsp"};
String[] fileTitle = {"Home","News"};

out.println("<ul>");
for (int i =0; i < fileList.length; i++){
    if (currentFile.equals(fileList[i]))
        out.println("<li><a class='active' href='"+fileList[i]+"'>"+fileTitle[i]+"</a></li>");
    else
        out.println("<li><a href='"+fileList[i]+"'>"+fileTitle[i]+"</a></li>");
}
//print either login | logout menu
if (session.getAttribute("email")!= null){
	if (currentFile.equals("logout.jsp"))
        out.println("<li><a class='active' href='logout.jsp'>Logout</a></li>");
    else
        out.println("<li><a href='logout.jsp'>Logout</a></li>");
}else{
	if (currentFile.equals("login.jsp"))
        out.println("<li><a class='active' href='login.jsp'>Login</a></li>");
    else
        out.println("<li><a href='login.jsp'>Login</a></li>");
}

out.println("</ul>");
%>