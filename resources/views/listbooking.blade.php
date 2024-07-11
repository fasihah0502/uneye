<html>
<head>
@extends('admin')
</head>
<div>
<?php
$listbuy= DB::table("product_user")
->get();
?>

<h2> MY BOOK </h2>
<table border=1>

<tr>

<th> Date Purchase </th>
<th> Username</th>
<th> Item Name </th>
<th> Item Desc </th>
<th> Price </th>
<th> Quantity </th>
<th> Status </th>

</tr>

@foreach ($listbuy as $p)
<tr>
<td>{{$p->datepurchase}}</td>
<td>{{$p->username}}</td>
<td>{{$p->itemname}}</td>
<td>{{$p->itemdesc}}</td>
<td>{{$p->price}}</td>
<td>{{$p->quantity}}</td>

<?php
if ($p->status ==1) $textstatus ="Approve";
else if ($p->status ==0) $textstatus = "Pending";
else if ($p->status==2) $textstatus = "Reject";
?>
<td>{{$textstatus}}</td>
<td><a href="approveP?id={{$p->id_product}}">Approve</a>/<a href="rejectP?id={{$p->id_product}}">Reject</a>/<a href="cancelP?id={{$p->id_product}}">Cancel</a></td>

</tr>
@endforeach
</table>
</div>
</html>