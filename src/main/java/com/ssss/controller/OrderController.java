package com.ssss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Cart;
import com.ssss.entity.OrderForm;
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
	
	@RequestMapping(value = "/updateCart")
	@ResponseBody
	public String updateCart(Integer goodsID,Integer quantity,String tag,Integer stageID,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		Cart cart =new Cart();
		cart.setGoodsID(goodsID);
		cart.setQuantity(quantity);
		cart.setStageID(stageID);
		cart.setTag(tag);
		cart.setUserID(userID);
		orderService.updateCart(cart);
		return "success";
	}
	
	@RequestMapping(value = "/deleteCartByAll")
	@ResponseBody
	public String deleteCartByAll(Integer goodsID,String tag,Integer stageID,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		Cart cart =new Cart();
		cart.setGoodsID(goodsID);
		cart.setStageID(stageID);
		cart.setTag(tag);
		cart.setUserID(userID);
		orderService.deleteCartByAll(cart);
		return "success";
	}
	
	@RequestMapping(value = "/submitOrder")
	@ResponseBody
	public String submitOrder(String person,String address,String phone,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		return orderService.submitOrder(person,address,phone,userID);
	}
	
	@RequestMapping(value = "/payOrder")
	public String payOrder(Integer orderID,Integer stageNo,HttpSession session){
		orderService.compeletePay(orderID, stageNo);
		return "redirect:/page/jumpToMyOrder";
	}
	
	@RequestMapping(value = "/confirmRecieve")
	public String confirmRecieve(Integer orderID,HttpSession session){
		orderService.confirmRecieve(orderID);
		return "redirect:/page/jumpToMyOrder";
	}
	
	@RequestMapping(value = "/sendOrder")
	public String sendOrder(Integer orderID,HttpSession session){
		orderService.sendOrder(orderID);
		return "redirect:/page/jumpToOrderAdmin";
	}
	
	@RequestMapping(value = "/findOrder")
	@ResponseBody
	public OrderForm findOrder(Integer orderID){
		return orderService.findOrderByID(orderID);
	}
	
	@RequestMapping(value = "/updateOrderSendData")
	@ResponseBody
	public String updateOrderSendData(Integer orderID,String person,String address,String phone,HttpSession session){
		orderService.updateOrderSendData(orderID,person,address,phone);
		return "successs";
	}
}
