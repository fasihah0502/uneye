<%@ include file='menu.jsp' %>
<body background='portfolio/pic/b5.png'>
<center>
<h1>Login Page</h1>
<form action='processLogin.jsp' method='POST'>
<style>
table, th, td {
  border:1px solid black;


}
input[type=text] {
  width: 100%;
  padding: 12px ;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;
  background-color: #ffffcc;
}
input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;
  background-color: #ffffcc;

}
input[type=submit] {
  background-color: #b38600;
  border-radius: 8px;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<table>
<tr>
<th style='font-size:20px;'>E-mail: </th>
<td><input type='text' name='u'></td>
</tr>
<tr>
<th style='font-size:20px;'>Password: </th>
<td><input type='password' name='p'></td>
</tr>
</form>
</table>
<span class="tab"></span> <div alight="right">
 <input type='submit' name='login' value='Login'>
  <form action="register.jsp"><span class="tab"></span>
<input type="submit" value="Sign-up" > 
</div> </form>
</center>