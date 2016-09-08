package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.GoodsDao;
import com.ssss.dao.OrderDao;
import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Cart;
import com.ssss.entity.Credit;
import com.ssss.entity.CreditStage;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.GoodsInOrder;
import com.ssss.entity.Message;
import com.ssss.entity.MyOrder;
import com.ssss.entity.OrderDetail;
import com.ssss.entity.OrderForm;
import com.ssss.entity.PageModel;
import com.ssss.entity.Tag;
import com.ssss.entity.User;
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
	
	//生成订单
	public String submitOrder(String person,String address,String phone,Integer userID){
		User user =userDao.findByID(userID);
		
		//先提取该user的cart内所有元素
		List<Cart> cartList = orderDao.findCartByUserID(userID);
		Float totalMoney= new Float(0);
		
		//遍历cartList
		for(int i =0;i<cartList.size();++i){
			Cart tempCart = cartList.get(i);
			Goods tempGoods = goodsDao.findByID(tempCart.getGoodsID());
			List<Tag> tempTagList=  goodsDao.findTagsByID(tempCart.getGoodsID());
			Float tempPrice= new Float(0);
			for(int j=0;j<tempTagList.size();++j){
				if((tempTagList.get(j).getTag()).equals(tempCart.getTag()))
				{
					tempPrice = tempTagList.get(j).getPrice();
					break;
				}
			}
			//计算总价
			totalMoney = tempPrice * (tempCart.getQuantity()) +totalMoney;
		}
		
		//判断用户是否信用额度不足
		Float userLeft = (stageDao.findCreditByID(user.getUserCredit()).getMaxOwe())-user.getUserOwe();
		if(totalMoney>userLeft)
		{
			return "oweTooMuch";
		}
		
		//在信用额度内扣除总价，即提高userOwe
		user.setUserOwe(user.getUserOwe()+totalMoney);
		userDao.update(user);
		//此list用于存放所有新建的order的id用于后续的order进一步处理
		List<Integer> orderIDList = new ArrayList<Integer>();
		
		//preStage用于记录之前一行的stage，currentOrderID用于记录当前的orderID
		Integer preStage = 0;
		Integer currentOrderID = 0;
		Float currentPrice = new Float(0);		//暂定该订单总金额为0
		
		//再次遍历cartList，将数据添加到订单内
		for(int i =0;i<cartList.size();++i){
			Cart currentCart = cartList.get(i);
			//取出改所选择的该商品的分期等级
			Integer currentStage = currentCart.getStageID();
			if(preStage != currentStage)
			{
				preStage = currentStage;	//更新stageLevel
				//新建一个order
				OrderForm newOrder = new OrderForm();
				//获取一些值
				Date currentDate = new Date();	//获取当前日期
				String currentState = "0";	//暂定状态为未提交(0)
				currentPrice =(float) 0;
				
				//获取该cart的价格
				List<Tag> tempTagList=  goodsDao.findTagsByID(currentCart.getGoodsID());
				for(int j=0;j<tempTagList.size();++j){
					if((tempTagList.get(j).getTag()).equals(currentCart.getTag()))
					{
						Tag currentTag = tempTagList.get(j);
						currentPrice = (tempTagList.get(j).getPrice())*(currentCart.getQuantity());
						Goods goods=goodsDao.findByID(currentCart.getGoodsID());
						if(currentCart.getQuantity()>(tempTagList.get(j).getStorage()))
						{
							return "nostorage";
						}
						else{
							currentTag.setStorage((currentTag.getStorage())-currentCart.getQuantity());
							goodsDao.updateTag(currentTag);
						}
						break;
					}
				}
				//为新的order赋值
				newOrder.setAddress(address);
				newOrder.setOrderCreateTime(currentDate);
				newOrder.setOrderCredit(user.getUserCredit());
				newOrder.setOrderStage(currentStage);
				newOrder.setState(currentState);
				newOrder.setPhone(phone);
				newOrder.setReciever(person);
				newOrder.setUserID(userID);
				newOrder.setOrderPrice(currentPrice);
				
				//将新建的order插入到表中,并将currentOrderID记录,放入orderIDList中
				orderDao.addOrderForm(newOrder);
				currentOrderID = newOrder.getOrderID();
				orderIDList.add(currentOrderID);
				
				for(int j=0;j<tempTagList.size();++j){
					if((tempTagList.get(j).getTag()).equals(currentCart.getTag()))
					{
						//将商品以及其数量放入订单中
						GoodsInOrder goodsInOrder =new GoodsInOrder();
						goodsInOrder.setGoodsID(currentCart.getGoodsID());
						goodsInOrder.setOrderID(currentOrderID);
						goodsInOrder.setQuantity(currentCart.getQuantity());
						goodsInOrder.setState("1");
						goodsInOrder.setTag(tempTagList.get(j).getTag());
						orderDao.addGoodsInOrder(goodsInOrder);
					}
				}
				
			}
			//如果此行的分期等级等于前一行的分期等级则直接加入前一行的order中，不需要新建order
			else{
				//现在所操作的订单
				OrderForm orderForm = orderDao.findByID(currentOrderID);
				List<Tag> tempTagList=  goodsDao.findTagsByID(currentCart.getGoodsID());
				//寻找相匹配的tag
				for(int j=0;j<tempTagList.size();++j){
					if((tempTagList.get(j).getTag()).equals(currentCart.getTag()))
					{
						Tag currentTag = tempTagList.get(j);
						//将原来订单的总价加到现在订单的总价上
						currentPrice = (tempTagList.get(j).getPrice())*(currentCart.getQuantity());
						orderForm.setOrderPrice(currentPrice+orderForm.getOrderPrice());
						orderDao.updateOrder(orderForm);
						
						//
						if(currentCart.getQuantity()>(tempTagList.get(j).getStorage()))
						{
							return "nostorage";
						}
						else{
							//减少库存
							currentTag.setStorage((currentTag.getStorage())-currentCart.getQuantity());
							goodsDao.updateTag(currentTag);
							
							//将商品添加至订单中
							GoodsInOrder goodsInOrder =new GoodsInOrder();
							goodsInOrder.setGoodsID(currentCart.getGoodsID());
							goodsInOrder.setOrderID(currentOrderID);
							goodsInOrder.setQuantity(currentCart.getQuantity());
							goodsInOrder.setState("1");
							goodsInOrder.setTag(tempTagList.get(j).getTag());
							orderDao.addGoodsInOrder(goodsInOrder);
							
						}
						break;
					}
				}
			}
		}
		//对于每一个新建的order进行进一步的处理（遍历orderIDList）
		for(int i=0;i<orderIDList.size();++i)
		{	
			//通过orderID找到order
			Integer tempOrderID = orderIDList.get(i);
			OrderForm tempOrder = orderDao.findByID(tempOrderID);
			
			//找到当前order内的元素获取所对应的分期等级，获取手续费率
			CreditStage cs = new CreditStage();
			cs.setStageID(tempOrder.getOrderStage());
			cs.setCreditID(user.getUserCredit());
			float charge = stageDao.findStageChargeByID(cs);
			
			//新建一条通知，告知用户订单生成情况
			Message msg =new Message();
			msg.setMsgClass("1");
			msg.setMsgState("1");
			msg.setMsgTitle("您的新订单已经生成");
			msg.setUserID(userID);
			
			//实际应付总价为（原总价）*（手续费率+1）
			float totalTruePrice = tempOrder.getOrderPrice()*(charge/100 + 1);
			totalTruePrice =(float)(Math.round((totalTruePrice)*100))/100; //四舍五入为2位小数
			
			//得到user的信用等级以及信用等级的详细信息
			Integer creditLevel = user.getUserCredit();
			Credit credit = stageDao.findCreditByID(creditLevel);
			
			if(credit.getMaxPass() >= totalTruePrice && (user.getUserBadHistory()==0))	//订单总金额若小于等于最大自动审核通过额度
			{
				tempOrder.setState("3");
				String content =user.getUserName()+",您好！您的新订单（编号："+tempOrder.getOrderID()+"已经成功生成。"+"）。<br>我们将在您支付完第一期的款项后尽快给您发货。祝您购物愉快！";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
			}
			else if(user.getUserBadHistory()>0){
				String content =user.getUserName()+",您好！您的新订单（编号："+tempOrder.getOrderID()+"已经成功生成。"+"）。<br>由于您曾经有逾期的不良记录，所以我们将对其进行人工审核。<br>我们将在您支付完第一期的款项后尽快给您发货。祝您购物愉快！";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
				tempOrder.setState("6");	//设置状态为人工审核
			}
			else				//若总金额大于额度则需要审核
			{
				String content =user.getUserName()+",您好！您的新订单（编号："+tempOrder.getOrderID()+"已经成功生成。"+"）。<br>由于订单的金额较大，所以我们将对其进行人工审核。<br>我们将在您支付完第一期的款项后尽快给您发货。祝您购物愉快！";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
				tempOrder.setState("6");	//设置状态为人工审核
			}
			
			//状态判断结束，提交状态
			orderDao.updateOrder(tempOrder);
			
			//开始生成orderDetail
			Integer tempStageNum = tempOrder.getOrderStage();
			float perPrice = totalTruePrice/(tempOrder.getOrderStage());	//每期实际应付
			perPrice =(float)(Math.round((perPrice)*100))/100; //四舍五入为2位小数
			
			//接下来根据该订单的状态去生成orderDetail表以记录每一期的状态(每一个订单有几期就生成几条数据)
			for(int k=0;k<tempStageNum;++k)	
			{
				//新建一个OrderDetail
				OrderDetail tempOrderDetail = new  OrderDetail();
				tempOrderDetail.setStageNo(k+1);	//第一期时k=0，故存k+1
				tempOrderDetail.setOrderID(tempOrderID);
				
				//计算每次ddl的时间
				Calendar calendar = new GregorianCalendar(); 
				calendar.setTime(tempOrder.getOrderCreateTime()); 
				calendar.add(calendar.DATE,30*(k+1));	//每期30天
				Date ddl=calendar.getTime();
				tempOrderDetail.setDeadline(ddl);
				
				if(k==0)	//第一期比较特殊，做特殊处理
				{
					if(tempOrder.getState().equals("3")){	//如果已经通过自动审核即等待第一次支付
						tempOrderDetail.setState("2");		//第一期已经可以开始支付
					}
					else
					{
						tempOrderDetail.setState("1");
					}
					
					//如果余数，则放在第一期支付
					float firstStagePrice = perPrice +  totalTruePrice - perPrice*tempStageNum;
					firstStagePrice = (float)(Math.round((firstStagePrice)*100))/100;
					tempOrderDetail.setStageMoney(firstStagePrice);
				}
				else	//其他期数
				{
					tempOrderDetail.setStageMoney(perPrice);
					tempOrderDetail.setState("1");
				}
				
				//赋值完成后insert
				
				orderDao.addOrderDetail(tempOrderDetail);
			}
		}
		
		
		//清空购物车
		orderDao.deleteCartByID(userID);
		return "success";
	}
	
	public OrderForm findOrderByID(Integer orderID){
		return orderDao.findByID(orderID);
	}
	
	
	
	//通过userID更新user的不良记录
	public Integer updateUserBadHistory(Integer userID){
			User user = userDao.findByID(userID);
			Date currentDate = new Date();
			Integer count=0;
			List<OrderForm> orderList = orderDao.selectOrderByUserID(userID);
			for(int i=0;i<orderList.size();++i){
				Integer orderID = orderList.get(i).getOrderID();
				List<OrderDetail> detailList = orderDao.findDetailByOrderID(orderID);
				for(int j=0;j<detailList.size();++j){
					OrderDetail detail = detailList.get(j);
					if(detail.getStagePayTime()==null){
						boolean compareDate =  currentDate.after(detail.getDeadline());
						if(compareDate){
							count =count+1;
						}
					}
					else{
						boolean compareDate =  (detail.getStagePayTime()).after(detail.getDeadline());
						if(compareDate){
							count =count+1;
						}
					}
				}
			}
			user.setUserBadHistory(count);
			userDao.update(user);
			return user.getUserBadHistory();
		}
	
	//通过订单id查询其中商品的信息
	public List<GoodsDetailInOrder> getGoodsDetail(Integer orderID){
			
		List<GoodsInOrder> goodsInOrderList = orderDao.findGoodsInOrderByOrderID(orderID);
			
		List<GoodsDetailInOrder> res = new ArrayList<GoodsDetailInOrder>();
		
		for(int i=0;i<goodsInOrderList.size();++i)
		{
			GoodsInOrder goodsInOrder = goodsInOrderList.get(i);
			Integer goodsID = goodsInOrder.getGoodsID();
			Goods goods = goodsDao.findByID(goodsID);
			Tag currentTag  =new Tag();
			List<Tag> tempTagList=  goodsDao.findTagsByID(goodsID);
			for(int j = 0;j<tempTagList.size();++j){
			if((tempTagList.get(j).getTag()).equals(goodsInOrder.getTag()))
			{
				currentTag = tempTagList.get(j);
				break;
			}
		}
				
		//新建需要输出的表的一行
		GoodsDetailInOrder temp = new GoodsDetailInOrder();
				
		//赋值
		temp.setGoodsID(goodsInOrder.getGoodsID());
		temp.setGoodsName(goods.getGoodsName());
		temp.setGoodsPictureID(goodsDao.findPictureIDByGoodsID(goodsID));
		temp.setQuantity(goodsInOrder.getQuantity());
		temp.setTag(currentTag);
		res.add(temp);
		}
		return res;
	}
	
	//查看我的订单
	public List<MyOrder> showMyOrder(Integer userID){	
		//创建一个专门用于创建结果的数组
		List<MyOrder> res = new ArrayList<MyOrder>();
		//更新不良记录
		Integer bad = updateUserBadHistory(userID);
		//创建orderList用以存放该用户所有order的基本信息
		List<OrderForm> orderList= orderDao.selectOrderByUserID(userID);
			
		//遍历orderList
		for(int i=0;i<orderList.size();++i){	
			OrderForm tempOrder = orderList.get(i);
				
			//先对该order及其对应的orderDetail表进行查询
			List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
			//初始化
			Integer payedStage = 0;//(默认为0)
			Date currentDate = new Date();
			boolean complete = true;
			
			//获取每月原始费用
			Float perMonth = (tempOrder.getOrderPrice())/(tempOrder.getOrderStage());
			//获取user所可能产生的逾期利率
			Float perDayCharge = stageDao.findCreditByID(userDao.findByID(userID).getUserCredit()).getCharge();
			
			if(tempOrder.getState().equals("8"))	//如果原来是逾期状态，初始化为未完成支付(正常)状态，重新判断
			{
				tempOrder.setState("1");
			}
			
			//遍历该表，发现是否有逾期的部分,以及获得最新一期的支付完成的DetailID
			for(int j=0;j<orderDetailList.size();++j)
			{
				OrderDetail tempOrderDetail = orderDetailList.get(j);
					//若处在未可开始支付状态
					if(tempOrderDetail.getState().equals("1"))
					{	
						//比较每一条的截止日期与当前日期的关系
						boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
						if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
						{
							tempOrderDetail.setState("4");
							tempOrder.setState("8");
							orderDao.updateOrderDetail(tempOrderDetail);
						}
						complete = false;
					}
					//若处在可开始支付未支付完成状态
					else if(tempOrderDetail.getState().equals("2"))
					{
						//比较每一条的截止日期与当前日期的关系
						boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
						if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
						{
							
							tempOrderDetail.setState("4");
							tempOrder.setState("8");
							orderDao.updateOrderDetail(tempOrderDetail);
						}
						complete = false;
					}
					//若已支付完成
					else if(tempOrderDetail.getState().equals("3"))
					{
						//记录已支付完成的stageNum 的orderDetailID
						 payedStage = tempOrderDetail.getStageNo();
					}
					
					//若有一条detail状态为逾期，将整个order的状态设置为逾期
					else if(tempOrderDetail.getState().equals("4"))
					{
						
						tempOrder.setState("8");
						complete = false;
					}
				}
			
				//如果只有已支付完成状态则设置状态为已支付完成
				if(complete == true)
					tempOrder.setState("7");
				
				//得到下一期支付的是第几期，如果是第一期的话则不变，需要再判断一下第一期是否已经支付了
				Integer nextStage = 0;
				if(payedStage == 1)
				{
					OrderDetail od =new OrderDetail();
					od.setOrderID(tempOrder.getOrderID());
					od.setStageNo(1);
					od =orderDao.findOrderDetail(od);
					if(od.getState().equals("3")&&(!tempOrder.getState().equals("7"))){
						nextStage = payedStage+1;
					}
					else{
						nextStage = payedStage;
					}
				}
				else
				{ 
					nextStage = payedStage+1;
				}
				
				//更新order的基本状态
				orderDao.updateOrder(tempOrder);
				//得到下一次需要支付的stage的detail
				OrderDetail od = new OrderDetail();
				od.setOrderID(tempOrder.getOrderID());
				od.setStageNo(nextStage);
				OrderDetail nextDetail = orderDao.findOrderDetail(od);
				
				float nextStageMoney = perMonth;
				if(nextDetail.getState().equals("4"))	//如果当前需要支付的当期是逾期
				{
					//查找该用户的信用等级所对应的每日利率（万分之）
					float interest =1 + perDayCharge/10000;
					
					//计算出两者间隔
					Calendar cal = Calendar.getInstance();  
				    cal.setTime(currentDate);  
				    long time1 = cal.getTimeInMillis();               
				    cal.setTime(nextDetail.getDeadline());  
				    long time2 = cal.getTimeInMillis();       
				    long between_days=(time2-time1)/(1000*3600*24);  
				    Integer days = (int) between_days;
				    
				    //计算并化为小数点后两位
				    nextStageMoney = nextStageMoney * (float) Math.pow(interest, days); 
				    nextStageMoney = (float)(Math.round((nextStageMoney)*100))/100;
				}
					
				MyOrder tempMyOrder = new MyOrder();
				
				tempMyOrder.setOrderID(tempOrder.getOrderID());
				tempMyOrder.setOrderTotalPrice(tempOrder.getOrderPrice());
				tempMyOrder.setOrderState(tempOrder.getState());
				tempMyOrder.setNextNo(nextDetail.getStageNo());
				tempMyOrder.setNextStagePrice(nextStageMoney);
				tempMyOrder.setDeadline(nextDetail.getDeadline());
				tempMyOrder.setTotalStageNum(tempOrder.getOrderStage());
				
				//加入返回的list
				res.add(tempMyOrder);
			}
			return res;
		}
	
	//通过订单id查询到其基础的信息
	public MyOrder findBasicInfo(Integer orderID)
	{
		OrderForm tempOrder = orderDao.findByID(orderID);
		MyOrder tempMyOrder = new MyOrder();
		Integer userID = tempOrder.getUserID();
		//先对该order及其对应的orderDetail表进行查询
		List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
		//初始化
		Integer payedStage = 0;
		Date currentDate = new Date();
		boolean complete = true;
		
		//获取每月原始费用
		Float perMonth = (tempOrder.getOrderPrice())/(tempOrder.getOrderStage());
		//获取user所可能产生的逾期利率
		Float perDayCharge = stageDao.findCreditByID(userDao.findByID(userID).getUserCredit()).getCharge();
			
		if(tempOrder.getState()=="8")	//如果原来是逾期状态，初始化为未完成支付状态，重新判断
		{
				tempOrder.setState("1");
		}
		for(int j=0;j<orderDetailList.size();++j)
		{
			OrderDetail tempOrderDetail = orderDetailList.get(j);
				//若处在未可开始支付状态
				if(tempOrderDetail.getState().equals("1"))
				{	
					//比较每一条的截止日期与当前日期的关系
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
					{
						tempOrderDetail.setState("4");
						tempOrder.setState("8");
					}
					complete = false;
				}
				//若处在可开始支付未支付完成状态
				else if(tempOrderDetail.getState().equals("2"))
				{
					//比较每一条的截止日期与当前日期的关系
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
					{
						
						tempOrderDetail.setState("4");
						tempOrder.setState("8");
					}
					complete = false;
				}
				//若已支付完成
				else if(tempOrderDetail.getState().equals("3"))
				{
					//记录已支付完成的stageNum 的orderDetailID
					 payedStage = tempOrderDetail.getStageNo();
				}
				
				//若有一条detail状态为逾期，将整个order的状态设置为逾期
				else if(tempOrderDetail.getState().equals("4"))
				{
					
					tempOrder.setState("8");
					complete = false;
				}
			}
			
		//如果只有已支付完成状态则设置状态为已支付完成
		if(complete == true)
			tempOrder.setState("7");
		
		//得到下一期支付的是第几期，如果是第一期的话则不变，需要再判断一下第一期是否已经支付了
		Integer nextStage = 0;
		if(payedStage == 1)
		{
			OrderDetail od =new OrderDetail();
			od.setOrderID(orderID);
			od.setStageNo(1);
			od =orderDao.findOrderDetail(od);
			if(od.getState().equals("3")){
				nextStage = payedStage+1;
			}
			else{
				nextStage = payedStage;
			}
		}
		else
		{ 
			nextStage = payedStage+1;
		}
			

		//更新order的基本状态
		orderDao.updateOrder(tempOrder);
		
		//得到下一次需要支付的stage的detail
		OrderDetail od = new OrderDetail();
		od.setOrderID(tempOrder.getOrderID());
		od.setStageNo(nextStage);
		OrderDetail nextDetail = orderDao.findOrderDetail(od);
		
		float nextStageMoney = perMonth;
		if(nextDetail.getState().equals("4"))	//如果当前需要支付的当期是逾期
		{
			//查找该用户的信用等级所对应的每日利率（万分之）
			float interest =1 + perDayCharge/10000;
			
			//计算出两者间隔
			Calendar cal = Calendar.getInstance();  
		    cal.setTime(currentDate);  
		    long time1 = cal.getTimeInMillis();               
		    cal.setTime(nextDetail.getDeadline());  
		    long time2 = cal.getTimeInMillis();       
		    long between_days=(time2-time1)/(1000*3600*24);  
		    Integer days = (int) between_days;
		    
		    //计算并化为小数点后两位
		    nextStageMoney = nextStageMoney * (float) Math.pow(interest, days); 
		    nextStageMoney = (float)(Math.round((nextStageMoney)*100))/100;
		}
		
		tempMyOrder.setOrderID(tempOrder.getOrderID());
		tempMyOrder.setOrderTotalPrice(tempOrder.getOrderPrice());
		tempMyOrder.setOrderState(tempOrder.getState());
		tempMyOrder.setNextNo(nextDetail.getStageNo());
		tempMyOrder.setNextStagePrice(nextStageMoney);
		tempMyOrder.setDeadline(nextDetail.getDeadline());
		tempMyOrder.setTotalStageNum(tempOrder.getOrderStage());
		
		return tempMyOrder;
		}
	
	//对于订单基础信息进行加密
	public OrderForm lockSomeMsg(OrderForm order){
		String phone = order.getPhone();
		String address=order.getAddress();
		String receiver = order.getReciever();
		
		//处理手机号
		if(phone==null||phone.equals("")){
			order.setPhone("无");
		}
		else{
			String newPhone = "";
			for (int i=0; i< phone.length(); ++i) {
				char temp =  phone.charAt(i);
					if(i>4&&i<8){
							temp='*';
					}
				newPhone = newPhone+temp;
			}
			order.setPhone(newPhone);
		}
		
		String newAddress = "";
		for (int i=0; i< address.length(); ++i) {
			char temp =  address.charAt(i);
				if(i>5&&i<address.length()-6){
						temp='*';
				}
			newAddress = newAddress+temp;
		}
		order.setAddress(newAddress);
		
		String newMan = "";
		for (int i=0; i< receiver.length(); ++i) {
			char temp =  receiver.charAt(i);
				if(i==1){
					temp='*';
				}
			newMan = newMan+temp;
		}
		order.setReciever(newMan);
		return order;
	}
	
	//支付我的当期成功后对数据库进行操作
	public void compeletePay(Integer orderID,Integer stageNo)
	{
		OrderDetail temp = new OrderDetail();
		temp.setOrderID(orderID);
		temp.setStageNo(stageNo);
			
		//现在该stage对应的currentDetail
		OrderDetail currentDetail = orderDao.findOrderDetail(temp);
		//将当期设置为已支付
		currentDetail.setState("3");
		Date currentDate = new Date();
		currentDetail.setStagePayTime(currentDate);
		orderDao.updateOrderDetail(currentDetail);
			
		//得到下一个stage
		temp.setStageNo(stageNo+1);
		OrderDetail nextDetail = orderDao.findOrderDetail(temp);
		OrderForm currentOrder =  orderDao.findByID(orderID);
		//如果是第一期则变为等待发货状态
		if(stageNo==1){
			currentOrder.setState("4");
			orderDao.updateOrder(currentOrder);
		}
		else{
			//如果是最后一期
			if(currentOrder.getOrderStage()==stageNo)
			{
				//更新订单的基础信息
				currentOrder.setState("7");
				orderDao.updateOrder(currentOrder);
			}
			//如果不是最后一期
			else{
			//将下一期设置为可以开始支付
			nextDetail.setState("2");
		}
		}
		//扣除用户的欠款金额
		Float thisStage = currentOrder.getOrderPrice()/currentOrder.getOrderStage();
		thisStage =(float)(Math.round((thisStage)*100))/100; //四舍五入为2位小数
		if(stageNo == 1){
			thisStage = currentOrder.getOrderPrice() - thisStage*(currentOrder.getOrderStage()-1);
		}
		thisStage =(float)(Math.round((thisStage)*100))/100; //四舍五入为2位小数
		User user = userDao.findByID(currentOrder.getUserID());
		user.setUserOwe(user.getUserOwe()-thisStage);
		orderDao.updateOrder(currentOrder);
		//对于用户累计进行判断，判定用户是否能升级
		Float paid = orderDao.sumAllPaidByUserID(user.getUserID());	//用户已支付的金额
		Credit currentCredit=stageDao.findCreditByMinLevelUp(stageDao.findMaxCredit(paid));
		Integer currentCreditID = currentCredit.getCreditID();
		if(currentCreditID != user.getUserCredit()){
			user.setUserCredit(currentCreditID);
			Message msg = new Message();
			msg.setMsgClass("1");
			msg.setMsgState("1");
			msg.setMsgTitle("您的用户信用等级已经提升");
			msg.setUserID(user.getUserID());
			String content = user.getUserName()+"，恭喜您！<br>由于您支付额度达到了"+currentCredit.getMinLevelUp()+"0元,所以您的信用等级已经提高！<br>您可以前往您的个人中心进行更加详细的查看！";
			msg.setMsgContent(content);
			userDao.addMsg(msg);
		}
		
		
		//updateUser
		userDao.update(user);
	}

	//确认订单已收货方法
	public void confirmRecieve(Integer orderID){
		OrderForm order= orderDao.findByID(orderID);
		Date date =new Date();
		if(order.getOrderStage()==1)
		{
			order.setState("7");
		}
		order.setOrderReachTime(date);
		order.setState("1");
		orderDao.updateOrder(order);
	}
	
	//冻结订单方法
	public void deleteOrder(Integer orderID){
		OrderForm order= orderDao.findByID(orderID);
		order.setState("2");
		orderDao.updateOrder(order);
	}
	
	//订单发货后修改状态
	public void sendOrder(Integer orderID){
		Date date =new Date();
		OrderForm order= orderDao.findByID(orderID);
		order.setOrderSendTime(date);
		order.setState("5");
		orderDao.updateOrder(order);
	}
	
	
	public List<OrderForm> findAllOrder(PageModel<OrderForm> pageModel){
		return orderDao.findAllOrder(pageModel);
	}
	
	public Integer findAllOrderCount(PageModel<OrderForm> pageModel){
		return orderDao.findAllOrderCount(pageModel);
	}
	
	public void updateOrderSendData(Integer orderID,String person,String address,String phone){
		OrderForm order = orderDao.findByID(orderID);
		order.setAddress(address);
		order.setPhone(phone);
		order.setReciever(person);
		orderDao.updateOrderSendData(order);
	}
}
