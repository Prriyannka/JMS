package com.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="customerSells")
public class CustomerSellModel {
	
	@Id
	@GeneratedValue
	private Long id=null;
	
	
	private String name="";
	private String mobile="";
	private String address="";
	private String itemType="";
	private Date entryDate=new Date();
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	@Transient
	private Long itemId=null;
	
	@ManyToOne
	@JoinColumn(name="itemId",referencedColumnName="id")
	AddItemModel addItemModel=null;
	
	public Double getItemCost() {
		return itemCost;
	}
	public void setItemCost(Double itemCost) {
		this.itemCost = itemCost;
	}
	private Double itemCost=null;
	private Double ratePerGram=null;
	private Double weight=null;
	private Double quantity=null;
	private Double makingCharge=null;
	private Double makingAmount=null;
	private Double amount=null;
	private Double serviceTax=null;
	private Double vat=null;
	private Double anyOtherAmount=null;
	private Double totalAmount=null;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public AddItemModel getAddItemModel() {
		return addItemModel;
	}
	public void setAddItemModel(AddItemModel addItemModel) {
		this.addItemModel = addItemModel;
	}
	public Double getRatePerGram() {
		return ratePerGram;
	}
	public void setRatePerGram(Double ratePerGram) {
		this.ratePerGram = ratePerGram;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Double getMakingCharge() {
		return makingCharge;
	}
	public void setMakingCharge(Double makingCharge) {
		this.makingCharge = makingCharge;
	}
	public Double getMakingAmount() {
		return makingAmount;
	}
	public void setMakingAmount(Double makingAmount) {
		this.makingAmount = makingAmount;
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
	
	
}
