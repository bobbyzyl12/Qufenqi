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
			tempPack.setGoodsPicture(temp.getGoodsPicture());
			tempPack.setGoodsState(temp.getGoodsState());
			
			List<String> tagList =new ArrayList<String>();
			List<Integer> storageList =new ArrayList<Integer>(); 
			List<Float> priceList =new ArrayList<Float>();
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
}
