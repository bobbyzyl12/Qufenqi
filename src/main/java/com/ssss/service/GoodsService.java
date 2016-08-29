package com.ssss.service;

import java.util.List;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface GoodsService {
	public List<GoodsPack> findAll(PageModel<GoodsPack> pageModel);
	
	public Integer findAllCount(PageModel<GoodsPack> pageModel);
}
