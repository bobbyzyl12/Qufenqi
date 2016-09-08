package com.ssss.service;

import java.util.List;

import com.ssss.entity.Cart;
import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.MyOrder;
import com.ssss.entity.OrderForm;
import com.ssss.entity.PageModel;

public interface OrderService {
	public void addCart(Cart cart);
	
	public List<GoodsInCart> findGoodsInCart(Integer userID);
	
	public void updateCart(Cart cart);
	
	public String submitOrder(String person,String address,String phone,Integer userID);
	
	public void deleteCartByAll(Cart cart);
	
	public List<MyOrder> showMyOrder(Integer userID);
	
	public OrderForm findOrderByID(Integer orderID);
	
	public List<GoodsDetailInOrder> getGoodsDetail(Integer orderID);
	
	public MyOrder findBasicInfo(Integer orderID);
	
	public OrderForm lockSomeMsg(OrderForm order);
	
	public Integer updateUserBadHistory(Integer userID);
	
	public void compeletePay(Integer orderID,Integer stageNo);
	
	public void confirmRecieve(Integer orderID);
	
	public void sendOrder(Integer orderID);
	
	public void deleteOrder(Integer orderID);
	
	public List<OrderForm> findAllOrder(PageModel<OrderForm> pageModel);
	
	public Integer findAllOrderCount(PageModel<OrderForm> pageModel);
	
	public void updateOrderSendData(Integer orderID,String person,String address,String phone);
}
