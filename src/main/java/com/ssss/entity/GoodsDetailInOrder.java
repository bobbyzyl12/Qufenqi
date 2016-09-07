package com.ssss.entity;

public class GoodsDetailInOrder {
	private Integer goodsPictureID;
	private String goodsName;
	private Integer goodsID;
	private Integer quantity;
	private Tag tag;
	
	public Integer getGoodsPictureID() {
		return goodsPictureID;
	}
	public void setGoodsPictureID(Integer goodsPictureID) {
		this.goodsPictureID = goodsPictureID;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the tag
	 */
	public Tag getTag() {
		return tag;
	}
	/**
	 * @param tag the tag to set
	 */
	public void setTag(Tag tag) {
		this.tag = tag;
	}
	
}
