package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Credit;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.GoodsPack;
import com.ssss.entity.MyOrder;
import com.ssss.entity.OrderForm;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;
import com.ssss.service.OrderService;
import com.ssss.service.StageService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/page")
public class PageController {
	/*
	 * 主要用于控制各个页面之间跳转以及预加载，包括跳转到：
	 * 用户的主页，管理员的主页、审核员的主页
	 * 用户的登陆/注册，管理员的登陆、审核员的登陆页面
	 * 用户的我的信息，我的购物车，我的订单页面
	 * 商品详情，订单详情页面
	 * 管理员对用户，商品，订单信息的增加与修改页面
	 * 审核员的信用等级审核页面
	 * */


	@Autowired
	private UserService userService;
	
	@Autowired
	private StageService stageService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private OrderService orderService;
	/**
     * 跳转到主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToHomePage")
	public String jumpToHomePage(Map<String, Object> map,HttpSession session){
		Integer msgNum =(Integer) session.getAttribute("userMsgNum");
		map.put("msgNum",msgNum);
		return "homePage";
	}
	
	/**
     * 跳转到管理员的主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdminHome")
	public String jumpToAdminHome(){
		return "admin/adminHome";
	}
	
	/**
     * 跳转到审核员的主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManaHome")
	public String jumpToManaHome(){
		return "manager/manaHome";
	}
	
	/**
     * 跳转到用户的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToLogin")
	public String jumpToLogin(){
		return "loginPages/login";
	}
	
	
	/**
     * 跳转到用户的注册页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToSignin")
	public String jumpToSignin(){
		return "loginPages/signin";
	}
	
	/**
     * 跳转到管理员的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdminLogin")
	public String jumpToAdminLogin(){
		return "admin/adminLogin";
	}
	
	/**
     * 跳转到审核员的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManaLogin")
	public String jumpToManaLogin(){
		return "manager/managerLogin";
	}
	
	/**
     * 跳转到个人的资料消息
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyInfo")
	public String jumpToMyInfo(Map<String, Object> map,HttpSession session){
		Integer currentID= (Integer) session.getAttribute("userID");
		User currentUser = userService.findByID(currentID);
		userService.encryptUserMsg(currentUser);
		map.put("userInfo",currentUser);
		String userCreditName = stageService.findCreditNameByID(currentUser.getUserCredit());
		map.put("userCreditName",userCreditName);
		List<Float> stageChargeList = stageService.findStageChargeByCreditID(currentUser.getUserCredit());
		map.put("chargeList", stageChargeList);
		return "infoCenter/myInfo";
	}
	
	/**
     * 跳转到消息中心
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMsgInfo")
	public String jumpToMsgInfo(Map<String, Object> map,HttpSession session){
		Integer userID= (Integer) session.getAttribute("userID");
		map.put("msgList", userService.findAllMsg(userID));
		return "infoCenter/msgInfo";
	}
	
	/**
     * 跳转到订单中心（我的订单）
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyOrder")
	public String jumpToMyOrder(Map<String, Object> map,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		List<MyOrder> myOrderList=orderService.showMyOrder(userID);
		map.put("myOrderList", myOrderList);
		return "infoCenter/myOrder";
	}
	
	/**
     * 跳转到订单中心（我的订单）
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderDetail")
	public String jumpToOrderDetail(Integer orderID,Map<String, Object> map,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		OrderForm order = orderService.findOrderByID(orderID);
		List<GoodsDetailInOrder> goodsList = orderService.getGoodsDetail(orderID);
		MyOrder myOrder = orderService.findBasicInfo(orderID);
		order = orderService.lockSomeMsg(order);
		Float charge = stageService.findCharge(order.getOrderCredit(), order.getOrderStage());
		map.put("basicInfo",myOrder);
		map.put("charge", charge);
		map.put("goodsList", goodsList);
		map.put("order", order);
		return "infoCenter/orderDetail";
	}
	
	/**
     * 跳转到我的购物车
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyChart")
	public String jumpToMyChart(Map<String, Object> map,HttpSession session){
		Integer userID = (Integer)session.getAttribute("userID");
		List<GoodsInCart> goodsInCart=orderService.findGoodsInCart(userID);
		map.put("goodsInCartList", goodsInCart);
		return "infoCenter/myChart";
	}
	
	/**
     * 跳转到管理员的用户管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToUserAdmin")
	public String jumpToUserAdmin(PageModel<User> pageModel,Map<String, Object> map){		
		if (pageModel == null) {
			pageModel = new PageModel<User>();
		}
		pageModel.setPagesize(10);
		List<User> userList = userService.findAll(pageModel);
		pageModel.setTotalrecode(userService.findAllCount(pageModel));
		pageModel.setDatas(userList);
		map.put("userList", userList);
		map.put("pageModel", pageModel);
		return "admin/userAdmin";
	}
	
	/**
     * 跳转到管理员的商品管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToGoodsAdmin")
	public String jumpToGoodsAdmin(PageModel<GoodsPack> pageModel,Map<String, Object> map){		
		if (pageModel == null) {
			pageModel = new PageModel<GoodsPack>();
		}
		pageModel.setPagesize(10);
		List<GoodsPack> goodsList = goodsService.findAll(pageModel);
		pageModel.setTotalrecode(goodsService.findAllCount(pageModel));
		pageModel.setDatas(goodsList);
		map.put("goodsList", goodsList);
		map.put("pageModel", pageModel);
		return "admin/goodsAdmin";
	}
	
	/**
     * 跳转到管理员的信用管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToCreditAdmin")
	public String jumpToCreditAdmin(PageModel<Credit> pageModel,Map<String, Object> map){		
		if (pageModel == null) {
			pageModel = new PageModel<Credit>();
		}
		pageModel.setPagesize(10);
		List<Credit> creditList = stageService.findAllCredit(pageModel);
		pageModel.setTotalrecode(stageService.findAllCreditCount(pageModel));
		pageModel.setDatas(creditList);
		map.put("goodsList", creditList);
		map.put("pageModel", pageModel);
		return "admin/creditAdmin";
	}
	
	/**
     * 跳转到管理员的订单管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderAdmin")
	public String jumpToOrderAdmin(PageModel<GoodsPack> pageModel,Map<String, Object> map){		
		return "admin/orderAdmin";
	}
	
	/**
     * 跳转测试页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToTestPage")
	public String jumpToTestPage(Map<String, Object> map){		
		return "test";
	}
	
	
	
}
