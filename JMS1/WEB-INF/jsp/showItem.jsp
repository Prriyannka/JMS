<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Item Category</title>
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
#table1{

overflow: auto; overflow :scroll;
height: 300px;
Width:500px;

}

</style>
</head>
<body bgcolor="yellow">
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">

<div id="boxed">
<h3 align="center">Show Item Category</h3>
</div>


<div id="table1" style="overflow: auto; overflow :scroll;">
<center>



<table border="2px"  cellspacing="0px" >
<tr>
<th>Item Name</th>
<th>Item Code</th>
<th>Item Type</th>
<th>Action</th>
</tr>

<c:choose>
<c:when test="${addItemModels !=null && fn:length(addItemModels) >0 }">
<c:forEach var="model" items="${addItemModels}" varStatus="counter">
<tr>
<td><c:out value="${model.itemName}"/></td>
<td><c:out value="${model.itemCode}"/></td>
<td><c:out value="${model.itemType}"/></td>
<td>
<a href="<%=request.getContextPath()%>/getItem/${model.id}">Update</a>&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/deleteItems/${model.id}">Delete</a>

</td>

</tr>
</c:forEach>
</c:when>
</c:choose>

</table>

</center>
</div>

${deleteMessage}
${updateMessage}
</div>
</div>

</body>
</html>
