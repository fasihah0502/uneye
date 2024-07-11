<%@ include file='../menu.jsp' %>
<h1>DELETE USER</h1>
<form method='POST' action='deleteProcess.jsp'>
Are you sure to delete <%= request.getParameter("title") %> ?
<input type='hidden' name='id' value='<%= request.getParameter("id") %>'><br>
<input type="button" name='btnCancel' value='Cancel' onclick='history.back();'>
<input type="submit" name='btnDelete' value="Yes">
</form>