<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style type="text/css">
table{
padding-top: 50px;
}
table tr{
padding-bottom: 50px;
padding-top: 50px;
}
table input{
border-color:black;
outline-style: solid;
outline-width: 1px;
outline-color:black;
background-color: yellow;
}
h3{
font-weight: 100;
}
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 200px;
margin-top:50px;

}
#table2 input{
background-color:blue;
height:30px;
width:90px;
border-color:activeborder;
outline-style: solid;
outline-width: 0.1px;
color: white;
border-style: groove;
-moz-border-radius: 9px;
  -webkit-border-radius: 9px;
}


</style>
</head>
<body bgcolor="yellow" >


<div id="boxed">
<h3 align="center">Login Into Jewellery Management System</h3>
</div>
<center>
<table>
<tr>
<td><h3>Username :</h3></td>
<td><input type="text" value="" size="30" name="userName" maxlength="50"></td>
</tr>
<tr>
<td><h3>Password :</h3></td>
<td><input type="text" value="" size="30" name="password" maxlength="15"></td>
</tr>
</table>
<div id="table2">
<table>
<tr>
<td><input type="submit" value="Sign In" name="signIn" ></td>
<td></td>
<td></td>
<td></td>

<td><input type="submit" value="Sign Up" name="signUp"  ></td>
</tr>
</table></div><br><br>
<a href="#">Forget Password</a>
</center>
</body>
</html>