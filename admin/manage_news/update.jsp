<%@ include file='../menu.jsp' %>
<%@ include file='../../db.jsp' %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<h1>Update Message</h1>

<%
String title="";
String message="";
String lockStatus ="";
String posted_by ="";
String posted_at ="";
String optionvalue="";
Statement stmt=DB.createStatement();
String sql = "select * from news where id ='"+request.getParameter("id")+"' ";
ResultSet rs=stmt.executeQuery(sql);
if(rs.next()){
	posted_by = rs.getString("posted_by");
	posted_at = rs.getString("posted_at");
	title = rs.getString("title");
	message = rs.getString("message");
	lockStatus = rs.getString("lockStatus");
	if (lockStatus.equals("0")){
		optionvalue = "<option selected value='0'>Open</option>" +
					   "<option value='1'>Close</option>";
	}else if (lockStatus.equals("1")){
		optionvalue = "<option  value='0'>Open</option>" +
					   "<option selected value='1'>Close</option>";

	}
}
String userEmail = request.getParameter("userEmail");
try{
	Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/labwebapp", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into news(userEmail)values('"+userEmail+"')");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
<form method='POST' action ='updateProcess.jsp'>
Title    : <input type ='text' name='title' value='<%= title %>'><br>
<input type='hidden' name='id' readonly value='<%= request.getParameter("id") %>'><br>
Message : <textarea name='message'><%= message %></textarea><br>
Lock Status: <select name='lockStatus'>
<%= optionvalue %>
</select><br>
User Email: <input type='text' name='userEmail'><br>
<input type='submit' name='btnCreate' value='UPDATE'>
<input type='button' name='btnBack' value='BACK' onclick='history.back();'>
</form>