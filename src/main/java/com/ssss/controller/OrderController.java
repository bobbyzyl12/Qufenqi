package com.ssss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Cart;
import com.ssss.entity.Tag;
import com.ssss.service.OrderService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;
	
	
	/**
     * 
     * @param tagList
     * @return
     */
	@RequestMapping(value = "/addCart")
	@ResponseBody
	public String addCart(Integer goodsID,Integer quantity,String tag,Integer stageID,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		if(userID==null){return "unlogged";}
		else{
			if((userService.findByID(userID).getUserCredit()<=2)&&(stageID!=1)){
				return "lock";
			}
			else{
			Cart cart =new Cart();
			cart.setGoodsID(goodsID);
			cart.setQuantity(quantity);
			cart.setStageID(stageID);
			cart.setTag(tag);
			cart.setUserID(userID);
			orderService.addCart(cart);
			return "success";
			}
		}
	}
}
