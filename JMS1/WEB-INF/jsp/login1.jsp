<!DOCTYPE html>
<html>
<head>

<title>JMS: Jewellery Management System</title>
<script>

function logIn(){

	document.forms[0].action="logIn";
		document.forms[0].submit();
}
function userRegistration(){
	document.forms[0].action="userRegistration";
		document.forms[0].submit();
	
}
</script>
<style type="text/css">
table{
padding-top: 80px;
}
table tr{
padding-bottom: 30px;
padding-top: 50px;
}
table input{
border-color:black;
outline-style: solid;
outline-width: 1px;
outline-color:black;
}
h3{
font-weight: 100;
font-family: serif;
}
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 250px;
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
<body style=" background-color:antiquewhite;">
<form>
<div id="boxed">
<h2 align="center" style="font-family:sans-serif; font-weight:bold;">Jewellery Management System</h2>
</div>

<table style="margin-left: 460px;">
<tr>
<td><h3>Username :</h3></td>
<td><input type="text" value="" size="30" name="userName" maxlength="50"></td>
</tr>
<tr>
<td><h3>Password :</h3></td>
<td><input type="password" value="" size="30" name="password" maxlength="15"></td>
</tr>
</table>
<div id="table2">
<table style="margin-left: 550px;">
<tr>
<td><input type="button" value="Sign In" name="signIn" onclick="logIn();" ></td>
<td></td>
<td></td>
<td></td>

<td><input type="button" value="Sign Up" name="signUp" onclick="userRegistration();" ></td>
</tr>
</table></div><br><br>


${message}
</form>
</body>
</html>
