<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Item In Stock</title>
<script>

	
	
	function saveItemInStock(){
		var itemName=$('#itemId').val();
		var dateOfPurchase=$('#dateOfPurchase').val();
		var vendorName=$('#vendorName').val();
		var itemQuantity=$('#itemQuantity').val();
		
		
		if(itemName=="0"){
			alert("Please Select Item Name");
			return false;
		}
		

		if(dateOfPurchase==""){
			alert("Please Select Date Of Purchase");
			return false;
		}

		if(vendorName==""){
			alert("Please Select Vendor Name");
			return false;
		}
		
		if(itemQuantity==""){
			alert("Please Select item Quantity");
			return false;
		}
		document.forms[0].action="<%=request.getContextPath()%>/saveItemInStock";
		document.forms[0].method="post";
		document.forms[0].submit();
	}
	
	$(function() {
		$("#dateOfPurchase").datepicker({
			dateFormat: "dd/mm/yy",
			changeMonth: true,
			changeYear: true
		});
	});

	
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

	function calculateAmount(){
		var itemWeight=$('#itemWeight').val()-0;
		var itemQuantity=$('#itemQuantity').val()-0;
		var ratePerGram=$('#ratePerGram').val()-0;
		var amount=$('#amount').val()-0;
		var serviceTax=$('#serviceTax').val()-0;
		var vat=$('#vat').val()-0;
		var anyOtherAmount=$('#anyOtherAmount').val()-0;
		var totalAmount=$('#totalAmount').val()-0;
		var paidAmount=$('#paidAmount').val()-0;
		var amount=(itemQuantity*ratePerGram*itemWeight);
		$('#amount').val(amount);
		var totalAmount=(amount+(amount*serviceTax)/100+(amount*vat)/100+anyOtherAmount);
		$('#totalAmount').val(totalAmount);
		var remainingAmount=(totalAmount-paidAmount);
		$('#remainingAmount').val(remainingAmount);
	}
	
	
</script>

<style type="text/css">
#boxed{
border:thin;
border-color:black;
border-style:solid;
height: 50px;
width: 850px;

margin-left:100px;
margin-bottom: 50px;
}
#table1 td{
padding-right: 50px;
}
 tr{
padding-bottom: 50px;
padding-top: 50px;
}
#table1 input{

background-color: transparent;
border-color: black;
margin: 10px;

}

</style>
</head>
<body>
<form>
<div id="wrapper">
		<%@ include file="/WEB-INF/jsp/header.jsp" %>
		
		
        <div id="page-wrapper">
<div id="boxed">
<h3 align="center">Add Item in Stock</h3>
</div>
<div id="table1">
<center>
<table>
<tr>
<td>Item Type</td>
<td><select name="itemType" id="itemType" class="form-control input-sm" onchange="getItemListOnTheBasisOfItemType(this.value)">
		<option value="0">--Select Categoty--</option>
		<option value="Gold">Gold</option>
		<option value="Silver">Silver</option>
		<option value="Artificial">Artificial</option>
	</select></td>
<td>Item Quantity</td>
<td><input type="text" value="" size="20" name="itemQuantity" id="itemQuantity" maxlength="10" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Item Name</td>
<td>
<div id="itemNameDiv">
<select name="itemId" id="itemId" class="form-control input-sm">
		<option value="0">--Select Categoty--</option>
		
</select>
</div>
</td>
<td>Item Weight(gm)</td>
<td><input type="text" value="" size="20" name="itemWeight" id="itemWeight" maxlength="10" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Date Of Purchase</td>
<td><input type="text" value="" size="20" name="dateOfPurchase" id="dateOfPurchase" class="form-control input-sm" readonly></td>
<td>Rate/Gram</td>
<td><input type="text" value="" size="20" name="ratePerGram" id="ratePerGram" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Vendor Name</td>
<td><input type="text" value="" size="20" name="vendorName" id="vendorName" maxlength="50" class="form-control input-sm"></td>
<td>Amount</td>
<td><input type="text" value="" size="20" name="amount" id="amount" readOnly class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Vendor Address</td>
<td><input type="text" value="" size="20" name="vendorAddress" id="vendorAddress" class="form-control input-sm"></td>
<td>Service Tax(%)</td>
<td><input type="text" value="" size="20" name="serviceTax" id="serviceTax" maxlength="15" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Bill No.</td>
<td><input type="text" value="" size="20" name="billNo" id="billNo" maxlength="20" class="form-control input-sm"></td>
<td>VAT(%)</td>
<td><input type="text" value="" size="20" name="vat" id="vat" maxlength="15" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr><tr>
<td>Paid Amount</td>
<td><input type="text" value="" size="20" name="paidAmount" id="paidAmount" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>
<td>Any Other Amount</td>
<td><input type="text" value="" size="20" name="anyOtherAmount" id="anyOtherAmount" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Remaining Amount</td>
<td><input type="text" value="" size="20" name="remainingAmount" id="remainingAmount" readonly class="form-control input-sm"></td>
<td>Total Amount</td>
<td><input type="text" value="" size="20" name="totalAmount" id="totalAmount" readonly="readonly" class="form-control input-sm" onkeypress="calculateAmount()" onkeyup="calculateAmount()"></td>

</tr>
<tr>
<td>Remarks</td>
<td colspan="3"><input type="text" value="" size="80" name="remarks" maxlength="200" class="form-control input-sm"></td>
<tr>
<tr>
	<td colspan="3">${message}</td>
	</tr> 
</table>
</center>
</div>
<div id="save">
<center>
<input type="button" value="Save" size="20" name="save" onclick="saveItemInStock()" class="btn btn-success">
</center>
</div>
</div>
</div>
</form>
</body>
</html>