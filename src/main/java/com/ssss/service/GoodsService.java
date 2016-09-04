package com.ssss.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.GoodsStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.Picture;
import com.ssss.entity.Tag;
import com.ssss.entity.User;

public interface GoodsService {
	public List<GoodsPack> findAll(PageModel<GoodsPack> pageModel);
	
	public Integer findAllCount(PageModel<GoodsPack> pageModel);
	
	public List<GoodsPack> searchAll(PageModel<GoodsPack> pageModel,String searchStr);
	
	public Integer searchAllCount(PageModel<GoodsPack> pageModel,String searchStr);
	
	public List<GoodsPack> searchByClass(PageModel<GoodsPack> pageModel,String searchStr);
	
	public Integer searchByClassCount(PageModel<GoodsPack> pageModel,String searchStr);
	
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
	
	public GoodsPack packGoods(Goods goods);
	
	public void addPicture(MultipartFile pic1) throws IOException;
	
	public Picture findPicture(Integer pictureID);
}
