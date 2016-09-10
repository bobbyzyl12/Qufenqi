package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Administrator;
import com.ssss.entity.Manager;
import com.ssss.entity.Message;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserDao {
	 
	
	 /**
     * 此方法对应于数据库中的表 ,user
     * 新写入数据库记录
     *(除userID自生成以外其他数据都有)
     * @param record
     */
	void addAll(User user);
	
	 /**
     * 此方法对应于更新库中的表 ,user
     * 新写入数据库记录
     *(除userID自生成以外其他数据都有)
     * @param record
     */
	void update(User user);
	
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
	User findByID(Integer userID);
	
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定用户名获取一条数据库记录
     *
     * @param name
     */
	User findByUserName(String userName);
	
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定用户身份证号码获取一条数据库记录
     *
     * @param name
     */
	User findByUserIdentify(String userIdentify);
	
	/**
     * 此方法对应于数据库中的表 ,manager
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	Manager findByManagerName(String managerName);
	
	/**
     * 此方法对应于数据库中的表 ,administrator
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	Administrator findByAdminName(String adminName);
	
	/**
     * 此方法对应于数据库中的表 ,message
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	Integer countMsg(Integer userID);
	

	/**
     * 此方法对应于数据库中的表 ,message
     * 根据指定消息id获取message的信息
     *
     * @param id
     */
	Message findMsgByID(Integer msgID);
	
	/**
     * 此方法对应于数据库中的表 ,message
     * 根据指定用户id获取message的信息
     *
     * @param id
     */
	List<Message> findAllMsg(Integer userID);

	/**
     * 此方法对应于数据库中的表 ,message
     * 根据指定message的id将其状态标示为已读
     *
     * @param id
     */
	 void readMsg(Integer msgID);
	 
	 List<User> findAll(PageModel<User> t);
		
	 Integer findAllCount(PageModel<User> pageModel);
	 
	 void addMsg(Message message);
	 
	 User findUserToCheck();
	 
	 List<User> findAllUser();
}

