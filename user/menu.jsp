<%
if (session.getAttribute("userlevel") == null){
	out.println("You need to login to the system.");
	return;
}
if (session.getAttribute("userlevel").equals("user")
	|| session.getAttribute("userlevel").equals("admin"))
	;
else{
		out.println("This module is for user only !");
        return;
}
%>
<link rel='stylesheet' href='<%=request.getContextPath()%>/mystyles.css'>
<h1>USER MODULES </h1>
<%
String currentURL = request.getRequestURI().toString();

String m_homefile = request.getContextPath()+"/user/index.jsp";
String m_logoutfile = request.getContextPath()+"/logout.jsp";
String[] fileList= {m_homefile,"../portfolio/index.html",m_logoutfile};
String[] fileTitle = {"Home","Portfolio","Logout"};

out.println("<ul>");
for (int i =0; i < fileList.length; i++){
    if (currentURL.equals(fileList[i])){
        out.println("<li><a class='active' href='"+fileList[i]+"'>"+fileTitle[i]+"</a></li>");
	} 
	else
        out.println("<li><a href='"+fileList[i]+"'>"+fileTitle[i]+"</a></li>");
}
out.println("</ul>");
%>