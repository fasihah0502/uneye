<%@ include file='../menu.jsp' %>
<%
String email = request.getParameter("id");
%>
<h1>Delete user</h1>
<form name='f1' method='POST' action='deleteProcess.jsp'>
Delete this email [<%= email %>]?<br>
<input type='hidden' name='email' value='<%= request.getParameter("id") %>' >
<input type='button' onclick='f1.submit();' name='btnDelete' value='Delete'>
<input type='button' onclick='history.back();' value='Cancel'>
</form>