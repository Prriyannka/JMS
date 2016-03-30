<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Item Category</title>
<script type="text/javascript">
function saveAddNewItem(){
	document.forms[0].action="<%=request.getContextPath()%>/saveAddNewItem";
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
padding-bottom:60px;
margin-bottom: 50px;
}
#table1 input{

background-color: transparent;
border-color: black;
margin: 10px;
font-weight: normal;

}
#table1 select{

background-color: transparent;
border-color: black;
margin: 10px;
font-weight: normal;

}
#table1 td{
padding-right: 50px;
font-weight: 100;
font-family: sans-serif;
font-size: large;
}
#save{
margin: 20px;
}
#save input{



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

<body>
<form>

    <div id="wrapper" >
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper" >
<div id="boxed">
<h3 align="center">Add New Item Category</h3>
</div>
<div id="table1">
<center>
<table>
<tr>
<td>Item Name</td>
<td><input type="text" value="" size="20" name=itemName maxlength="50" class="form-control input-sm"></td>
</tr>
<tr>
<td>Item code</td>
<td><input type="text" value="" size="20" name=itemCode maxlength="20" class="form-control input-sm"></td>
</tr>
<tr>
<td>Item type</td>
<td>
	<select name="itemType" id="itemType" class="form-control input-sm" >
		<option value="0">--Select Categoty--</option>
		<option value="Gold">Gold</option>
		<option value="Silver">Silver</option>
		<option value="Artificial">Artificial</option>
	</select>
</td>
</tr>

</table>
</center>
</div>
<div id="save">
<center>
<input type="button" value="save" size="20" name="save" onclick="saveAddNewItem();" class="btn btn-success">
</center>


<h3>${message}</h3>
</div>
</div>
</div>
</form>
</body>

</html>