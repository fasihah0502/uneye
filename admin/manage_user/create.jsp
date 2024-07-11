<%@ include file='../menu.jsp' %>
<h1>ADD NEW USER</h1>
<form method="POST" action = "createProcess.jsp">
	Fullname : <input type='text' name='fullname'><br>
	Email : <input type='text' name='email'><br>
	Password : <input type='text' name='password'><br>
	User Level : <select name='userlevel'>
	<option value="">Choose</option>
	<option value="admin">Admin</option>
	<option value="user">Normal user</option>
	</select>
	<input type='submit' name='btn' value='Add'>
</form>
