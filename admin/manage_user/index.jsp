<%@ include file='../menu.jsp' %>
<%@ include file='../../db.jsp' %>
<body background='../portfolio/pic/b5.png'>
<h1>List of users</h1>
<a href="create.jsp">Add New</a>
<table border=1>
<thead>
<tr>
	<th>Email</th>
	<th>Password</th>
	<th>Fullname</th>
	<th>Userlevel</th>
	<th colspan=2>Action</th>
</tr>
</thead>
<tbody>
<%
	Statement stmt=DB.createStatement();
	String sql = "select * from user";
	ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>
           <tr>
           <td><%= rs.getString("email") %></td>
           <td><%= rs.getString("password") %></td>
           <td><%= rs.getString("fullname") %></td>
		   <td><%= rs.getString("userlevel") %></td>
		   <td><a href='update.jsp?id=<%= rs.getString("email") %>'>Edit</a></td>
		   <td><a href='delete.jsp?id=<%= rs.getString("email") %>'>Delete</a></td>
		   </tr>

   <%
    }
   %>
</tbody>
</table>
<%
	rs.close();
	stmt.close();
	DB.close();
%>