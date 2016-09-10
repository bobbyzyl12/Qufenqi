package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Cart;
import com.ssss.entity.Credit;
import com.ssss.entity.GoodsInOrder;
import com.ssss.entity.OrderDetail;
import com.ssss.entity.OrderForm;
import com.ssss.entity.PageModel;

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
	
	List<OrderForm> findAllOrders();
	
	List<OrderDetail> findDetailByOrderID(Integer orderID);
	
	OrderDetail findOrderDetail(OrderDetail orderDetail);
	
	List<GoodsInOrder> findGoodsInOrderByOrderID(Integer orderID);
	
	List<OrderForm> findAllOrder(PageModel<OrderForm> t);
	
	Integer findAllOrderCount(PageModel<OrderForm> t);
	
	void updateOrderSendData(OrderForm orderform);
	
	OrderForm findOrderToCheck();
	
	Float sumAllPaidByUserID(Integer userID);
	
	Float sumAllOweByUserID(Integer userID);
	
	Float sumAllOverTimeByUserID(Integer userID);
	
	Integer countAllPaidByUserID(Integer userID);
	
	Integer countAllOweByUserID(Integer userID);
	
	Integer countAllOverTimeByUserID(Integer userID);
	
	Integer countAllOthersByUserID(Integer userID);
	
	Float sumAllPaidPriceByUserID(Integer userID);
	
	Float sumAllOwePriceByUserID(Integer userID);
	
	Float sumAllOverTimePriceByUserID(Integer userID);
	
	Float sumAllOtherPriceByUserID(Integer userID);
	
}
