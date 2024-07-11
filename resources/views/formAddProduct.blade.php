@include('admin')
<h1>Add New Product</h1>
{{Session::get("username")}}

<form method='POST' action='product/register'>

@csrf
<table>
	<tr>
	<th>Item Name : </th>
	<td><input type='text' name='in'></td>
	</tr>
	<tr>
	<th>Item Description : </th>
	<td><input type='text' name='idd'></td>
	</tr>
	<tr>
	<th>Quantity : </th>
	<td><input type='text' name='q'></td>
	</tr>
	<tr>
	<th>Price : </th>
	<td><input type='text' name='p'></td>
	</tr>
</table>
	<input type='submit' name='btn' value='Register'>
</form>