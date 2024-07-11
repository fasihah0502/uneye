<title>Register</title>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
	font-size:20px;
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: red;
}
.active {
  background-color: #04AA6D;
}

</style>
</head>
<body>
<ul>
  <li><a href="index">Home</a></li>
  <li><a href="loginaccount">Login</a></li>
  <li><a href="formAddUser" class="active">Register</a></li>
</ul>
</body>
</html>

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
