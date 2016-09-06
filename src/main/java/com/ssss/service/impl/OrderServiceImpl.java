package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.GoodsDao;
import com.ssss.dao.OrderDao;
import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Cart;
import com.ssss.entity.CreditStage;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.Tag;
import com.ssss.service.OrderService;

@Service(value = "orderService")
@Transactional
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private StageDao stageDao;
	@Autowired
	private UserDao userDao;
	
	public void addCart(Cart cart){
		if(orderDao.findIfExist(cart)==null)
		{orderDao.addCart(cart);}
		else {
			Cart oldCart = orderDao.findIfExist(cart);
			Integer quantity = (oldCart.getQuantity()) + (cart.getQuantity());
			oldCart.setQuantity(quantity);
			orderDao.updateCartQuantity(oldCart);
		}
	}
	
	public List<Cart> findCartByUserID(Integer userID){
		return orderDao.findCartByUserID(userID);
	}
	
	public void deleteCartByID(Integer userID){
		orderDao.deleteCartByID(userID);
	}
	
	public List<GoodsInCart> findGoodsInCart(Integer userID){
		List<GoodsInCart> resList  = new ArrayList<GoodsInCart>();
		List<Cart> cart = orderDao.findCartByUserID(userID);
		for(int i=0;i<cart.size();++i){
			Cart current= cart.get(i);
			GoodsInCart temp = new GoodsInCart();
			Integer goodsID=current.getGoodsID();
			temp.setGoods(goodsDao.findByID(current.getGoodsID()));
			temp.setGoodsStage(current.getStageID());
			temp.setPictureID(goodsDao.findPictureIDByGoodsID(goodsID));
			temp.setQuantity(current.getQuantity());
			List<Tag> tagList = goodsDao.findTagsByID(goodsID);
			Float goodsPrice = new Float(0);
			for(int j=0;j<tagList.size();++j){
				if((tagList.get(j).getTag()).equals(current.getTag()))
				{
					temp.setTag(tagList.get(j));
					goodsPrice = tagList.get(j).getPrice();
					break;
				}
			}
			CreditStage cs= new CreditStage();
			cs.setCreditID(userDao.findByID(userID).getUserCredit());
			cs.setStageID(current.getStageID());
			Float charge = stageDao.findStageChargeByID(cs);
			Float goodsTotalPrice = goodsPrice * (1+charge / 100);
			temp.setGoodsTotalPrice(goodsTotalPrice);
			
			resList.add(temp);
		}

		return resList;
	}
	
	public void updateCart(Cart cart){
		orderDao.updateCartQuantity(cart);
	}
	
	public void deleteCartByAll(Cart cart){
		orderDao.deleteCartByAll(cart);
	}
}
