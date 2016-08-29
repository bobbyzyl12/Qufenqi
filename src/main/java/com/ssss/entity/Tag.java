package com.ssss.entity;

public class Tag {
	private Integer goodsID;
	private Float price;
	private String tag;
	private Integer storage;
	/**
	 * @return the storage
	 */
	public Integer getStorage() {
		return storage;
	}
	/**
	 * @param storage the storage to set
	 */
	public void setStorage(Integer storage) {
		this.storage = storage;
	}
	/**
	 * @return the tag
	 */
	public String getTag() {
		return tag;
	}
	/**
	 * @param tag the tag to set
	 */
	public void setTag(String tag) {
		this.tag = tag;
	}
	/**
	 * @return the price
	 */
	public Float getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(Float price) {
		this.price = price;
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
}
