package com.ssss.entity;

public class GoodsInCart {
	private Goods goods;
	private Integer pictureID;
	private Tag tag;
	private Integer quantity;
	private Integer goodsStage;
	private Float goodsTotalPrice;
	
	/**
	 * @return the goods
	 */
	public Goods getGoods() {
		return goods;
	}
	/**
	 * @param goods the goods to set
	 */
	public void setGoods(Goods goods) {
		this.goods = goods;
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
	/**
	 * @return the quantity
	 */
	public Integer getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the goodsStage
	 */
	public Integer getGoodsStage() {
		return goodsStage;
	}
	/**
	 * @param goodsStage the goodsStage to set
	 */
	public void setGoodsStage(Integer goodsStage) {
		this.goodsStage = goodsStage;
	}
	/**
	 * @return the goodsTotalPrice
	 */
	public Float getGoodsTotalPrice() {
		return goodsTotalPrice;
	}
	/**
	 * @param goodsTotalPrice the goodsTotalPrice to set
	 */
	public void setGoodsTotalPrice(Float goodsTotalPrice) {
		this.goodsTotalPrice = goodsTotalPrice;
	}
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
}
