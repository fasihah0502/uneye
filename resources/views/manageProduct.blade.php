@include('admin')
<h1>Product</h1>

<a href='formAddProduct'>Add</a>
<table border=1>
 <tr>
	<th>ID</th>
	<th>Item Name</th>
	<th>Item Desc</th>
	<th>Quantity</th>
	<th>Price</th>
 </tr>
@foreach ($x as $u)
 <tr>
	  <td><?php echo $u->id; ?></td>
	  <td>{{$u->itemname}}</td>
	  <td>{{$u->itemdesc}}</td>
	  <td>{{$u->quantity}}</td>
	  <td>{{$u->price}}</td> 
	  <td><a href='deleteproduct/{{$u->id}}'>Delete</a></td>
	  <td><a href='editproduct?id={{$u->id}}'>Edit</a></td>
 </tr>
@endforeach
</table>

<?php

$listbuy= DB::table("product_user")
->select("product.itemname","product.itemdesc","product.price","product_user.quantity","product_user.status","product_user.datepurchase")
->leftjoin("product","product.id","product_user.id_product")
->where("username", Session::get("username"))
->get();
?>
