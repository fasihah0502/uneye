<h1>ALL USERS</h1>

<form method ="POST">
	@csrf
	Search <input type='text' name='txt'>
	<input type='submit' name='btnSearch' value='Search'>
</form>

<table border=1>
@foreach ($x as $user)
<tr>
	<td>{{$user->username}}</td>
	<td>{{$user->password}}</td>
	<td>{{$user->fullname}}</td>
</tr>
@endforeach
</table>