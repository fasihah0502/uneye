<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
//use Illuminate\Http\Request;
use Request;
use Session;
use DB;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
	
	function BuyProduct(){
		$p=Request::get('productid');
		$q=Request::get('quantity');
		$in=Request::get('itemname');
		$idesc=Request::get('itemdesc');
		$price=Request::get('price');
		$username=Session::get('username');
		DB::table('product_user')
		->insert([
		"id_product"=>$p,
		"itemname"=>$in,
		"itemdesc"=>$idesc,
		"price"=>$price,
		"username"=>$username,
		"quantity"=>$q,
		"status"=>0,
		"datepurchase"=>Now()
		]);
		return redirect("/user");
	}
    
	function Approve(){
  $Status =Request::get("Approve");
  $id = Request::get('id');
  $data = DB::table("product_user")
  ->where("id_product",Request::get('id'))
  ->update(
   [
   "Status"=>1,
   ]
   );
   return redirect("/listbooking");
  }
  
 function Reject(Request $a){
  $Status =Request::get("Reject");
  $id = Request::get('id');
  $data = DB::table("product_user")
  ->where("id_product",Request::get('id'))
  ->update(
   [
   "Status"=>2,
   ]
   );
   return redirect("/listbooking");
  }
	function Cancel(Request $a){
  $Status =Request::get("Cancel");
  $id = Request::get('id');
  $data = DB::table("product_user")
  ->where("id_product",Request::get('id'))
  ->update(
   [
   "Status"=>0,
   ]
   );
   return redirect("/listbooking");
  }
	
	function ListAllProduct(){
    	$x = DB::table("product")->get();
    	return view("manageProduct",compact("x"));
}
	function EditProduct(){
     $id = Request::get("id");
     $data = DB::table("product")
     ->where("id",$id)
     ->first();
     if (Request::get("btnSave") !== null){
         DB::table("product")
         ->where("id",Request::get("id"))
         ->update(
             [
             "itemname"=>Request::get("in"),
		     "itemdesc"=>Request::get("idd"),
		     "quantity"=>Request::get("q"),
		     "price"=>Request::get("p") 
             ]
             );
        return redirect("listproduct");
         
     }else
         return view("formEditProduct",compact("data"));
}
	function RegisterProduct(){
		$itemname= Request::get('in');
		$exist = DB::table("product")
		->where ("itemname","=",$itemname)
		->count();
		if($exist>0){
			echo "$itemname already exist";
		} else{
			DB::table("product")
			->insert(
				array(
				"itemname"=>Request::get("in"),
				"itemdesc"=>Request::get("idd"),
				"quantity"=>Request::get("q"),
				"price"=>Request::get("p")
				)
			);
			return redirect ("/listproduct");
		}
	}
	function DeleteProduct($iduser){
    	DB::table("product")
    	->where("id",$iduser)
    	->delete();
    	return redirect("/listproduct");
}

    function EditUser(){
     $id = Request::get("id");
     $data = DB::table("user")
     ->where("id",$id)
     ->first();
     if (Request::get("btnSave") !== null){
         DB::table("user")
         ->where("id",Request::get("id"))
         ->update(
             [
                "username"=>Request::get("u"),
		     "fullname"=>Request::get("fn"),
		     "password"=>Request::get("p"),
		     "userlevel"=>Request::get("level") 
             ]
             );
        return redirect("/list");
         
     }else
         return view("formEditUser",compact("data"));
 }
 function EditProfile(){
     $id = Request::get("id");
     $data = DB::table("user")
     ->where("id",$id)
     ->first();
     if (Request::get("btnSave") !== null){
         DB::table("user")
         ->where("id",Request::get("id"))
         ->update(
             [
                "username"=>Request::get("u"),
		     "fullname"=>Request::get("fn"),
		     "password"=>Request::get("p"),
             ]
             );
        return redirect("/book");
         
     }else
         return view("formEditProfile",compact("data"));
 }
     
    function DeleteUser($iduser){
    	DB::table("user")
    	->where("id",$iduser)
    	->delete();
    	return redirect("/list");
    }
    function EditB(){
     $id = Request::get("id");
     $data = DB::table("product_user")
     ->where("id",$id)
     ->first();
     if (Request::get("btnSave") !== null){
         DB::table("product_user")
         ->where("id",Request::get("id"))
         ->update(
             [
			 "itemname"=>Request::get("itemname"),
			 "itemdesc"=>Request::get("itemdesc"),
			 "price"=>Request::get("price"),
			 "quantity"=>Request::get("qty"),
             ]
             );
        return redirect("/user");
         
     }else
         return view("formEditBuy",compact("data"));
 }
     
    function DeleteB($id){
    	DB::table("product_user")
    	->where("id_product",$id)
    	->delete();
    	return redirect("/user");
    }
    
	function LOGIN(){
	if (Request::has("btnLogin")){
		$username = Request::get("u");
		$password = Request::get("p");
		$result = DB::table("user")
		->where("username","=", $username)
		->where("password","=", $password)
		->first();
		if ($result){
			$x= $result->userlevel;
			$ids= $result->id;
			Session::put("username", $result->username);
			Session::put("userlevel", $x);
			Session::put("id", $ids);
			if ($x == 0)
				return view ("second");
			else if ($x == 1)
				return view ("admin");
			else
				echo "You are not allowed to access";
		}else{
			echo "Incorrect login";
			echo "<meta http-equiv='REFRESH'
        		content='3;url=loginaccount'>
        		";
        	die();
		}
	} else{
		return view("loginform");
	}
}
    
    function ListAll(){
    	$x = DB::table("user")->get();
    	return view("manageuser",compact("x"));
    }

	function ListUser(Request $r){
		if($r->has("btnSearch")){
			$x = DB::table("user")
			->where("fullname","LIKE","%".$r->get('txt')."%")
			->get();
		}else{
		$x = DB::table("user")->get();
		}
	return view("alluser", compact("x"));
	}
	
	function RegisterUser(){
		$username= Request::get('u');
		$exist = DB::table("user")
		->where ("username","=",$username)
		->count();
		if($exist>0){
			echo "$username already exist";
		} else{
			DB::table("user")
			->insert(
				array(
				"username"=>$username,
				"fullname"=>Request::get("fn"),
				"password"=>Request::get("p"),
				"userlevel"=>Request::get("level")
				)
			);
			return redirect ("/index");
		}
	}
}
