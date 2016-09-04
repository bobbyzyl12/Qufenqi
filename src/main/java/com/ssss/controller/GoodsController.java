package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.PageModel;
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
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/deleteGoods")
	@ResponseBody
	public String deleteGoods(Integer goodsID){
		Goods goods = goodsService.findByID(goodsID);
		goods.setGoodsState("2");
		return goodsService.updateGoods(goods);
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/reAddGoods")
	@ResponseBody
	public String reAddeGoods(Integer goodsID){
		Goods goods = goodsService.findByID(goodsID);
		goods.setGoodsState("1");
		return goodsService.updateGoods(goods);
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/getGoodsPack")
	@ResponseBody
	public GoodsPack getGoodsPack(Integer goodsID){
		GoodsPack goodsPack = goodsService.findGoodsPackByID(goodsID);
		return goodsPack;
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/getGoodsTag")
	@ResponseBody
	public Tag getGoodsTag(Integer goodsID,Integer no){
		List<Tag> tagList =goodsService.findTagList(goodsID);
		return tagList.get(no);
	}
	
	/**
     * 
     * @param goods
     * @return
     */
	@RequestMapping(value = "/updateGoods")
	@ResponseBody
	public String updateGoods(Goods goods){
		return goodsService.updateGoods(goods);
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/deleteAllStage")
	@ResponseBody
	public String deleteAllStage(Integer goodsID,HttpSession session){
		session.setAttribute("goodsID", goodsID);
		return goodsService.deleteAllStage(goodsID);
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/deleteAllTags")
	@ResponseBody
	public String deleteAllTags(Integer goodsID){
		return goodsService.deleteAllTags(goodsID);
	}
	
	/**
     * 
     * @param goodsID
     * @return
     */
	@RequestMapping(value = "/goodsDetail")
	public String goodsDetail(Integer goodsID,Map<String, Object> map,HttpSession session){
		GoodsPack temp=goodsService.findGoodsPackByID(goodsID);
		String describe = goodsService.changeToHtml(temp.getGoodsDescribe());
		temp.setGoodsDescribe(describe);
		map.put("goodsPack", temp);
		map.put("defaultPrice", temp.getGoodsTag().get(0).getPrice());
		map.put("defaultStorage", temp.getGoodsTag().get(0).getStorage());
		Float perMonth =(temp.getGoodsTag().get(0).getPrice());
		map.put("defaultPerMonth",perMonth);
		Integer msgNum =(Integer) session.getAttribute("userMsgNum");
		map.put("msgNum",msgNum);
		return "goodsPage/goodsDetail";
	}
	
	/**
     * 
     * @param searchContent
     * @return
     */
	@RequestMapping(value = "/searchAll")
	public String searchAll(@RequestParam(value = "searchContent") String searchContent,PageModel<GoodsPack> pageModel,Map<String, Object> map,HttpSession session){
		if(searchContent==null||searchContent==""){
			session.setAttribute("haveRes", "no");
			return "goodsPage/goodsView";
		}
		
		if (pageModel == null) {
			pageModel = new PageModel<GoodsPack>();
		}
		
		pageModel.setPagesize(20);
		
		List<GoodsPack> goodsList = goodsService.searchAll(pageModel,searchContent);
		if(goodsList.isEmpty()){
			session.setAttribute("haveRes", "no");
			return "goodsPage/goodsView";
		}
		
		pageModel.setTotalrecode(goodsService.searchAllCount(pageModel, searchContent));
		pageModel.setDatas(goodsList);
		session.setAttribute("haveRes", "yes");
		map.put("goodsList", goodsList);
		map.put("pageModel", pageModel);
		Integer msgNum =(Integer) session.getAttribute("userMsgNum");
		map.put("msgNum",msgNum);
		map.put("searchContent",searchContent);
		
		return "goodsPage/goodsView";
	}
	
	/**
     * 
     * @param searchContent
     * @return
     */
	@RequestMapping(value = "/searchByClass")
	public String searchByClass(@RequestParam(value = "searchContent")String searchContent,PageModel<GoodsPack> pageModel,Map<String, Object> map,HttpSession session){
		if(searchContent==null||searchContent==""){
			session.setAttribute("haveRes", "no");
			return "goodsPage/goodsViewClass";
		}
		
		if (pageModel == null) {
			pageModel = new PageModel<GoodsPack>();
		}
		
		pageModel.setPagesize(20);
		String truecontent = new String();
		
		if(searchContent.equals("1")){truecontent="手机通讯";}
		else if(searchContent.equals("2")){truecontent="电脑平板";}
		else if(searchContent.equals("3")){truecontent="腕表饰品";}
		else if(searchContent.equals("4")){truecontent="数码家电";}
		else if(searchContent.equals("5")){truecontent="家居家饰";}
		else if(searchContent.equals("6")){truecontent="家装建材";}
		else if(searchContent.equals("7")){truecontent="食品饮料";}
		else if(searchContent.equals("8")){truecontent="衣装服饰";}
		else if(searchContent.equals("9")){truecontent="鞋靴箱包";}
		else if(searchContent.equals("10")){truecontent="图书百货";}
		
		List<GoodsPack> goodsList = goodsService.searchByClass(pageModel,truecontent);
		if(goodsList.isEmpty()){
			session.setAttribute("haveRes", "no");
			return "goodsPage/goodsViewClass";
		}
		
		pageModel.setTotalrecode(goodsService.searchByClassCount(pageModel, truecontent));
		pageModel.setDatas(goodsList);
		session.setAttribute("haveRes", "yes");
		Integer msgNum =(Integer) session.getAttribute("userMsgNum");
		map.put("msgNum",msgNum);
		map.put("goodsList", goodsList);
		map.put("pageModel", pageModel);
		map.put("searchContent",searchContent);
		
		return "goodsPage/goodsViewClass";
	}
}
