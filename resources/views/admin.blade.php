
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
	font-size:20px;
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: red;
}
.active {
  background-color: #04AA6D;
}

</style>

<h1>WELCOME ADMIN</h1>
{{Session::get("username")}}
<title>@yield('t1','Admin Page')</title>

<ul>
  <li><a href="list">List All User</a></li>
  <li><a href="listproduct">List All Product</a></li>
  <li><a href="listbooking">List All Booking</a></li>
  <li><a class="active" href="logout">Log Out</a></li>
</ul>