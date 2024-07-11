<h1>Edit User</h1>
{{Session::get("username")}}<br>

<form method='POST' action='editproduct'>
 @csrf
 	<input type='hidden' name='id' value='{{$data->id}}'>
 
	 Item Name: <input type='text' name='in' value='{{$data->itemname}}'><br>
	 Item Desc: <input type='text' name='idd' value='{{$data->itemdesc}}'><br>
	 Quantity: <input type='text' name='q' value='{{$data->quantity}}'><br>
	 Price: <input type='text' name='p' value='{{$data->price}}'><br>
 <input type='submit' name='btnSave' value='Save'>
</form>