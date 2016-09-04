package com.ssss.entity;

import java.util.List;

public class GoodsPack {
	private Integer goodsID;
	private String goodsName;
	private String goodsState;
	private String goodsDescribe;
	private String goodsBrand;
	private String goodsClass;
	private List<Tag> goodsTag;
	private Integer goodsPictureID;
	private List<Integer> goodsStage;
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
	 * @return the goodsName
	 */
	public String getGoodsName() {
		return goodsName;
	}
	/**
	 * @param goodsName the goodsName to set
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	/**
	 * @return the goodsClass
	 */
	public String getGoodsClass() {
		return goodsClass;
	}
	/**
	 * @param goodsClass the goodsClass to set
	 */
	public void setGoodsClass(String goodsClass) {
		this.goodsClass = goodsClass;
	}
	
	
	/**
	 * @return the goodsBrand
	 */
	public String getGoodsBrand() {
		return goodsBrand;
	}
	/**
	 * @param goodsBrand the goodsBrand to set
	 */
	public void setGoodsBrand(String goodsBrand) {
		this.goodsBrand = goodsBrand;
	}
	/**
	 * @return the goodsDescribe
	 */
	public String getGoodsDescribe() {
		return goodsDescribe;
	}
	/**
	 * @param goodsDescribe the goodsDescribe to set
	 */
	public void setGoodsDescribe(String goodsDescribe) {
		this.goodsDescribe = goodsDescribe;
	}
	/**
	 * @return the goodsState
	 */
	public String getGoodsState() {
		return goodsState;
	}
	/**
	 * @param goodsState the goodsState to set
	 */
	public void setGoodsState(String goodsState) {
		this.goodsState = goodsState;
	}
	
	/**
	 * @return the goodsTag
	 */
	public List<Tag> getGoodsTag() {
		return goodsTag;
	}
	/**
	 * @param goodsTag the goodsTag to set
	 */
	public void setGoodsTag(List<Tag> goodsTag) {
		this.goodsTag = goodsTag;
	}
	/**
	 * @return the goodsStage
	 */
	public List<Integer> getGoodsStage() {
		return goodsStage;
	}
	/**
	 * @param goodsStage the goodsStage to set
	 */
	public void setGoodsStage(List<Integer> goodsStage) {
		this.goodsStage = goodsStage;
	}
	/**
	 * @return the goodsPictureID
	 */
	public Integer getGoodsPictureID() {
		return goodsPictureID;
	}
	/**
	 * @param goodsPictureID the goodsPictureID to set
	 */
	public void setGoodsPictureID(Integer goodsPictureID) {
		this.goodsPictureID = goodsPictureID;
	}
	
}
