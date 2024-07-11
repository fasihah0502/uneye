<%@ include file='menu.jsp' %>
<body background='pic/b.png' style='width:100%;'>
<center>
<h1 style='font-size:50px; border-style:outset; background-color:#fff2cc;'>Login Page</h1>
<form action='processLogin.jsp' method='POST'>
<style>
table, th, td {
  border:1px solid black;
  background-color:#fff2cc;

}
input[type=text] {
  width: 100%;
  padding: 5px 12px ;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;
}
input[type=password] {
  width: 100%;
  padding: 5px 12px ;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid black;
  border-radius: 4px;

}
input[type=submit] {
  border-radius: 8px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 20px;
  font-family:'Times New Roman';
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<table>
<tr>
<th style='font-size:25px;  padding: 0px 10px;'>E-mail: </th>
<td><input type='text' name='u'></td>
</tr>
<tr>
<th style='font-size:25px;  padding: 0px 10px;'>Password: </th>
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