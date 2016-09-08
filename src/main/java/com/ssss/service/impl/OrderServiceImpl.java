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
	
	//���ɶ���
	public String submitOrder(String person,String address,String phone,Integer userID){
		User user =userDao.findByID(userID);
		
		//����ȡ��user��cart������Ԫ��
		List<Cart> cartList = orderDao.findCartByUserID(userID);
		Float totalMoney= new Float(0);
		
		//����cartList
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
			//�����ܼ�
			totalMoney = tempPrice * (tempCart.getQuantity()) +totalMoney;
		}
		
		//�ж��û��Ƿ����ö�Ȳ���
		Float userLeft = (stageDao.findCreditByID(user.getUserCredit()).getMaxOwe())-user.getUserOwe();
		if(totalMoney>userLeft)
		{
			return "oweTooMuch";
		}
		
		//�����ö���ڿ۳��ܼۣ������userOwe
		user.setUserOwe(user.getUserOwe()+totalMoney);
		userDao.update(user);
		//��list���ڴ�������½���order��id���ں�����order��һ������
		List<Integer> orderIDList = new ArrayList<Integer>();
		
		//preStage���ڼ�¼֮ǰһ�е�stage��currentOrderID���ڼ�¼��ǰ��orderID
		Integer preStage = 0;
		Integer currentOrderID = 0;
		Float currentPrice = new Float(0);		//�ݶ��ö����ܽ��Ϊ0
		
		//�ٴα���cartList����������ӵ�������
		for(int i =0;i<cartList.size();++i){
			Cart currentCart = cartList.get(i);
			//ȡ������ѡ��ĸ���Ʒ�ķ��ڵȼ�
			Integer currentStage = currentCart.getStageID();
			if(preStage != currentStage)
			{
				preStage = currentStage;	//����stageLevel
				//�½�һ��order
				OrderForm newOrder = new OrderForm();
				//��ȡһЩֵ
				Date currentDate = new Date();	//��ȡ��ǰ����
				String currentState = "0";	//�ݶ�״̬Ϊδ�ύ(0)
				currentPrice =(float) 0;
				
				//��ȡ��cart�ļ۸�
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
				//Ϊ�µ�order��ֵ
				newOrder.setAddress(address);
				newOrder.setOrderCreateTime(currentDate);
				newOrder.setOrderCredit(user.getUserCredit());
				newOrder.setOrderStage(currentStage);
				newOrder.setState(currentState);
				newOrder.setPhone(phone);
				newOrder.setReciever(person);
				newOrder.setUserID(userID);
				newOrder.setOrderPrice(currentPrice);
				
				//���½���order���뵽����,����currentOrderID��¼,����orderIDList��
				orderDao.addOrderForm(newOrder);
				currentOrderID = newOrder.getOrderID();
				orderIDList.add(currentOrderID);
				
				for(int j=0;j<tempTagList.size();++j){
					if((tempTagList.get(j).getTag()).equals(currentCart.getTag()))
					{
						//����Ʒ�Լ����������붩����
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
			//������еķ��ڵȼ�����ǰһ�еķ��ڵȼ���ֱ�Ӽ���ǰһ�е�order�У�����Ҫ�½�order
			else{
				//�����������Ķ���
				OrderForm orderForm = orderDao.findByID(currentOrderID);
				List<Tag> tempTagList=  goodsDao.findTagsByID(currentCart.getGoodsID());
				//Ѱ����ƥ���tag
				for(int j=0;j<tempTagList.size();++j){
					if((tempTagList.get(j).getTag()).equals(currentCart.getTag()))
					{
						Tag currentTag = tempTagList.get(j);
						//��ԭ���������ܼۼӵ����ڶ������ܼ���
						currentPrice = (tempTagList.get(j).getPrice())*(currentCart.getQuantity());
						orderForm.setOrderPrice(currentPrice+orderForm.getOrderPrice());
						orderDao.updateOrder(orderForm);
						
						//
						if(currentCart.getQuantity()>(tempTagList.get(j).getStorage()))
						{
							return "nostorage";
						}
						else{
							//���ٿ��
							currentTag.setStorage((currentTag.getStorage())-currentCart.getQuantity());
							goodsDao.updateTag(currentTag);
							
							//����Ʒ�����������
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
		//����ÿһ���½���order���н�һ���Ĵ�������orderIDList��
		for(int i=0;i<orderIDList.size();++i)
		{	
			//ͨ��orderID�ҵ�order
			Integer tempOrderID = orderIDList.get(i);
			OrderForm tempOrder = orderDao.findByID(tempOrderID);
			
			//�ҵ���ǰorder�ڵ�Ԫ�ػ�ȡ����Ӧ�ķ��ڵȼ�����ȡ��������
			CreditStage cs = new CreditStage();
			cs.setStageID(tempOrder.getOrderStage());
			cs.setCreditID(user.getUserCredit());
			float charge = stageDao.findStageChargeByID(cs);
			
			//�½�һ��֪ͨ����֪�û������������
			Message msg =new Message();
			msg.setMsgClass("1");
			msg.setMsgState("1");
			msg.setMsgTitle("�����¶����Ѿ�����");
			msg.setUserID(userID);
			
			//ʵ��Ӧ���ܼ�Ϊ��ԭ�ܼۣ�*����������+1��
			float totalTruePrice = tempOrder.getOrderPrice()*(charge/100 + 1);
			totalTruePrice =(float)(Math.round((totalTruePrice)*100))/100; //��������Ϊ2λС��
			
			//�õ�user�����õȼ��Լ����õȼ�����ϸ��Ϣ
			Integer creditLevel = user.getUserCredit();
			Credit credit = stageDao.findCreditByID(creditLevel);
			
			if(credit.getMaxPass() >= totalTruePrice && (user.getUserBadHistory()==0))	//�����ܽ����С�ڵ�������Զ����ͨ�����
			{
				tempOrder.setState("3");
				String content =user.getUserName()+",���ã������¶�������ţ�"+tempOrder.getOrderID()+"�Ѿ��ɹ����ɡ�"+"����<br>���ǽ�����֧�����һ�ڵĿ���󾡿����������ף��������죡";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
			}
			else if(user.getUserBadHistory()>0){
				String content =user.getUserName()+",���ã������¶�������ţ�"+tempOrder.getOrderID()+"�Ѿ��ɹ����ɡ�"+"����<br>���������������ڵĲ�����¼���������ǽ���������˹���ˡ�<br>���ǽ�����֧�����һ�ڵĿ���󾡿����������ף��������죡";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
				tempOrder.setState("6");	//����״̬Ϊ�˹����
			}
			else				//���ܽ����ڶ������Ҫ���
			{
				String content =user.getUserName()+",���ã������¶�������ţ�"+tempOrder.getOrderID()+"�Ѿ��ɹ����ɡ�"+"����<br>���ڶ����Ľ��ϴ��������ǽ���������˹���ˡ�<br>���ǽ�����֧�����һ�ڵĿ���󾡿����������ף��������죡";
				msg.setMsgContent(content);
				userDao.addMsg(msg);
				tempOrder.setState("6");	//����״̬Ϊ�˹����
			}
			
			//״̬�жϽ������ύ״̬
			orderDao.updateOrder(tempOrder);
			
			//��ʼ����orderDetail
			Integer tempStageNum = tempOrder.getOrderStage();
			float perPrice = totalTruePrice/(tempOrder.getOrderStage());	//ÿ��ʵ��Ӧ��
			perPrice =(float)(Math.round((perPrice)*100))/100; //��������Ϊ2λС��
			
			//���������ݸö�����״̬ȥ����orderDetail���Լ�¼ÿһ�ڵ�״̬(ÿһ�������м��ھ����ɼ�������)
			for(int k=0;k<tempStageNum;++k)	
			{
				//�½�һ��OrderDetail
				OrderDetail tempOrderDetail = new  OrderDetail();
				tempOrderDetail.setStageNo(k+1);	//��һ��ʱk=0���ʴ�k+1
				tempOrderDetail.setOrderID(tempOrderID);
				
				//����ÿ��ddl��ʱ��
				Calendar calendar = new GregorianCalendar(); 
				calendar.setTime(tempOrder.getOrderCreateTime()); 
				calendar.add(calendar.DATE,30*(k+1));	//ÿ��30��
				Date ddl=calendar.getTime();
				tempOrderDetail.setDeadline(ddl);
				
				if(k==0)	//��һ�ڱȽ����⣬�����⴦��
				{
					if(tempOrder.getState().equals("3")){	//����Ѿ�ͨ���Զ���˼��ȴ���һ��֧��
						tempOrderDetail.setState("2");		//��һ���Ѿ����Կ�ʼ֧��
					}
					else
					{
						tempOrderDetail.setState("1");
					}
					
					//�������������ڵ�һ��֧��
					float firstStagePrice = perPrice +  totalTruePrice - perPrice*tempStageNum;
					firstStagePrice = (float)(Math.round((firstStagePrice)*100))/100;
					tempOrderDetail.setStageMoney(firstStagePrice);
				}
				else	//��������
				{
					tempOrderDetail.setStageMoney(perPrice);
					tempOrderDetail.setState("1");
				}
				
				//��ֵ��ɺ�insert
				
				orderDao.addOrderDetail(tempOrderDetail);
			}
		}
		
		
		//��չ��ﳵ
		orderDao.deleteCartByID(userID);
		return "success";
	}
	
	public OrderForm findOrderByID(Integer orderID){
		return orderDao.findByID(orderID);
	}
	
	
	
	//ͨ��userID����user�Ĳ�����¼
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
	
	//ͨ������id��ѯ������Ʒ����Ϣ
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
				
		//�½���Ҫ����ı��һ��
		GoodsDetailInOrder temp = new GoodsDetailInOrder();
				
		//��ֵ
		temp.setGoodsID(goodsInOrder.getGoodsID());
		temp.setGoodsName(goods.getGoodsName());
		temp.setGoodsPictureID(goodsDao.findPictureIDByGoodsID(goodsID));
		temp.setQuantity(goodsInOrder.getQuantity());
		temp.setTag(currentTag);
		res.add(temp);
		}
		return res;
	}
	
	//�鿴�ҵĶ���
	public List<MyOrder> showMyOrder(Integer userID){	
		//����һ��ר�����ڴ������������
		List<MyOrder> res = new ArrayList<MyOrder>();
		//���²�����¼
		Integer bad = updateUserBadHistory(userID);
		//����orderList���Դ�Ÿ��û�����order�Ļ�����Ϣ
		List<OrderForm> orderList= orderDao.selectOrderByUserID(userID);
			
		//����orderList
		for(int i=0;i<orderList.size();++i){	
			OrderForm tempOrder = orderList.get(i);
				
			//�ȶԸ�order�����Ӧ��orderDetail����в�ѯ
			List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
			//��ʼ��
			Integer payedStage = 0;//(Ĭ��Ϊ0)
			Date currentDate = new Date();
			boolean complete = true;
			
			//��ȡÿ��ԭʼ����
			Float perMonth = (tempOrder.getOrderPrice())/(tempOrder.getOrderStage());
			//��ȡuser�����ܲ�������������
			Float perDayCharge = stageDao.findCreditByID(userDao.findByID(userID).getUserCredit()).getCharge();
			
			if(tempOrder.getState().equals("8"))	//���ԭ��������״̬����ʼ��Ϊδ���֧��(����)״̬�������ж�
			{
				tempOrder.setState("1");
			}
			
			//�����ñ������Ƿ������ڵĲ���,�Լ��������һ�ڵ�֧����ɵ�DetailID
			for(int j=0;j<orderDetailList.size();++j)
			{
				OrderDetail tempOrderDetail = orderDetailList.get(j);
					//������δ�ɿ�ʼ֧��״̬
					if(tempOrderDetail.getState().equals("1"))
					{	
						//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
						boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
						if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
						{
							tempOrderDetail.setState("4");
							tempOrder.setState("8");
							orderDao.updateOrderDetail(tempOrderDetail);
						}
						complete = false;
					}
					//�����ڿɿ�ʼ֧��δ֧�����״̬
					else if(tempOrderDetail.getState().equals("2"))
					{
						//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
						boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
						if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
						{
							
							tempOrderDetail.setState("4");
							tempOrder.setState("8");
							orderDao.updateOrderDetail(tempOrderDetail);
						}
						complete = false;
					}
					//����֧�����
					else if(tempOrderDetail.getState().equals("3"))
					{
						//��¼��֧����ɵ�stageNum ��orderDetailID
						 payedStage = tempOrderDetail.getStageNo();
					}
					
					//����һ��detail״̬Ϊ���ڣ�������order��״̬����Ϊ����
					else if(tempOrderDetail.getState().equals("4"))
					{
						
						tempOrder.setState("8");
						complete = false;
					}
				}
			
				//���ֻ����֧�����״̬������״̬Ϊ��֧�����
				if(complete == true)
					tempOrder.setState("7");
				
				//�õ���һ��֧�����ǵڼ��ڣ�����ǵ�һ�ڵĻ��򲻱䣬��Ҫ���ж�һ�µ�һ���Ƿ��Ѿ�֧����
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
				
				//����order�Ļ���״̬
				orderDao.updateOrder(tempOrder);
				//�õ���һ����Ҫ֧����stage��detail
				OrderDetail od = new OrderDetail();
				od.setOrderID(tempOrder.getOrderID());
				od.setStageNo(nextStage);
				OrderDetail nextDetail = orderDao.findOrderDetail(od);
				
				float nextStageMoney = perMonth;
				if(nextDetail.getState().equals("4"))	//�����ǰ��Ҫ֧���ĵ���������
				{
					//���Ҹ��û������õȼ�����Ӧ��ÿ�����ʣ����֮��
					float interest =1 + perDayCharge/10000;
					
					//��������߼��
					Calendar cal = Calendar.getInstance();  
				    cal.setTime(currentDate);  
				    long time1 = cal.getTimeInMillis();               
				    cal.setTime(nextDetail.getDeadline());  
				    long time2 = cal.getTimeInMillis();       
				    long between_days=(time2-time1)/(1000*3600*24);  
				    Integer days = (int) between_days;
				    
				    //���㲢��ΪС�������λ
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
				
				//���뷵�ص�list
				res.add(tempMyOrder);
			}
			return res;
		}
	
	//ͨ������id��ѯ�����������Ϣ
	public MyOrder findBasicInfo(Integer orderID)
	{
		OrderForm tempOrder = orderDao.findByID(orderID);
		MyOrder tempMyOrder = new MyOrder();
		Integer userID = tempOrder.getUserID();
		//�ȶԸ�order�����Ӧ��orderDetail����в�ѯ
		List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
		//��ʼ��
		Integer payedStage = 0;
		Date currentDate = new Date();
		boolean complete = true;
		
		//��ȡÿ��ԭʼ����
		Float perMonth = (tempOrder.getOrderPrice())/(tempOrder.getOrderStage());
		//��ȡuser�����ܲ�������������
		Float perDayCharge = stageDao.findCreditByID(userDao.findByID(userID).getUserCredit()).getCharge();
			
		if(tempOrder.getState()=="8")	//���ԭ��������״̬����ʼ��Ϊδ���֧��״̬�������ж�
		{
				tempOrder.setState("1");
		}
		for(int j=0;j<orderDetailList.size();++j)
		{
			OrderDetail tempOrderDetail = orderDetailList.get(j);
				//������δ�ɿ�ʼ֧��״̬
				if(tempOrderDetail.getState().equals("1"))
				{	
					//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
					{
						tempOrderDetail.setState("4");
						tempOrder.setState("8");
					}
					complete = false;
				}
				//�����ڿɿ�ʼ֧��δ֧�����״̬
				else if(tempOrderDetail.getState().equals("2"))
				{
					//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
					{
						
						tempOrderDetail.setState("4");
						tempOrder.setState("8");
					}
					complete = false;
				}
				//����֧�����
				else if(tempOrderDetail.getState().equals("3"))
				{
					//��¼��֧����ɵ�stageNum ��orderDetailID
					 payedStage = tempOrderDetail.getStageNo();
				}
				
				//����һ��detail״̬Ϊ���ڣ�������order��״̬����Ϊ����
				else if(tempOrderDetail.getState().equals("4"))
				{
					
					tempOrder.setState("8");
					complete = false;
				}
			}
			
		//���ֻ����֧�����״̬������״̬Ϊ��֧�����
		if(complete == true)
			tempOrder.setState("7");
		
		//�õ���һ��֧�����ǵڼ��ڣ�����ǵ�һ�ڵĻ��򲻱䣬��Ҫ���ж�һ�µ�һ���Ƿ��Ѿ�֧����
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
			

		//����order�Ļ���״̬
		orderDao.updateOrder(tempOrder);
		
		//�õ���һ����Ҫ֧����stage��detail
		OrderDetail od = new OrderDetail();
		od.setOrderID(tempOrder.getOrderID());
		od.setStageNo(nextStage);
		OrderDetail nextDetail = orderDao.findOrderDetail(od);
		
		float nextStageMoney = perMonth;
		if(nextDetail.getState().equals("4"))	//�����ǰ��Ҫ֧���ĵ���������
		{
			//���Ҹ��û������õȼ�����Ӧ��ÿ�����ʣ����֮��
			float interest =1 + perDayCharge/10000;
			
			//��������߼��
			Calendar cal = Calendar.getInstance();  
		    cal.setTime(currentDate);  
		    long time1 = cal.getTimeInMillis();               
		    cal.setTime(nextDetail.getDeadline());  
		    long time2 = cal.getTimeInMillis();       
		    long between_days=(time2-time1)/(1000*3600*24);  
		    Integer days = (int) between_days;
		    
		    //���㲢��ΪС�������λ
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
	
	//���ڶ���������Ϣ���м���
	public OrderForm lockSomeMsg(OrderForm order){
		String phone = order.getPhone();
		String address=order.getAddress();
		String receiver = order.getReciever();
		
		//�����ֻ���
		if(phone==null||phone.equals("")){
			order.setPhone("��");
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
	
	//֧���ҵĵ��ڳɹ�������ݿ���в���
	public void compeletePay(Integer orderID,Integer stageNo)
	{
		OrderDetail temp = new OrderDetail();
		temp.setOrderID(orderID);
		temp.setStageNo(stageNo);
			
		//���ڸ�stage��Ӧ��currentDetail
		OrderDetail currentDetail = orderDao.findOrderDetail(temp);
		//����������Ϊ��֧��
		currentDetail.setState("3");
		Date currentDate = new Date();
		currentDetail.setStagePayTime(currentDate);
		orderDao.updateOrderDetail(currentDetail);
			
		//�õ���һ��stage
		temp.setStageNo(stageNo+1);
		OrderDetail nextDetail = orderDao.findOrderDetail(temp);
		OrderForm currentOrder =  orderDao.findByID(orderID);
		//����ǵ�һ�����Ϊ�ȴ�����״̬
		if(stageNo==1){
			currentOrder.setState("4");
			orderDao.updateOrder(currentOrder);
		}
		else{
			//��������һ��
			if(currentOrder.getOrderStage()==stageNo)
			{
				//���¶����Ļ�����Ϣ
				currentOrder.setState("7");
				orderDao.updateOrder(currentOrder);
			}
			//����������һ��
			else{
			//����һ������Ϊ���Կ�ʼ֧��
			nextDetail.setState("2");
		}
		}
		//�۳��û���Ƿ����
		Float thisStage = currentOrder.getOrderPrice()/currentOrder.getOrderStage();
		thisStage =(float)(Math.round((thisStage)*100))/100; //��������Ϊ2λС��
		if(stageNo == 1){
			thisStage = currentOrder.getOrderPrice() - thisStage*(currentOrder.getOrderStage()-1);
		}
		thisStage =(float)(Math.round((thisStage)*100))/100; //��������Ϊ2λС��
		User user = userDao.findByID(currentOrder.getUserID());
		user.setUserOwe(user.getUserOwe()-thisStage);
		orderDao.updateOrder(currentOrder);
		//�����û��ۼƽ����жϣ��ж��û��Ƿ�������
		Float paid = orderDao.sumAllPaidByUserID(user.getUserID());	//�û���֧���Ľ��
		Credit currentCredit=stageDao.findCreditByMinLevelUp(stageDao.findMaxCredit(paid));
		Integer currentCreditID = currentCredit.getCreditID();
		if(currentCreditID != user.getUserCredit()){
			user.setUserCredit(currentCreditID);
			Message msg = new Message();
			msg.setMsgClass("1");
			msg.setMsgState("1");
			msg.setMsgTitle("�����û����õȼ��Ѿ�����");
			msg.setUserID(user.getUserID());
			String content = user.getUserName()+"����ϲ����<br>������֧����ȴﵽ��"+currentCredit.getMinLevelUp()+"0Ԫ,�����������õȼ��Ѿ���ߣ�<br>������ǰ�����ĸ������Ľ��и�����ϸ�Ĳ鿴��";
			msg.setMsgContent(content);
			userDao.addMsg(msg);
		}
		
		
		//updateUser
		userDao.update(user);
	}

	//ȷ�϶������ջ�����
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
	
	//���ᶩ������
	public void deleteOrder(Integer orderID){
		OrderForm order= orderDao.findByID(orderID);
		order.setState("2");
		orderDao.updateOrder(order);
	}
	
	//�����������޸�״̬
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
