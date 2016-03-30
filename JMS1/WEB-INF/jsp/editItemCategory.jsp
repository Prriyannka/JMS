<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Item Category</title>
<script type="text/javascript">
function updateItems(id){
	document.forms[0].action="<%=request.getContextPath()%>/updateItems/"+id;
	document.forms[0].method="post";
	document.forms[0].submit();
}

function pageOnLoad(){
	$('#itemName').val('${addItemModel.itemName}');
	$('#itemCode').val('${addItemModel.itemCode}');
	$('#itemType').val('${addItemModel.itemType}');
	
}
</script>
<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;


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
#update{
margin: 20px;
}
#update input{

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
<body onload="pageOnLoad()">
<form>
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
<div id="boxed">
<h3 align="center">Edit Item Category</h3>
</div>
<div id="table1">
<center>
<table>
<tr>
<td>Item Name</td>
<td><input type="text" value="" size="20" name=itemName id=itemName ></td>
</tr>
<tr>
<td>Item code</td>
<td><input type="text" value="" size="20" name=itemCode id=itemCode></td>
</tr>
<tr>
<td>Item type</td>
<td>
	<select name="itemType" id="itemType">
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
<div id="update">
<center>
<input type="button" value="Update" size="20" name="update" onclick="updateItems(${addItemModel.id});">
</center>
</div>
</div>
</div>

</form>
</body>
</html>