<%@ include file='../../db.jsp' %>
<%
if (request.getParameter("btn")!=null){
	Statement stmt=DB.createStatement();
	String sql = "update user set "+
	"fullname = '"+request.getParameter("fullname")+ "',"+
	"email='" + request.getParameter("email")+"', "+
	"password='" + request.getParameter("password")+"' "+","+
	"userlevel='" + request.getParameter("userlevel")+"' "+
	"where email = '"+request.getParameter("email")+"'";
	int rows=stmt.executeUpdate(sql);
	if (rows==1)
	{
		out.println("Update success for " + request.getParameter("fullname"));
		out.println("<meta http-equiv='REFRESH' content='3;url=index.jsp'>");
		return;
	}
	else{
		out.println("Failed to update " + request.getParameter("email"));
		return;
	}
}
%>