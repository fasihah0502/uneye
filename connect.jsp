<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 Connection con;
 Class.forName("com.mysql.cj.jdbc.Driver");
 con =
 DriverManager.getConnection("jdbc:mysql://localhost:3306/labwebapp?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
%>
