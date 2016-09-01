package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Administrator;
import com.ssss.entity.Manager;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
import com.ssss.service.StageService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	/*
	 * 主要用于处理用户信息相关的各项操作，具体包括
	 * 一般用户的登陆&注册,管理员与审核员的登陆
	 * */
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StageService stageService;
	/**
     * 用户登陆
     * @param id
     * @return
     */
	@RequestMapping(value="/login")
	@ResponseBody
    public String login(@RequestParam(value = "userName") String userName,@RequestParam(value = "userPwd") String userPwd,Map<String, Object> map,HttpSession session) throws Exception {
        User user = userService.checkLogin(userName, userPwd);
        if(user!=null){
        	 String state =user.getUserState();
             if(state.equals("3"))
             {
            	 return "locked";
             }
             else
             {
            	 session.setAttribute("userID", user.getUserID());
            	 session.setAttribute("userName", user.getUserName());
            	 
            	 Integer msgNum=userService.countMsgNum(user.getUserID());
            	 map.put("msgNum",msgNum);
            	 
            	 session.setAttribute("userMsgNum",msgNum);
            	 
            	 return "success";
            }           
        }
        else{
        	session.setAttribute("userID", null);
        	session.setAttribute("userName", null);
        	session.setAttribute("userMsgNum",null);
        	return "error";
        }
    }

	/**
     * 管理员登陆
     * @param id
     * @return
     */
	@RequestMapping(value="/managerLogin")
	@ResponseBody
    public String managerLogin(@RequestParam(value = "managerName") String managerName,@RequestParam(value = "managerPwd") String managerPwd,HttpSession session) throws Exception {
        Manager manager = userService.checkManagerLogin(managerName, managerPwd);
        if(manager!=null){
        	 String state =manager.getManagerState();
             if(state.equals("2"))
             {
            	 return "locked";
             }
             else
             {
            	 session.setAttribute("managerID", manager.getManagerID());
            	 session.setAttribute("managerName", manager.getManagerName());
            	 return "success";
            }           
        }
        else{
        	session.setAttribute("managerID", null);
       	 	session.setAttribute("managerName",null);
        	return "error";
        }
    }

	
	/**
     * 超级用户登陆
     * @param id
     * @return
     */
	@RequestMapping(value="/adminLogin")
	@ResponseBody
    public String adminLogin(@RequestParam(value = "adminName") String adminName,@RequestParam(value = "adminPwd") String adminPwd,HttpSession session) throws Exception {
        Administrator admin = userService.checkAdminLogin(adminName, adminPwd);
        if(admin!=null){
        	 String state =admin.getAdminState();
             if(state.equals("2"))
             {
            	 return "locked";
             }
             else
             {
            	 session.setAttribute("adminID", admin.getAdminID());
            	 session.setAttribute("adminName", admin.getAdminName());
            	 return "success";
            }           
        }
        else{
        	session.setAttribute("adminID", null);
       	 	session.setAttribute("adminName",null);
        	return "error";
        }
    }
	/**
     * 用户登出
     * @param 
     * @return
     */
	@RequestMapping(value="/logout")
    public String logout(HttpSession session){
        session.setAttribute("userID", null);
        session.setAttribute("userName", null);
        session.setAttribute("userMsgNum",null);
        return "redirect:/page/jumpToHomePage";
    }
	
	/**
     * 超级用户登出
     * @param 
     * @return
     */
	@RequestMapping(value="/adminLogout")
    public String adminLogout(HttpSession session){
        session.setAttribute("adminID", null);
        session.setAttribute("adminName", null);
        return "redirect:/page/jumpToHomePage";
    }
	
	/**
     * 审核员登出
     * @param 
     * @return
     */
	@RequestMapping(value="/managerLogout")
    public String managerLogout(HttpSession session){
        session.setAttribute("managerID", null);
        session.setAttribute("managerName", null);
        return "redirect:/page/jumpToHomePage";
    }
	
	/**
     * 添加信息(用户注册)
     * @param user
     * @return
     */
	@RequestMapping(value = "/signin")
	@ResponseBody
	public String signin(User user){
		user.setUserState("1");
		user.setUserOwe(0);
		user.setUserBadHistory(0);
		String identify=user.getUserIdentify();
		if(identify.equals("none")){
			user.setUserCredit(2);
		}
		else{
			user.setUserCredit(3);
		}
		
		if(userService.signin(user)=="success"){
			return "success";
		}
		else if(userService.signin(user)=="repeat"){
			return "repeat";
		}
		else if(userService.signin(user)=="repeatIdentify"){
			return "repeatIdentify";
		}
		else return "fail";
	}

	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updateName")
	@ResponseBody
	public String updateName(@RequestParam(value = "userName") String userName,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		User sameName = userService.findSameName(userName);
		if(sameName!=null)
			return "repeat";
		else{
			user.setUserName(userName);
			userService.update(user);
			return "success";
		}
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updatePwd")
	@ResponseBody
	public String updatePwd(String userPwd,String oldPwd,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		if(user.getUserPwd().equals(oldPwd)){
			user.setUserPwd(userPwd);
			userService.update(user);
			return "success";
		}
		else
		{
			return "oldPwdWrong";
		}
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updateIdentify")
	@ResponseBody
	public String updateIdentify(String userIdentify,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		if(userService.findSameIdentify(userIdentify)==null){
			user.setUserIdentify(userIdentify);
			userService.update(user);
			return "success";
		}
		else return "repeat";
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updateEmail")
	@ResponseBody
	public String updateEmail(String userEmail,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		user.setUserEmail(userEmail);
		userService.update(user);
		return "success";
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updatePhone")
	@ResponseBody
	public String updatePhone(String userPhone,HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		user.setUserPhone(userPhone);
		userService.update(user);
		return "success";
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/readMsg")
	@ResponseBody
	public String readMsg(Integer msgID,HttpSession session){
		Integer msgNum=(Integer) session.getAttribute("userMsgNum");
		if(userService.readMsg(msgID).equals("success")){
			msgNum--;
			session.setAttribute("userMsgNum", msgNum);
		}
		return "success";
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/applyUp")
	public String applyUp(HttpSession session){
		Integer userID = (Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		user.setUserState("2");
		userService.update(user);
		return "redirect:/page/jumpToMyInfo";
	}
	
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/deleteUser")
	@ResponseBody
	public String deleteUser(Integer userID){
		User user = userService.findByID(userID);
		user.setUserState("3");
		userService.update(user);
		return "success";
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/getUser")
	@ResponseBody
	public User getUser(Integer userID){
		User user = userService.findByID(userID);
		return user;
	}
	
	/**
     * 
     * @param user
     * @return
     */
	@RequestMapping(value = "/updateUser")
	@ResponseBody
	public String updateUser(User tempUser){
		return userService.updateUser(tempUser);
	}
	
}
