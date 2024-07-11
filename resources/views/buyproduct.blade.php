@extends('book')
@section('title')
Buy Product
@endsection
<br><br><br><br><br>
<h1>Buy Product</h1>

<?php
$products = DB::table("product")
->where("id",Request::get ("id"))
->first();
?>

<form method='POST' action='user/buy'>
@csrf
ProductName: {{$products->itemname}}<input type='hidden' name='itemname' value='{{Request::get("itemname")}}'><br>
ProductDesc: {{$products->itemdesc}}<input type='hidden' name='itemdesc' value='{{Request::get("itemdesc")}}'><br>
Product Price: RM {{$products->price}}<input type='hidden' name='price' value='{{Request::get("price")}}'><br>
<input type='hidden' name='productid' value='{{Request::get("id")}}'>
Quantity:<input type='text' name='quantity'><br>
<input type='submit' name='btnSave' value='Buy'><br>
<a href='user'>BACK</a>

