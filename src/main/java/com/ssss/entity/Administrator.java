package com.ssss.entity;

public class Administrator {
	private Integer adminID;
	private String adminName;
	private String adminPwd;
	private String adminState;
	/**
	 * @return the adminID
	 */
	public Integer getAdminID() {
		return adminID;
	}
	/**
	 * @param adminID the adminID to set
	 */
	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}
	/**
	 * @return the adminName
	 */
	public String getAdminName() {
		return adminName;
	}
	/**
	 * @param adminName the adminName to set
	 */
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	/**
	 * @return the adminPwd
	 */
	public String getAdminPwd() {
		return adminPwd;
	}
	/**
	 * @param adminPwd the adminPwd to set
	 */
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	/**
	 * @return the adminState
	 */
	public String getAdminState() {
		return adminState;
	}
	/**
	 * @param adminState the adminState to set
	 */
	public void setAdminState(String adminState) {
		this.adminState = adminState;
	}
}
