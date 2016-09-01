package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.GoodsDao;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.Tag;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;

@Service(value = "goodsService")
@Transactional
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDao goodsDao;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<GoodsPack> findAll(PageModel<GoodsPack> pageModel) {
		//新建一个用于返回
		List<GoodsPack> goodsPack =  new  ArrayList<GoodsPack>();
		
		PageModel<Goods> goodsPageModel= new PageModel<Goods>();
		
		goodsPageModel.setPagesize(pageModel.getPagesize());
		goodsPageModel.setPagestart(pageModel.getPagestart());
		goodsPageModel.setPageNo(pageModel.getPageNo());
		goodsPageModel.setTotalpage(pageModel.getTotalpage());
		goodsPageModel.setTotalrecode(pageModel.getTotalrecode());
		
		List<Goods> goodsList=goodsDao.findAll(goodsPageModel);
		for(int i=0;i<goodsList.size();++i){
			Goods temp = goodsList.get(i);
			GoodsPack tempPack = new GoodsPack();
			
			tempPack.setGoodsID(temp.getGoodsID());
			tempPack.setGoodsBrand(temp.getGoodsBrand());
			tempPack.setGoodsClass(temp.getGoodsClass());
			tempPack.setGoodsDescribe(temp.getGoodsDescribe());
			tempPack.setGoodsName(temp.getGoodsName());
			tempPack.setGoodsState(temp.getGoodsState());
			Integer tempGoodsID = temp.getGoodsID();
			tempPack.setGoodsStage(goodsDao.findAllStages(tempGoodsID));
			
			List<Tag> tempTagList = new ArrayList<Tag>();
			
			List<Tag> resList = goodsDao.findTagsByID(temp.getGoodsID());
			for(int j=0;j<resList.size();++j)
			{
				Tag currentTag = resList.get(j);
				tempTagList.add(currentTag);
			}
			tempPack.setGoodsTag(tempTagList);
			
			
			
			goodsPack.add(tempPack);
		}
		
		return goodsPack;
	}
	
	@Transactional
	public Integer findAllCount(PageModel<GoodsPack> pageModel) {
		PageModel<Goods> goodsPageModel= new PageModel<Goods>();
		goodsPageModel.setPagesize(pageModel.getPagesize());
		goodsPageModel.setPagestart(pageModel.getPagestart());
		return goodsDao.findAllCount(goodsPageModel);
	}
	
	@Transactional
	public Goods findSameName(Goods goods){
		return goodsDao.findByName(goods.getGoodsName());
	}
	
	@Transactional
	public String addGoods(Goods goods){
		goodsDao.add(goods);
		return "success";
	}
	
	public String addTag(Tag tag){
		goodsDao.addTag(tag);
		return "success";
	}
	
	public String addStage(GoodsStage goodsStage){
		goodsDao.addStage(goodsStage);
		return "success";
	}
	
	public Goods findByID(Integer goodsID){
		return goodsDao.findByID(goodsID);
	}
	
	public String updateGoods(Goods goods){
		goodsDao.updateGoods(goods);
		return "success";
	}
	
	public GoodsPack findGoodsPackByID(Integer goodsID){
		GoodsPack goodsPack = new GoodsPack();
		Goods goods = goodsDao.findByID(goodsID);
		List<Tag> tagList = goodsDao.findTagsByID(goodsID);
		
		goodsPack.setGoodsBrand(goods.getGoodsBrand());
		goodsPack.setGoodsClass(goods.getGoodsClass());
		goodsPack.setGoodsDescribe(goods.getGoodsDescribe());
		goodsPack.setGoodsID(goodsID);
		goodsPack.setGoodsName(goods.getGoodsName());
		goodsPack.setGoodsState(goods.getGoodsState());
		goodsPack.setGoodsTag(tagList);
		goodsPack.setGoodsStage(goodsDao.findAllStages(goodsID));
		
		return goodsPack;
	}
	
	public List<Tag> findTagList(Integer goodsID){
		return goodsDao.findTagsByID(goodsID);
	}
}
