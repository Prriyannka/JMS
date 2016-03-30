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
<title>Show Item In Stock</title>
<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;


margin-bottom: 50px;
}
#table1{
overflow: auto; overflow :scroll;
width: 700px;
height:400px;
}

</style>

</head>
<body>
<form>
<div id="wrapper">
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<div id="page-wrapper">
<div id="boxed">
<h3 align="center">Item In Stock</h3>
</div>

<div id="table1">
<center>
<table border="2px" >
<tr>


<th>Item Type</th>
<th>item Name</th>
<th>Date Of Purchase</th>
<th>Vendor Name</th>
<th>Vendor Address</th>
<th>Bill No</th>
<th>Paid Amount</th>
<th>Remaining Amount</th>
<th>Item Quantity</th>
<th>Item Weight</th>
<th>Rate/Gram</th>
<th>Amount</th>
<th>Service Tax</th>
<th>VAT</th>
<th>Any Other Amount</th>
<th>Total Amount</th>
<th>Action</th>
</tr>

<c:choose>
<c:when test="${addItemInStockModels !=null && fn:length(addItemInStockModels) >0 }">

<c:forEach var="model" items="${addItemInStockModels}" varStatus="counter">
<tr>

<td><c:out value="${model.itemType}"/></td>
<td><c:out value="${model.addItemModel.itemName}"/></td>
<td><c:out value="${model.dateOfPurchase}"/></td>
<td><c:out value="${model.vendorName}"/></td>
<td><c:out value="${model.vendorAddress}"/></td>
<td><c:out value="${model.billNo}"/></td>
<td><c:out value="${model.paidAmount}"/></td>
<td><c:out value="${model.remainingAmount}"/></td>
<td><c:out value="${model.itemQuantity}"/></td>
<td><c:out value="${model.itemWeight}"/></td>
<td><c:out value="${model.ratePerGram}"/></td>
<td><c:out value="${model.amount}"/></td>
<td><c:out value="${model.serviceTax}"/></td>
<td><c:out value="${model.vat}"/></td>
<td><c:out value="${model.anyOtherAmount}"/></td>
<td><c:out value="${model.totalAmount}"/></td>
<td>
<a href="<%=request.getContextPath()%>/getStockItem/${model.id}">Update</a>&nbsp;&nbsp;
<%-- <a href="<%=request.getContextPath()%>/deleteStockItems/${model.id}">Delete</a> --%>

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
   
</form>
</body>
</html>