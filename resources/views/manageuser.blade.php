@include('admin')
<h1>Users</h1>
<a href='formAddUser'>Add</a>
<table border=1>
 <tr>
	<th>ID</th>
	<th>Fullname</th>
	<th>Username</th>
	<th>Password</th>
	<th>Username</th>
</tr>
@foreach ($x as $u)
 <tr>
	  <td><?php echo $u->id; ?></td>
	  <td>{{$u->fullname}}</td>
	  <td>{{$u->username}}</td>
	  <td>{{$u->password}}</td>
	  <td>{{$u->userlevel}}</td> 
	  <td><a href='deleteuser/{{$u->id}}'>Delete</a></td>
	  <td><a href='edituser?id={{$u->id}}'>Edit</a></td>
 </tr>
@endforeach
</table>
