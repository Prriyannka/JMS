<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successful</title>
<script type="text/javascript">
function back(){
	
	window.location.href="/JMS1/loadAddItemPage";
	
}

</script>
<style type="text/css">
#boxed{

border:medium;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;
margin-left: 100px;
padding-bottom:60px;
margin-bottom: 50px;
}

#back input{

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
<body>
 <div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
        <div id="page-wrapper">
<div id="boxed">
<h3 align="center">Add New Item Success</h3>
</div>
        <p>Request Submitted By You are:</p>
	<p>Item Name: ${addItemModel.itemName}</p>
	<p>Item Code: ${addItemModel.itemCode}</p>
	<p>Item Type: ${addItemModel.itemType}</p>
	<p>${message}</p>
        <div id="back">
        <input type="button" value="Back" name="back" onclick="back();">
        </div>
        </div>
        </div>
</body>
</html>