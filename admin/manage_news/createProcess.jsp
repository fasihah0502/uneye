<%@ include file="../../db.jsp" %>
<%
if (request.getParameter("title") != null &&
	request.getParameter("message") != null &&
	request.getParameter("lockStatus") != null &&
	request.getParameter("userEmail") != null){	
	Statement stmt=DB.createStatement();
    String sql = "INSERT INTO news (posted_by, posted_at, title, message, lockStatus,userEmail)" +
	"VALUES ("+
	"'"+ session.getAttribute("email")+"',"+
	"Now()," +
	"'"+request.getParameter("title")+"',"+
	"'"+request.getParameter("message")+"',"+
	"'"+request.getParameter("lockStatus")+"',"+
	"'"+request.getParameter("userEmail")+"'"+
	")"	;
	try{
		int rows = stmt.executeUpdate(sql);
		if (rows==0){
			out.println("Error");
		}else 
		{
			out.println("Successful register " + request.getParameter("title") );
		}
	}catch(Exception e){
		out.println(e);
	}
	%>
	<meta http-equiv='REFRESH' content='3;url=index.jsp'>
	<%
	stmt.close();
	DB.close();
}
%>