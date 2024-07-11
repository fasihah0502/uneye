
<h1>Edit Buy Product</h1>

<?php
$products = DB::table("product_user")
->where("id",Request::get ("id"))
->first();
?>

<form method='POST' action='editB'>
@csrf
ProductName: {{$products->itemname}}<input type='hidden' name='itemname' value='{{Request::get("itemname")}}'><br>
ProductDesc: {{$products->itemdesc}}<input type='hidden' name='itemdesc' value='{{Request::get("itemdesc")}}'><br>
Product Price: {{$products->price}}<input type='hidden' name='price' value='{{Request::get("price")}}'><br>
<input type='hidden' name='productid' value='{{Request::get("id")}}'>
Quantity:<input type='text' name='qty'><br>
<input type='submit' name='btnSave' value='Buy'><br>