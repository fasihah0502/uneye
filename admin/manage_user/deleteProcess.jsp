<%@ include file='../../db.jsp' %>
<%
if (request.getParameter("email") != null){
	Statement stmt=DB.createStatement();
	String sql = "DELETE FROM user WHERE email = '"+request.getParameter("email")+"'";
	int rows=stmt.executeUpdate(sql);
	if (rows>0){
		response.sendRedirect("index.jsp");
		return;
	}
	else		
	{
		out.println("Record not found!");
		response.sendRedirect("index.jsp");
		return;
	}
}
%>