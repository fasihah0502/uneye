<%@ include file='../menu.jsp' %>
<%@ include file='../../db.jsp' %>
<%
String email = request.getParameter("id");
Statement stmt=DB.createStatement();
String sql = "SELECT * FROM user WHERE email = '"+email+"'";
ResultSet rs=stmt.executeQuery(sql);
String fullname ="";
String password ="";
String userlevel ="";
if (rs.next())
{
	email = rs.getString("email");
	fullname = rs.getString("fullname");
	password = rs.getString("password");
	userlevel = rs.getString("userlevel");
	String optionvalue ="";
	if (userlevel.equals("admin")){
		optionvalue = "<option value='admin' selected>Admin</option>" +
					"<option value='user'>Normal user</option>";
	}else if (userlevel.equals("user")){
		optionvalue = "<option value='admin'>Admin</option>" +
					"<option value='user' selected>Normal user</option>";
	}else{
		optionvalue = "<option value=''>Choose</option>"+
					"<option value='admin'>Admin</option>" +
					"<option value='user'>Normal user</option>";
	}
%>
<h1>Update user</h1>
	<form method="POST" action = "updateProcess.jsp">
	Fullname : <input type='text' name='fullname' value='<%= fullname %>'><br>
	Username : <%= email %><br>
	Password : <input type='text' name='password' value='<%= password %>'><br>
	Userlevel: <select name='userlevel'>
	<%= optionvalue %>
	</select>
	<input type='hidden' name='email' value='<%= email %>'><br>
	<input type='submit' name='btn' value='Update'>
	
</form>

<%
}
else
{
	out.println("Failed. Record not found!");
	out.println("<meta http-equiv='REFRESH' content='3;url=index.jsp'>");
	return;
}
%>