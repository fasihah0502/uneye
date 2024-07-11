<%@ include file='menu.jsp' %>
<%@ include file='../db.jsp' %>
<body background='../portfolio/pic/b5.png'>
<br>
<table border=1>
<thead>
<tr>
    <th>Title</th>
    <th>News</th>
    <th>PostedBy</th>
	<th>LockedStatus</th>
</tr>
</thead>
<tbody>
<%
    Statement stmt=DB.createStatement();
	String sql = "SELECT * from news";
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {		String status="";
			if (rs.getInt("lockStatus")==0)
				status = "Open";
				
			else
				status = "Closed";
%>
           <tr>
           <td><%= rs.getString("title") %></td>
           <td><%= rs.getString("message").replace("\n","<br>") %></td>
           <td>
				<%= rs.getString("posted_by") %><br>
				<%= rs.getString("posted_at") %>
		   </td>
		   <td><%= status %></td>
		   <td>
		   <%
		   if (status.equals("Open")){
		   	%>		   	
		   	<a href='reply.jsp?id=<%= rs.getInt("id")%>'>Reply</a><br>
		   	<%
		   	} else{
		   	
		   	}
		   	String loginUser = session.getAttribute("email").toString();
		   	String allowEmail = rs.getString("userEmail");
		   	if (loginUser.equals(allowEmail)){
		   	%>		   	
		   	<a href='update.jsp?id=<%= rs.getInt("id") %>'>Update</a>
		   	<%
		   	}
		   %>
		   </td>		   
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