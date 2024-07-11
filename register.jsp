<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file='connect.jsp' %>
<%@include file='menu.jsp' %>
<body background='portfolio/pic/bc.png'>
<% 
 if(request.getParameter("submit")!=null)
 {
 String email = request.getParameter("email");
 String fullname= request.getParameter("fullname");
 String password = request.getParameter("password");
 String userlevel = request.getParameter("userlevel");
 
 PreparedStatement pst;
 ResultSet rs;
 
 pst = con.prepareStatement("insert into user(email,fullname,password,userlevel)values(?,?,?,?)");
 pst.setString(1, email);
 pst.setString(2, fullname);
 pst.setString(3, password);
 pst.setString(4, userlevel);
 pst.executeUpdate(); 
 %> 
 <script> 
 alert("Record Added Successfully"); 
 </script> 
 <% 
}
 %>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title>
 </head>
  <center>
 <body>
 <h2>Registration Page</h2>
 <div class="row">
 <div class="col-sm-4">
 <form method="POST" action="#" > 
 <table border="1" width="30%" cellpadding="2">
 <tr>
 	<th>E-mail</th>
 	<td><input type="text" class="form-control" placeholder="email" name="email" id="email" required ></td>
 <tr>
	<th>Full Name</th>
 	<td><input type="text" class="form-control" placeholder="Full Name" name="fullname" id="fullname" required ></td>
 </tr>
 
 <tr>
	<th>Password</th>
 	<td><input type="text" class="form-control" placeholder="Password" name="password" id="password" required ></td>
 </tr>
 
 <tr>
 	<th>User Level</th>
 	<td><select name='userlevel'>
<option value=''>Choose</option>
<option value='admin'>Admin</option>
<option value='user'>User</option>
</select><br>
</td>
 </tr>
 </table>
 <br>
 <div alight="right">
 <input type="submit" id="submit" value="submit" name="submit" class="btn 
btn-success">
 <input type="reset" id="reset" value="reset" name="reset" class="btn btn secondary">
 </div> 

 </form>
 </div>
 </div>
 
 <% 
 PreparedStatement pst;
 ResultSet rs;
 
 String query = "select * from user";
 Statement st = con.createStatement();
 
 rs = st.executeQuery(query);
 
 while(rs.next())
 {
 String id = rs.getString("id");
 
 %>
<%
 
 }
 %>
 
 </table> 
 </div>
 </div>
 
 <form action="login.jsp">
    <input type="submit" value="Log-in Page" />
</form>
 </center>
 </body>
</html>