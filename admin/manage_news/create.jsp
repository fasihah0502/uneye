<%@ include file='../menu.jsp' %>
<h1>CREATE NEWS</h1>
<form method='POST' action ='createProcess.jsp'>
PostedBy    : <%= session.getAttribute("email") %><br>
Title : <input type='text' name='title' ><br>
Message : <textarea rows=10 cols=100 name='message'></textarea><br>
Lock Status: <select name='lockStatus'>
<option value=''>Choose</option>
<option value='0'>Open</option>
<option value='1'>Close</option>
</select><br>
User Email: <input type='text' name='userEmail' ><br>
<input type='submit' name='btnCreate' value='Post News'>
<input type='button' name='btnBack' value='BACK' onclick='history.back();'>
</form>