<%@ page import = "java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
String DBSERVER="jdbc:mysql://127.0.0.1:3306/labwebapp";
String DBUSER="root";
String DBPASS="";
Connection DB=DriverManager.getConnection(DBSERVER, DBUSER, DBPASS);
%>