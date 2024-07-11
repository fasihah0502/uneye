<%@ include file='menu.jsp' %>
<%@ include file='../db.jsp' %>

<%
	if (request.getParameter("btn") != null) {
		String m = request.getParameter("message");
		String idnews = request.getParameter("id_news");
		Statement stmt = DB.createStatement();
		String sql = "INSERT INTO news_reply (id_news, posted_by, posted_at, message)" +
	"VALUES"+
	"(" +idnews +",'"+session.getAttribute("email")+"', Now(),'"+m+"')";
	try{
		int rows = stmt.executeUpdate(sql);
		if (rows==0){
			out.println("Error");
		}else 
		{
			out.println("Successful reply ");
		}
	}catch(Exception e){
	}
	%>
	<meta http-equiv='REFRESH' content='3;url=index.jsp'>
	<%
	stmt.close();
	DB.close();

	}
%>

<h1>REPLY NEWS</h1>
<form>
	Your reply: <input type='text' name='message'>
	<input type='hidden' name='id_news' value='<%= request.getParameter("id")%>'>
	<input type='submit' name='btn' value='Reply'>
</form>