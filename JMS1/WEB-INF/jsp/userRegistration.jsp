<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function signUp(){
	
	
	
	
	
	document.forms[0].action="<%=request.getContextPath()%>/signUp";
	document.forms[0].method="post";
	document.forms[0].submit();
	

}


</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration </title>
<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 230px;
margin-top:50px;
margin-bottom: 50px;
}
#table1 input{

background-color: transparent;
border-color: black;
margin: 10px;


}
#table1 td{
padding-right: 50px;

}
#save{
margin: 20px;
}
#save input{

background-color: blue;
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
<body style=" background-color:antiquewhite;">

<form action="" method="post" enctype="multipart/form-data">

<div id="boxed">
<h2 align="center" style="font-family: sans-serif;">User Registration</h2>
</div>
<div id="table1">
<center>
<table>
<tr>
<td><h3>Name</h3></td>
<td><input type="text" value="" size="20" name="name" id="name"></td>
<td><h3>Gender</h3></td>
<td><input type="radio" size="20" name="gender" id="gender">Male &nbsp; <input type="radio" size="20" name="gender">Female</td>

</tr>
<tr>
<td><h3>DOB</h3></td>
<td><input type="text" value="" size="20" name="dob" id="dob"></td>
<td><h3>Qualification</h3></td>
<td><input type="text" value="" size="20" name="qualifiction" id="qualification"></td>
</tr>
<tr>
<td><h3>Mobile</h3></td>
<td><input type="text" value="" size="20" name="mobile" id="mobile" maxlength="10"></td>
<td><h3>photo</h3></td>
<td><input type="file" value="" size="10" name="photo" id="photo"></td>
</tr>
<tr>
<td><h3>Email</h3></td>
<td><input type="text" value="" size="20" name="email" id="email" ></td>
<td></td>
<td></td>
</tr>
<tr>
<td><h3>Password</h3></td>
<td><input type="password" value="" size="20" name="password" id="password" maxlength="20"></td>

</tr>
<tr>
<td><h3>Address</h3></td>
<td colspan="4"><input type="text" value="" size="80" name="address" id="address" maxlength="50"></td>
</tr>


</table>
</center>
</div>
<div id="save">
<center>
<input type="button" value="Save" size="20" name="save" onclick="signUp();">
</center>
</div>

</form>
</body>
</html>