package com.ssss.dao;

import com.ssss.entity.Cart;

public interface OrderDao {
	void addCart(Cart cart);
	
	void updateCartQuantity(Cart cart);
	
	void deleteCartByID(Integer userID);
	
	void deleteCartByAll(Cart cart);
}
