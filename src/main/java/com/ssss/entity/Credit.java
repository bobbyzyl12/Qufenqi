package com.ssss.entity;

public class Credit {
	private Integer creditID;
	private String creditName;
	private Float charge;
	private Float maxPass;
	private Float maxOwe;
	private Float minLevelUp;
	/**
	 * @return the creditID
	 */
	public Integer getCreditID() {
		return creditID;
	}
	/**
	 * @param creditID the creditID to set
	 */
	public void setCreditID(Integer creditID) {
		this.creditID = creditID;
	}
	/**
	 * @return the creditName
	 */
	public String getCreditName() {
		return creditName;
	}
	/**
	 * @param creditName the creditName to set
	 */
	public void setCreditName(String creditName) {
		this.creditName = creditName;
	}
	/**
	 * @return the charge
	 */
	public Float getCharge() {
		return charge;
	}
	/**
	 * @param charge the charge to set
	 */
	public void setCharge(Float charge) {
		this.charge = charge;
	}
	/**
	 * @return the maxPass
	 */
	public Float getMaxPass() {
		return maxPass;
	}
	/**
	 * @param maxPass the maxPass to set
	 */
	public void setMaxPass(Float maxPass) {
		this.maxPass = maxPass;
	}
	/**
	 * @return the maxOwe
	 */
	public Float getMaxOwe() {
		return maxOwe;
	}
	/**
	 * @param maxOwe the maxOwe to set
	 */
	public void setMaxOwe(Float maxOwe) {
		this.maxOwe = maxOwe;
	}
	/**
	 * @return the minLevelUp
	 */
	public Float getMinLevelUp() {
		return minLevelUp;
	}
	/**
	 * @param minLevelUp the minLevelUp to set
	 */
	public void setMinLevelUp(Float minLevelUp) {
		this.minLevelUp = minLevelUp;
	}
}
