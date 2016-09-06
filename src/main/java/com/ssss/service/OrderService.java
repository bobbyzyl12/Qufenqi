package com.ssss.service;

import java.util.List;

import com.ssss.entity.Cart;
import com.ssss.entity.GoodsInCart;

public interface OrderService {
	public void addCart(Cart cart);
	
	public List<GoodsInCart> findGoodsInCart(Integer userID);
	
	public void updateCart(Cart cart);
	
	public void deleteCartByAll(Cart cart);
}
