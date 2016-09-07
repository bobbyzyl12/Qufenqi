package com.ssss.entity;

import java.util.Date;

public class OrderForm {
	private Integer orderID;
	private Date orderCreateTime;
	private Integer orderStage;
	private Integer orderCredit;
	private String orderState;
	private Date orderSendTime;
	private Date orderReachTime;
	private Float orderPrice;
	private Integer userID;
	private String address;
	private String reciever;
	private String phone;
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Date getOrderCreateTime() {
		return orderCreateTime;
	}
	public void setOrderCreateTime(Date orderCreateTime) {
		this.orderCreateTime = orderCreateTime;
	}
	public Integer getOrderStage() {
		return orderStage;
	}
	public void setOrderStage(Integer orderStage) {
		this.orderStage = orderStage;
	}
	public Integer getOrderCredit() {
		return orderCredit;
	}
	public void setOrderCredit(Integer orderCredit) {
		this.orderCredit = orderCredit;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public Date getOrderSendTime() {
		return orderSendTime;
	}
	public void setOrderSendTime(Date orderSendTime) {
		this.orderSendTime = orderSendTime;
	}
	public Date getOrderReachTime() {
		return orderReachTime;
	}
	public void setOrderReachTime(Date orderReachTime) {
		this.orderReachTime = orderReachTime;
	}
	public Float getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Float orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReciever() {
		return reciever;
	}
	public void setReciever(String reciever) {
		this.reciever = reciever;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
