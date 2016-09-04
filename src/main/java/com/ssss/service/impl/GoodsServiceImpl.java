package com.ssss.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ssss.dao.GoodsDao;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.Picture;
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
			tempPack.setGoodsPictureID(goodsDao.findPictureByGoodsID(tempGoodsID).getPictureID());
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
	
	public List<GoodsPack> searchByClass(PageModel<GoodsPack> pageModel,String searchStr){
		List<Goods> goodsList = goodsDao.searchByClass(searchStr);
		
		if(goodsList==null){return null;}
		List<GoodsPack> searchedPack = new  ArrayList<GoodsPack>();
		//如果数量不足本页pageSize需要处理
		Integer pageSize =pageModel.getPagesize();
		Integer pageStart = pageModel.getPagestart();
		if(pageStart == null){pageStart =0;}
		for(int i=pageStart;i<(pageSize+pageStart);++i){
			if(i>=goodsList.size()){break;}
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
			tempPack.setGoodsPictureID(goodsDao.findPictureByGoodsID(tempGoodsID).getPictureID());
			
			List<Tag> tempTagList = new ArrayList<Tag>();
			
			List<Tag> resList = goodsDao.findTagsByID(temp.getGoodsID());
			for(int j=0;j<resList.size();++j)
			{
				Tag currentTag = resList.get(j);
				tempTagList.add(currentTag);
			}
			tempPack.setGoodsTag(tempTagList);
			
			searchedPack.add(tempPack);
		}
		
		return searchedPack;
	}
	
	public Integer searchByClassCount(PageModel<GoodsPack> pageModel,String searchStr){
		return goodsDao.searchByClassCount(searchStr);
	}
	
	@Transactional
	public Integer findAllCount(PageModel<GoodsPack> pageModel) {
		PageModel<Goods> goodsPageModel= new PageModel<Goods>();
		goodsPageModel.setPagesize(pageModel.getPagesize());
		goodsPageModel.setPagestart(pageModel.getPagestart());
		return goodsDao.findAllCount(goodsPageModel);
	}
	
	public List<GoodsPack> searchAll(PageModel<GoodsPack> pageModel,String searchStr){
		searchStr = "%"+searchStr+"%";
		List<Goods> goodsList = goodsDao.searchAll(searchStr);
		
		if(goodsList==null){return null;}
		List<GoodsPack> searchedPack = new  ArrayList<GoodsPack>();
		//如果数量不足本页pageSize需要处理
		Integer pageSize =pageModel.getPagesize();
		Integer pageStart = pageModel.getPagestart();
		if(pageStart == null){pageStart =0;}
		for(int i=pageStart;i<(pageSize+pageStart);++i){
			if(i>=goodsList.size()){break;}
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
			tempPack.setGoodsPictureID(goodsDao.findPictureByGoodsID(tempGoodsID).getPictureID());
			
			List<Tag> tempTagList = new ArrayList<Tag>();
			
			List<Tag> resList = goodsDao.findTagsByID(temp.getGoodsID());
			for(int j=0;j<resList.size();++j)
			{
				Tag currentTag = resList.get(j);
				tempTagList.add(currentTag);
			}
			tempPack.setGoodsTag(tempTagList);
			
			searchedPack.add(tempPack);
		}
		
		return searchedPack;
	}
	
	public Integer searchAllCount(PageModel<GoodsPack> pageModel,String searchStr){
		searchStr = "%"+searchStr+"%";
		return goodsDao.searchAllCount(searchStr);
	}
	
	
	
	@Transactional
	public Goods findSameName(Goods goods){
		return goodsDao.findByName(goods.getGoodsName());
	}
	
	@Transactional
	public String addGoods(Goods goods){
		String goodsDescribe = goods.getGoodsDescribe();
		goodsDescribe = changeToHtml(goodsDescribe);
		goods.setGoodsDescribe(goodsDescribe);
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
		Goods oldGoods = goodsDao.findByID(goods.getGoodsID());
		if(!(oldGoods.getGoodsName().equals(goods.getGoodsName()))){
			if(goodsDao.findByName(goods.getGoodsName())!=null){
				return "repeatName";
			}
		}
		goods.setGoodsState(oldGoods.getGoodsState());
		
		String goodsDescribe = goods.getGoodsDescribe();
		goodsDescribe = changeToHtml(goodsDescribe);
		goods.setGoodsDescribe(goodsDescribe);
		
		goodsDao.updateGoods(goods);
		return "success";
	}
	
	public GoodsPack findGoodsPackByID(Integer goodsID){
		GoodsPack goodsPack = new GoodsPack();
		Goods goods = goodsDao.findByID(goodsID);
		List<Tag> tagList = goodsDao.findTagsByID(goodsID);
		
		goodsPack.setGoodsBrand(goods.getGoodsBrand());
		goodsPack.setGoodsClass(goods.getGoodsClass());
		goodsPack.setGoodsDescribe(changeToText(goods.getGoodsDescribe()));
		goodsPack.setGoodsID(goodsID);
		goodsPack.setGoodsName(goods.getGoodsName());
		goodsPack.setGoodsState(goods.getGoodsState());
		goodsPack.setGoodsTag(tagList);
		goodsPack.setGoodsStage(goodsDao.findAllStages(goodsID));
		goodsPack.setGoodsPictureID(goodsDao.findPictureByGoodsID(goodsID).getPictureID());
		return goodsPack;
	}
	
	public List<Tag> findTagList(Integer goodsID){
		return goodsDao.findTagsByID(goodsID);
	}
	
	public String deleteAllStage(Integer goodsID){
		goodsDao.deleteAllStages(goodsID);
		return "success";
	}
	public String deleteAllTags(Integer goodsID){
		goodsDao.deleteAllTags(goodsID);
		return "success";
	}
	
	public String changeToHtml(String describe){
		describe =describe.replace("\n", "<br>");
		return describe;
	}
	
	public String changeToText(String describe){
		describe =describe.replace("<br>", "\n");
		return describe;
	}
	
	public GoodsPack packGoods(Goods goods){
		GoodsPack goodsPack = new GoodsPack();
		List<Tag> tagList = goodsDao.findTagsByID(goods.getGoodsID());
		
		goodsPack.setGoodsBrand(goods.getGoodsBrand());
		goodsPack.setGoodsClass(goods.getGoodsClass());
		goodsPack.setGoodsDescribe(changeToText(goods.getGoodsDescribe()));
		goodsPack.setGoodsID(goods.getGoodsID());
		goodsPack.setGoodsName(goods.getGoodsName());
		goodsPack.setGoodsState(goods.getGoodsState());
		goodsPack.setGoodsTag(tagList);
		goodsPack.setGoodsStage(goodsDao.findAllStages(goods.getGoodsID()));
		
		return goodsPack;
	}
	
	public Integer addPicture(MultipartFile pic1,Integer goodsID) throws IOException{
		byte[] b1 = pic1.getBytes();
		Picture pic = new Picture();
		pic.setGoodsID(goodsID);
		pic.setState("1");
		pic.setData(b1);
		goodsDao.addPicture(pic);
		return pic.getPictureID();
	}
	
	public Picture findPicture(Integer pictureID){
		return goodsDao.findPictureByID(pictureID);
	}
	
	public Integer findPictureIDByGoodsID(Integer goodsID){
		return goodsDao.findPictureIDByGoodsID(goodsID);
	}
	
	public void lockPicture(Integer goodsID){
		goodsDao.lockPicture(goodsID);
	}
	
	public String updatePicture(Picture pic){
		goodsDao.updatePicture(pic);
		return "success";
	}
}
