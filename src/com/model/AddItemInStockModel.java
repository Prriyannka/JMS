package com.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="stocks")
public class AddItemInStockModel {
@Id
@GeneratedValue
private Long id=null;

@ManyToOne()
@JoinColumn(name="itemId",referencedColumnName="id")
private AddItemModel addItemModel=null;

@Transient
private Long itemId =null;

@Column
private String itemType="";


@Column
private Date dateOfPurchase;


@Column
private String vendorName="";

@Column
private String vendorAddress = "";

@Column
private String billNo="";

@Column
private Double paidAmount;

@Column
private Double remainingAmount;

@Column
private Integer itemQuantity;

@Column 
private Double itemWeight;

@Column
private Double ratePerGram;

@Column()
private Double amount;


@Column
private Double serviceTax;

@Column
private Double vat;

@Column
private Double anyOtherAmount;

@Column()
private Double totalAmount;

@Column()
private String remarks="";

public Long getId() {
	return id;
}

public void setId(Long id) {
	this.id = id;
}



public AddItemModel getAddItemModel() {
	return addItemModel;
}

public void setAddItemModel(AddItemModel addItemModel) {
	this.addItemModel = addItemModel;
}

public Long getItemId() {
	return itemId;
}

public void setItemId(Long itemId) {
	this.itemId = itemId;
}


public String getItemType() {
	return itemType;
}

public void setItemType(String itemType) {
	this.itemType = itemType;
}

public Date getDateOfPurchase() {
	return dateOfPurchase;
}

public void setDateOfPurchase(Date dateOfPurchase) {
	this.dateOfPurchase = dateOfPurchase;
}

public String getVendorName() {
	return vendorName;
}

public void setVendorName(String vendorName) {
	this.vendorName = vendorName;
}

public String getVendorAddress() {
	return vendorAddress;
}

public void setVendorAddress(String vendorAddress) {
	this.vendorAddress = vendorAddress;
}

public String getBillNo() {
	return billNo;
}

public void setBillNo(String billNo) {
	this.billNo = billNo;
}

public Double getPaidAmount() {
	return paidAmount;
}

public void setPaidAmount(Double paidAmount) {
	this.paidAmount = paidAmount;
}

public Double getRemainingAmount() {
	return remainingAmount;
}

public void setRemainingAmount(Double remainingAmount) {
	this.remainingAmount = remainingAmount;
}

public Integer getItemQuantity() {
	return itemQuantity;
}

public void setItemQuantity(Integer itemQuantity) {
	this.itemQuantity = itemQuantity;
}

public Double getItemWeight() {
	return itemWeight;
}

public void setItemWeight(Double itemWeight) {
	this.itemWeight = itemWeight;
}

public Double getRatePerGram() {
	return ratePerGram;
}

public void setRatePerGram(Double ratePerGram) {
	this.ratePerGram = ratePerGram;
}

public Double getAmount() {
	return amount;
}

public void setAmount(Double amount) {
	this.amount = amount;
}

public Double getServiceTax() {
	return serviceTax;
}

public void setServiceTax(Double serviceTax) {
	this.serviceTax = serviceTax;
}

public Double getVat() {
	return vat;
}

public void setVat(Double vat) {
	this.vat = vat;
}

public Double getAnyOtherAmount() {
	return anyOtherAmount;
}

public void setAnyOtherAmount(Double anyOtherAmount) {
	this.anyOtherAmount = anyOtherAmount;
}

public Double getTotalAmount() {
	return totalAmount;
}

public void setTotalAmount(Double totalAmount) {
	this.totalAmount = totalAmount;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}





}