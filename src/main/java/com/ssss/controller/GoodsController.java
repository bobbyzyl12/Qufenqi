package com.ssss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public String addTag(Tag tempTag){
		tempTag.setGoodsID(1);
		return "success";
	}
}
