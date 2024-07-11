<%@ include file='../db.jsp' %>
<%
Statement stmt=DB.createStatement();
String sql = "UPDATE news SET  " +
"title = '"+request.getParameter("title")+"' ," +
"message = '"+request.getParameter("message")+"' ," +
"lockStatus = '"+request.getParameter("lockStatus")+"' " +
"WHERE id ='"+request.getParameter("id")+"'";

int x = stmt.executeUpdate(sql);
if (x == 1){
	out.println("Berjaya update");
	out.println("<meta http-equiv='REFRESH' content='3;url=index.jsp'>");
}else{
	out.println("Tidak berjaya");
}
%>