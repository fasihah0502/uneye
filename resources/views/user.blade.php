@extends('book')
@section('title')
Cart
@endsection
<center>
<br><br><br><br><br>
<style>
table, th, td {
  border: 1px solid;
}
</style>
<h1>CART</h1>

<a href='book'>BACK</a>
<br>

<?php
$products = DB::table("product")->get();
?>
<table border=1>

<tr>

<th> Destination </th>
<th> Description</th>
<th> Quantity</th>
<th> Sold </th>
<th> Balance</th>
<th> Price</th>
<th> Action</th>

</tr>

@foreach ($products as $p)
<tr>
<td>{{$p->itemname}}</td>
<td>{{$p->itemdesc}}</td>
<td>{{$p->quantity}}</td>

<?php
$bought  = DB::table ("product_user")
->where("id_product",$p->id)
->sum("quantity");

$balance = $p-> quantity - $bought;
?>

<td>{{$bought}}</td>
<td>{{$balance}}</td>
<td>RM {{$p->price}}</td>
<td><a href='buy?id={{$p->id}}&&itemname={{$p->itemname}}&&itemdesc={{$p->itemdesc}}&&price={{$p->price}}'>Buy</a></td>
</tr>
@endforeach

</table>

<?php

$listbuy= DB::table("product_user")
->select("product.id","product.itemname","product.itemdesc","product.price","product_user.quantity","product_user.status","product_user.datepurchase")
->leftjoin("product","product.id","product_user.id_product")
->where("username", Session::get("username"))
->get();
?>
<br>
<h2> MY BOOK </h2>
<table border=2>

<tr>

<th> Date Purchase </th>
<th> Destination </th>
<th> Item Description </th>
<th> Price </th>
<th> Quantity </th>
<th> Status </th>
<th> Edit </th>
<th> Delete </th>

</tr>

@foreach ($listbuy as $p)
<tr>
<td>{{$p->datepurchase}}</td>
<td>{{$p->itemname}}</td>
<td>{{$p->itemdesc}}</td>
<td>RM {{$p->price}}</td>
<td>{{$p->quantity}}</td>

<?php
if ($p->status ==1) $textstatus ="Approve";
else if ($p->status ==0) $textstatus = "New";
else if ($p->status==2) $textstatus = "Reject";
?>
<td>{{$textstatus}}</td>
<td><a href='editB?id={{$p->id}}'>Edit</a></td>
<td><a href='deleteB/{{$p->id}}'>Delete</a></td>
</tr>
@endforeach
</table>
<br><br><br>
</center>