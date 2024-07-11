<title>Login Page</title>
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
  <li><a href="loginaccount" class="active">Login</a></li>
  <li><a href="form">Register</a></li>
</ul>
</body>
</html>

<h1>Login</h1>
@if ($errors->any())
<div class="alert alert-danger">
    <ul class="list-unstyled">
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>
@endif

<form method='POST'>
@csrf
Username: <input type='text' name='u'><br><br>
Password: <input type='password' name='p'><br>
<input type='submit' name='btnLogin'><br>
</form>
</html>