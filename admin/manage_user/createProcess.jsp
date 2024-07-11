<%@ include file='../../db.jsp' %>
<%
if (request.getParameter("btn")!=null){
	Statement stmt=DB.createStatement();
	String sql = "INSERT INTO user "+
	"(fullname, email, password,userlevel)"+
	"VALUES (" +
	"'" + request.getParameter("fullname")+ "'," +
	"'" + request.getParameter("email")   + "'," +
	"'" + request.getParameter("password")+ "',"  +
	"'" + request.getParameter("userlevel")+ "'"  +
	")";
	try{
		int rows=stmt.executeUpdate(sql);
		if (rows==1)
		{
			out.println("Insert success for " + request.getParameter("fullname"));
			out.println("<meta http-equiv='REFRESH' content='3;url=index.jsp'>");
			return;
		}
	}catch(Exception e){
		String email = request.getParameter("email");
		out.println("Failed to insert " + email +". This email already exists");
		return;
	}
}
%>