package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Goods;
import com.ssss.entity.PageModel;
import com.ssss.entity.Tag;
import com.ssss.entity.User;
import com.ssss.entity.GoodsStage;

public interface GoodsDao {
	void add(Goods goods);
	
	void addStage(GoodsStage goodsStage);
	
	void addTag(Tag temp);
	
	Goods findByID(Integer goodsID);
	
	Goods findByName(String goodsName);
	
	List<Tag> findTagsByID(Integer goodsID);
	
	List<Goods> findAll(PageModel<Goods> t);
	
	Integer findAllCount(PageModel<Goods> pageModel);

	List<Integer> findAllStages(Integer goodsID);
	
	void deleteAllStages(Integer goodsID);
	
	void updateGoods(Goods goods);
}
