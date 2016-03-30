<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<script type="text/javascript">
function changePassword(){
	document.forms[0].action="<%=request.getContextPath()%>/changePassword";
	document.forms[0].method="post";
	document.forms[0].submit();	
	
}

</script>
<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 100px;

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
<body bgcolor="yellow">
<div id="wrapper">
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<div id="page-wrapper">
<div id="boxed">
<h3 align="center">Change Password</h3>
</div>
<div id="table1">
<center>
<table>


<tr>
<td>Old Password</td>
<td><input type="password" value="" size="20" name="oldPAssword"  id="oldPAssword" maxlength="15"></td>
</tr>

<tr>
<td>New Password</td>
<td><input type="text" value="" size="20" name="newPassword" id="newPassword" maxlength="15"></td>
</tr>

<tr>
<td>Confirm Password</td>
<td><input type="password" value="" size="20" name="confirmPassword" id="confirmPassword"></td>
</tr>
</table>
</center>
</div>
<div id="save">
<center>
<input type="button" value="Save" size="20" name="save" onclick="changePassword()">
</center>
</div>
</div>
</div>
</body>
</html>