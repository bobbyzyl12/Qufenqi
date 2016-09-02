package com.ssss.service;

import java.util.List;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.Tag;
import com.ssss.entity.User;

public interface GoodsService {
	public List<GoodsPack> findAll(PageModel<GoodsPack> pageModel);
	
	public Integer findAllCount(PageModel<GoodsPack> pageModel);
	
	public List<GoodsPack> searchAll(PageModel<GoodsPack> pageModel,String searchStr);
	
	public Integer searchAllCount(PageModel<GoodsPack> pageModel,String searchStr);
	
	public Goods findSameName(Goods goods);
	
	public String addGoods(Goods goods);
	
	public String addTag(Tag tag);
	
	public String addStage(GoodsStage goodsStage);
	
	public Goods findByID(Integer goodsID);
	
	public String updateGoods(Goods goods);
	
	public GoodsPack findGoodsPackByID(Integer goodsID);
	
	public List<Tag> findTagList(Integer goodsID);
	
	public String deleteAllStage(Integer goodsID);
	
	public String deleteAllTags(Integer goodsID);
	
	public String changeToHtml(String describe);
	
	public String changeToText(String describe);
}
