package com.ssss.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.Tag;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;

@Controller
@RequestMapping(value="/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	/**
     * 
     * @param tagList
     * @return
     */
	@RequestMapping(value = "/addTag")
	@ResponseBody
	public String addTag(Tag tempTag,HttpSession session){
		Integer currentGoodsID = (Integer) session.getAttribute("goodsID");
		tempTag.setGoodsID(currentGoodsID);
		return goodsService.addTag(tempTag);
	}
	
	/**
     * 
     * @param goods
     * @return
     */
	@RequestMapping(value = "/addGoods")
	@ResponseBody
	public String addGoods(Goods tempGoods,HttpSession session){
		if((goodsService.findSameName(tempGoods))!=null){
			return "repeatName";
		}
		goodsService.addGoods(tempGoods);
		Goods currentGoods = goodsService.findSameName(tempGoods);
		Integer newGoodsID = currentGoods.getGoodsID();
		session.setAttribute("goodsID", newGoodsID);
		return "success";
	}
	
	/**
     * 
     * @param stageID
     * @return
     */
	@RequestMapping(value = "/addStage")
	@ResponseBody
	public String addStage(@RequestParam(value = "tempStage")Integer tempStage,HttpSession session){
		GoodsStage goodsStage = new GoodsStage();
		Integer currentGoodsID = (Integer) session.getAttribute("goodsID");
		goodsStage.setGoodsID(currentGoodsID);
		goodsStage.setStageID(tempStage);
		return goodsService.addStage(goodsStage);
	}
}
