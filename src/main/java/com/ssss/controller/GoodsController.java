package com.ssss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssss.service.GoodsService;

@Controller
@RequestMapping(value="/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
}
