package com.ssss.service;

import java.util.List;

import com.ssss.entity.Administrator;
import com.ssss.entity.Manager;
import com.ssss.entity.Message;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserService{
	
	public User checkLogin(String userName, String userPwd);
	
	public Manager checkManagerLogin(String managerName,String managerPwd);
	
	public Administrator checkAdminLogin(String adminName,String adminPwd);
	
	public String signin(User user);
	
	public Integer countMsgNum(Integer userID);

	public User findByID(Integer userID);
	
	public User encryptUserMsg(User user);
	
	public String update(User user);
	
	public User findSameName(String userName);
	
	public Message findMsgByID(Integer msgID);
	
	public User findSameIdentify(String userIdentify);
	
	public List<Message> findAllMsg(Integer userID);
	
	public String readMsg(Integer msgID);
	
	public List<User> findAll(PageModel<User> pageModel);
	
	public Integer findAllCount(PageModel<User> pageModel);
	
	public String updateUser(User user);
	
}
