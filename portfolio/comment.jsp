<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ include file='../db.jsp' %>

<%
String comment =request.getParameter("comment");
String id_comment = request.getParameter("id_comment");
try{
		Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/labwebapp", "root", "");
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO blog_comment (id_comment, posted_by, posted_at, comment)" +
	"VALUES"+
	"(" +id_comment +",'"+session.getAttribute("email")+"', Now(),'"+comment+"')";
		PreparedStatement pstmt = con.prepareStatement(sql);
		int rows = pstmt.executeUpdate();
		con.close();
		if (rows==0){
			out.println("Error");
		}else 
		{
			out.println("Successful reply ");
			out.println("<meta http-equiv='REFRESH' content='3;url=blogs.jsp'>");    

		}
		
	}catch(Exception e){
	}

%>
<h1>YOUR COMMENT</h1>
<form>
	Your reply: <input type='message' name='comment'>
	<input type='hidden' name='id_comment' value=0>
	<input type='submit' name='btn' value='Reply'>
</form>
