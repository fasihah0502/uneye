@include('admin')
<title>Register</title>
<!DOCTYPE html>
<h1>Add New User</h1>
<form method='POST' action='user/register'>

@csrf
	Fullname: <input type='text' name='fn'><br>
	Username: <input type='text' name='u'><br>
	Password: <input type='password' name='p'><br>
	Userlevel: 
	<select name='level'>
		<option value=''>Choose user level</option>
		<option value='1'>Admin</option>
		<option value='0'>User</option>
		
	</select>
	<input type='submit' name='btn' value='Register'>
</form>
