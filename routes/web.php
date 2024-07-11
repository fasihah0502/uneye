<?php

Route::any('/approveP',"App\Http\Controllers\Controller@Approve");

Route::any('/rejectP',"App\Http\Controllers\Controller@Reject");

Route::any('/cancelP',"App\Http\Controllers\Controller@Cancel");

Route::any('user/buy',"App\Http\Controllers\Controller@BuyProduct");

Route::view('/buy', 'buyproduct');

Route::any("/edituser","App\Http\Controllers\Controller@EditUser"); 

Route::any("/editprofile","App\Http\Controllers\Controller@EditProfile"); 

Route::any("/editB","App\Http\Controllers\Controller@EditB"); 

Route::any("/deleteuser/{id}", "App\Http\Controllers\Controller@DeleteUser"); 

Route::any("/deleteB/{id_product}", "App\Http\Controllers\Controller@DeleteB"); 

Route::any('/listuser', "App\Http\Controllers\Controller@ListUser"); 

Route::any('/list', "App\Http\Controllers\Controller@ListAll");
 
Route::any('/listproduct', "App\Http\Controllers\Controller@ListAllProduct"); 

Route::any("/editproduct","App\Http\Controllers\Controller@EditProduct"); 

Route::any("/deleteproduct/{id}", "App\Http\Controllers\Controller@DeleteProduct"); 

Route::any('/loginaccount',"App\Http\Controllers\Controller@LOGIN");

Route::get('/index', function () {
    return view("index");
});
Route::get('/book', function () {
    return view("cart");
});
Route::get('/home', function () {
    return view("second");
});
Route::get('/listbooking', function () {
    return view("listbooking");
});

Route::any('/formAddUser', function () {
    return view("formAddUser");
});
Route::any('/form', function () {
    return view("form");
});

Route::post('/user/register', "App\Http\Controllers\Controller@RegisterUser");

Route::get('/user', function () {
    return view("user");
});

Route::get('/admin', function () {
    return view("admin");
})->middleware("App\Http\Middleware\AdminMiddleware");

Route::any("/logout", function () {
Session::forget("username");
return redirect("/index");
});

Route::any('/product/register', "App\Http\Controllers\Controller@RegisterProduct");

Route::any('/formAddProduct', function () {
  return view("/formAddProduct");
});

Route::view('/user', 'user');