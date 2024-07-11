@extends('book')
@section('title')
Edit
@endsection
<br><br><br><br><br>
<center>
<table>
<tr>
<th>
<h1 style='font-family:"Times New Roman", Times, serif;font-size:50px;color:#660066'>Edit User</h1>
</th>
</tr>
</table>

<form method='POST' action='editprofile'>
 @csrf
 	<input type='hidden' name='id' value='{{Session::get("id")}}'>
 <table>
	<tr>
	<th>Fullname</th>
	<td><input type='text' name='fn'></th>
	</tr>
	<tr>
	<th>Username</th>
	<td><input type='text' name='u'></th>
	</tr>
	<tr>
	<th>Password</th>
	<td><input type='password' name='p'></th>
	</tr>
 <table><br>
 <input type='submit' name='btnSave' value='Save'>
</form><br>
<a href='user'>BACK</a><br>
</center>