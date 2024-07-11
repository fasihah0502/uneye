<%
if (session.getAttribute("userlevel") == null){
	out.println("You need to login to the system.");
	return;
}
if (!session.getAttribute("userlevel").equals("admin")){
    out.println("You are not allowed to access this page.");
    return;
}
%>

<link rel='stylesheet' href='<%=request.getContextPath()%>/mystyles.css'>
<h1>ADMIN MODULES </h1>
<%
String currentURL = request.getRequestURI().toString();

String m_homefile = request.getContextPath()+"/admin/index.jsp";
String m_logoutfile = request.getContextPath()+"/logout.jsp";
String m_manageuser = request.getContextPath()+"/admin/manage_user/index.jsp";
String m_managenews = request.getContextPath()+"/admin/manage_news/index.jsp";
String[] fileList= {m_homefile,"../portfolio/index.html",m_manageuser,m_managenews,m_logoutfile};
String[] fileTitle = {"Home",  "Portfolio", "Manage User","Manage News","Logout"};

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