<h1>Edit User</h1>

<form method='POST' action='edituser'>
 @csrf
 	<input type='hidden' name='id' value='{{$data->id}}'>
 
	 Fullname: <input type='text' name='fn' value='{{$data->fullname}}'><br>
	 Username: <input type='text' name='u' value='{{$data->username}}'><br>
	 Password: <input type='password' name='p' value='{{$data->password}}'><br>
	 Userlevel: 
 <?php
	 $selectedAdmin ="";
	 $selectedUser = "";
	 if ($data->userlevel==1)
	     $selectedAdmin = "selected";
	 else if ($data->userlevel==0)
	     $selectedUser = "selected";
 ?>
 <select name='level' required>
	  <option value=''>Choose user level</option>
	  <option value='1' {{$selectedAdmin}}>Admin</option>
	  <option value='0' {{$selectedUser}}>User</option>
 </select>
 <input type='submit' name='btnSave' value='Save'>
</form>