<%@ include file='../menu.jsp' %>
<%@ include file='../../db.jsp' %>
<body background='../portfolio/pic/b5.png'>
<h2>List of News</h2>
<a href="create.jsp">Add news</a>
<table border=1>
<thead>
<tr>
    <th>PostedBy</th>
    <th>PostedAt</th>
    <th>Title</th>
    <th>Message</th>
	<th>Status</th>
</tr>
</thead>
<tbody>
<%
    Statement stmt=DB.createStatement();
    String sql = "select * from news";
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
			String news = rs.getString("message").replace("\n","<br>");
			String status="";
			if (rs.getInt("lockStatus")==0)
				status = "Open";
			else
				status = "Closed";
%>
           <tr>
           <td><%= rs.getString("posted_by") %></td>
           <td><%= rs.getString("posted_at") %></td>
           <td><%= rs.getString("title") %></td>
           <td><%= news %></td>
		   <td><%= status %></td>
		   <td><a href="delete.jsp?title=<%= rs.getString("title") %>&id=<%= rs.getInt("id") %>" >Delete</a></td>
		   <td><a href="update.jsp?title=<%= rs.getString("title") %>&id=<%= rs.getInt("id") %>" >Update</a></td>
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