package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Cart;
import com.ssss.entity.GoodsInOrder;
import com.ssss.entity.OrderDetail;
import com.ssss.entity.OrderForm;

public interface OrderDao {
	void addCart(Cart cart);
	
	Cart findIfExist(Cart cart);
	
	OrderForm findByID(Integer orderID);
	
	List<Cart> findCartByUserID(Integer userID);
	
	void updateCartQuantity(Cart cart);
	
	void deleteCartByID(Integer userID);
	
	void deleteCartByAll(Cart cart);
	
	void addOrderForm(OrderForm orderForm);
	
	void updateOrder(OrderForm orderForm);
	
	void addGoodsInOrder(GoodsInOrder goodsInOrder);
	
	void updateGoodsInOrder(GoodsInOrder goodsInOrder);
	
	void addOrderDetail(OrderDetail orderDetail);
	
	void updateOrderDetailPayTime(OrderDetail orderDetail);
	
	void updateOrderDetail(OrderDetail orderDetail);
	
	void updateOrderDetailState(OrderDetail orderDetail);
	
	List<OrderForm> selectOrderByUserID(Integer userID);
	
	List<OrderDetail> findDetailByOrderID(Integer orderID);
	
	OrderDetail findOrderDetail(OrderDetail orderDetail);
	
	List<GoodsInOrder> findGoodsInOrderByOrderID(Integer orderID);
}
