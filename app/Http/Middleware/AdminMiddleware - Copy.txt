<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Session;
class AdminMiddleware
{
    public function handle(Request $request, Closure $next, ...$guards)
    {
        if(Session::has("username")){
        	if(Session::get("userlevel")==1){
        	return $next($request);
        	}else{
        	echo "DILARANG MASUK";
        	echo "<meta http-equiv='REFRESH'
        		content='3;url=loginaccount'>
        		";
        	die();
        	}
        }else{
        	return redirect("/loginaccount");
        }
    }
}
