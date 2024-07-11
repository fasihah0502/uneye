<%@ include file='../../db.jsp' %>
<%
	String id = request.getParameter("id");
	Statement stmt=DB.createStatement();
    String sql = "DELETE FROM news where id ='"+id+"'";
    int row = stmt.executeUpdate(sql);
	if (row>0){
		out.println("Delete bereh");
		out.println("<meta http-equiv='REFRESH' content='3;url=index.jsp'>");
	}else{
		out.println("Failed to delete");
	}
	stmt.close();
	DB.close();
%>