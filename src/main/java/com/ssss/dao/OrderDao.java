package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Cart;

public interface OrderDao {
	void addCart(Cart cart);
	
	Cart findIfExist(Cart cart);
	
	List<Cart> findCartByUserID(Integer userID);
	
	void updateCartQuantity(Cart cart);
	
	void deleteCartByID(Integer userID);
	
	void deleteCartByAll(Cart cart);
}
