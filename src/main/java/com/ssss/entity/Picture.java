package com.ssss.entity;

public class Picture {
	private Integer pictureID;
	private byte[] data;
	private Integer goodsID;
	private String state;
	
	/**
	 * @return the pictureID
	 */
	public Integer getPictureID() {
		return pictureID;
	}
	/**
	 * @param pictureID the pictureID to set
	 */
	public void setPictureID(Integer pictureID) {
		this.pictureID = pictureID;
	}
	/**
	 * @return the data
	 */
	public byte[] getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(byte[] data) {
		this.data = data;
	}
	/**
	 * @return the goodsID
	 */
	public Integer getGoodsID() {
		return goodsID;
	}
	/**
	 * @param goodsID the goodsID to set
	 */
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

}
