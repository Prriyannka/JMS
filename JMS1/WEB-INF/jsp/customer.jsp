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
<title>Add Item In Stock</title>
<script type="text/javascript">
function calculateAmount(){
	var weight=$('#weight').val()-0;
	var quantity=$('#quantity').val()-0;
	var ratePerGram=$('#ratePerGram').val()-0;
	var makingCharge=$('#makingCharge').val()-0;
	var serviceTax=$('#serviceTax').val()-0;
	var vat=$('#vat').val()-0;
	var anyOtherAmount=$('#anyOtherAmount').val()-0;
	var itemCost=$('#itemCost').val()-0;
	var totalAmount=$('#totalAmount').val()-0;
	var makingAmount=$('#makingAmount').val()-0;
	var itemCost=(quantity*ratePerGram*weight);
	$('#itemCost').val(itemCost);
	var makingAmount=(quantity*makingCharge*weight);
	$('#makingAmount').val(makingAmount);
	var totalAmount=(itemCost+makingAmount+(itemCost*serviceTax)/100+(itemCost*vat)/100+anyOtherAmount);
	$('#totalAmount').val(totalAmount);
	
}
function addCustomerSell(){
	var itemName=$('#itemId').val();
	var quantity=$('#quantity').val();
	var name=$('#name').val();
	var mobileNo=$('#mobileNo').val();
	
	
	if(itemName=="0"){
		alert("Please Select Item Name");
		return false;
	}
	

	if(quantity==""){
		alert("Please Select quantity");
		return false;
	}

	if(name==""){
		alert("Please Select  Name");
		return false;
	}
	
	if(mobileNo==""){
		alert("Please Select mobile No");
		return false;
	}
	document.forms[0].action="<%=request.getContextPath()%>/addCustomerSell";
	document.forms[0].method="post";
	document.forms[0].submit();
}
function getItemListOnTheBasisOfItemType(itemType)	{
	var xml =null;
	params="";
	try {
		var activexmodes = [ "Msxml2.XMLHTTP", "Microsoft.XMLHTTP" ]; 
		if (window.ActiveXObject) {
			for ( var i = 0; i < activexmodes.length; i++) {
				try {
					xml = new ActiveXObject(activexmodes[i]);
				} 
				catch (e) {
				}
			}
		} 
		else if (window.XMLHttpRequest){ 
			xml = new XMLHttpRequest();
		}
		xml.onreadystatechange = function() {
			if (xml.readyState == 4) {
				if (xml.status == 200 || window.location.href.indexOf("http") == -1) {
					document.getElementById("itemNameDiv").innerHTML = xml.responseText;
				} 
			}
		};
		xml.open("POST", "getItemListOnTheBasisOfItemType/"+itemType, false);
		xml.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xml.send(params);
	} 
	catch (e) {
		alert(e);
	}
}	

</script>
<style type="text/css">
#boxed{
border:thin;
border-color:navy blue;
border-style:solid;
height: 50px;
width: 850px;

padding-bottom:20px;
margin-bottom: 50px;
}

#table td{
padding-right: 50px;

}
#table1{

margin-top:30px;
border: thin;
border-color: black;
border-style: solid;
margin-bottom: 50px;
}
#table2 input{
background-color: Red;
height:30px;
width:120px;
border-color:activeborder;
outline-style: solid;
outline-width: 0.1px;
color: white;
border-style: groove;
-moz-border-radius: 9px;
  -webkit-border-radius: 9px;

}

#table1 td{
padding-right: 50px;
}
 
 tr{
 
padding-bottom: 50px;
padding-top: 20px;
}
table input{

background-color: transparent;
border-color: black;
margin: 10px;


}
table select{
margin-top: 10px;
padding-right: 50px;
width:200px;

}
#save input{
background-color: blue;
height:30px;
width:180px;
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
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
<div id="boxed">
<h3 align="center">Customer Selling Page</h3>
</div>

<div id="table">

<table>
<tr>
<td>Name</td>
<td><input type="text" value="${customerSellModel.name}" size="60" name="name" id="name" maxlength="50"></td>
</tr>
<tr>
<td>Mobile</td>
<td><input type="text" value="${customerSellModel.mobile}" size="40" name="mobile" id="mobile" maxlength="10"></td>
</tr>
<tr>
<td>Address</td>
<td><input type="text" value="${customerSellModel.address}" size="60" name="address" id="address" maxlength="250"></td>
</tr>
</table>
</div>
<div id="save">
<center>
<input type="button" value="Add More Items"  name="addMoreItems"  id="addMoreItems" onclick="addCustomerSell();" >
</center>
</div>






<div id="table1">
<center>
<fieldset>
 <legend style="color:blue;font-weight:bold;">Choose Item</legend>
<table>
<tr>
<td>Item Type</td>
<td><select name="itemType" id="itemType" onchange="getItemListOnTheBasisOfItemType(this.value)">
		<option value="0">--Select Categoty--</option>
		<option value="Gold">Gold</option>
		<option value="Silver">Silver</option>
		<option value="Artificial">Artificial</option>
	</select></td>
<td>Rate/Gram</td>
<td><input type="text" value="" name="ratePerGram" id="ratePerGram" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Item Name</td>
<td><div id="itemNameDiv"><select name="itemId" id="itemId">
		<option value="0">--Select Categoty--</option>
		
	</select></div></td>
<td>Item Cost</td>
<td><input type="text" value="" size="20" name="itemCost" id="itemCost" maxlength="10" readOnly></td>

</tr>
<tr>
<td>Item Quantity</td>
<td><input type="text" value="" size="20" name="quantity" id="quantity" maxlength="10" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
<td>Making Charge/Gram</td>
<td><input type="text" value="" size="20" name="makingCharge" id="makingCharge" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Weight</td>
<td><input type="text" value="" size="20" name="weight" id="weight" maxlength="50" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
<td>Making Amount</td>
<td><input type="text" value="" size="20" name="makingAmount" id="makingAmount" readOnly></td>

</tr>
<tr>
<td></td>
<td></td>
<td>Service Tax</td>
<td><input type="text" value="" size="20" name="serviceTax" id="serviceTax" maxlength="15" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td></td>
<td></td>
<td>VAT</td>
<td><input type="text" value="" size="20" name="vat" id="vat" maxlength="15" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr><tr>
<td></td>
<td></td>
<td>Any Other Amount</td>
<td><input type="text" value="" size="20" name="anyOtherAmount" id="anyOtherAmount" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td></td>
<td></td>
<td>Total Amount</td>
<td><input type="text" value="" size="20" name="totalAmount" id="totalAmount" readonly></td>

</tr>





</table>
</fieldset>
</center>
</div>

<div id="table2">
<center>
<table border="2px" align="left" width="1050"  cellspacing="0px">
<tr>
<td>Item Name</td>
<td>Item Type</td>
<td>Quantity</td>
<td>Weight</td>
<td>Rate/Gram</td>
<td>Item Cost</td>
<td>Making Charge/Gram</td>
<td>Making Amount</td>
<td>Other Amount</td>
<td>Total Amount</td>
<td>Action</td>
</tr>

<c:choose>
<c:when test="${customerSellModelList_saved !=null && fn:length(customerSellModelList_saved) >0 }">
<c:forEach var="model" items="${customerSellModelList_saved}" varStatus="counter">
<tr>
<td><c:out value="${model.itemId}"/></td>
<td><c:out value="${model.itemType}"/></td>
<td><c:out value="${model.quantity}"/></td>
<td><c:out value="${model.weight}"/></td>
<td><c:out value="${model.ratePerGram}"/></td>
<td><c:out value="${model.itemCost}"/></td>
<td><c:out value="${model.makingCharge}"/></td>
<td><c:out value="${model.makingAmount}"/></td>
<td><c:out value="${model.anyOtherAmount}"/></td>
<td><c:out value="${model.totalAmount}"/></td>
<td><a href="<%=request.getContextPath()%>/deleteCustomerSell/<c:out value="${model.id}"/>">Remove</a></td>


</tr>
</c:forEach>
</c:when>
</c:choose>
</table>
</center>
</div>

<div id="save">

<input type="button" value="Save"  name="save" >

<input type="button" value="Exit" name="exit">

</div>

</div>
</div>
</form>
</body>
</html>