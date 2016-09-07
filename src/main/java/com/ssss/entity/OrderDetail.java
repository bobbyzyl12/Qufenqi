package com.ssss.entity;

import java.util.Date;

public class OrderDetail {
	private Integer orderID;
	private Date deadline;
	private Integer stageNo;
	private String state;
	private Float stageMoney;
	private Date stagePayTime;
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public Integer getStageNo() {
		return stageNo;
	}
	public void setStageNo(Integer stageNo) {
		this.stageNo = stageNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Float getStageMoney() {
		return stageMoney;
	}
	public void setStageMoney(Float stageMoney) {
		this.stageMoney = stageMoney;
	}
	public Date getStagePayTime() {
		return stagePayTime;
	}
	public void setStagePayTime(Date stagePayTime) {
		this.stagePayTime = stagePayTime;
	}
	
}
