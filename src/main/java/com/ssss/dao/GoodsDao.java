package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Goods;
import com.ssss.entity.PageModel;
import com.ssss.entity.Tag;
import com.ssss.entity.User;

public interface GoodsDao {
	void add(Goods goods);
	
	void addTag(Tag temp);
	
	List<Goods> findAll(PageModel<Goods> t);
	
	Integer findAllCount(PageModel<Goods> pageModel);

	List<Tag> findTagsByID(Integer goodsID);
}
