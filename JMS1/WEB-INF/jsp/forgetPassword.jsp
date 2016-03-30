<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password</title>
<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 200px;
margin-top:50px;
margin-bottom: 50px;
}
h3{
font-weight: 100;
}
#table1 input{

background-color: transparent;
border-color: black;
margin: 10px;


}
#table1 td{
padding-right: 50px;

}
#sendMe{
margin: 20px;
}
#sendMe input{

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
<body bgcolor="yellow">
<div id="boxed">
<h3 align="center">Forget Password</h3>
</div>
<div id="table1">
<center>
<table>
<tr>
<td>User Name</td>
<td><input type="text" value="" size="40" name=userName maxlength="50"></td>
</tr>
</table>
</center>
</div>
<div id="sendMe">
<center>
<input type="submit" value="Send Me" size="20" name="sendMe">
</center>
</div>
</body>
</html>