package com.ssss.entity;

public class Message {
	private Integer msgID;
	private String msgTitle;
	private String msgContent;
	private String msgState;
	private String msgClass;
	private Integer userID;
	
	
	/**
	 * @return the msgID
	 */
	public Integer getMsgID() {
		return msgID;
	}
	/**
	 * @param msgID the msgID to set
	 */
	public void setMsgID(Integer msgID) {
		this.msgID = msgID;
	}
	/**
	 * @return the msgTitle
	 */
	public String getMsgTitle() {
		return msgTitle;
	}
	/**
	 * @param msgTitle the msgTitle to set
	 */
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	/**
	 * @return the msgState
	 */
	public String getMsgState() {
		return msgState;
	}
	/**
	 * @param msgState the msgState to set
	 */
	public void setMsgState(String msgState) {
		this.msgState = msgState;
	}
	/**
	 * @return the userID
	 */
	public Integer getUserID() {
		return userID;
	}
	/**
	 * @param userID the userID to set
	 */
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	/**
	 * @return the msgClass
	 */
	public String getMsgClass() {
		return msgClass;
	}
	/**
	 * @param msgClass the msgClass to set
	 */
	public void setMsgClass(String msgClass) {
		this.msgClass = msgClass;
	}
	/**
	 * @return the msgContent
	 */
	public String getMsgContent() {
		return msgContent;
	}
	/**
	 * @param msgContent the msgContent to set
	 */
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
}
