package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Administrator;
import com.ssss.entity.Manager;
import com.ssss.entity.Message;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserDao {
	 
	
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ��д�����ݿ��¼
     *(��userID�����������������ݶ���)
     * @param record
     */
	void addAll(User user);
	
	 /**
     * �˷�����Ӧ�ڸ��¿��еı� ,user
     * ��д�����ݿ��¼
     *(��userID�����������������ݶ���)
     * @param record
     */
	void update(User user);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ��������ȡһ�����ݿ��¼
     *
     * @param id
     */
	User findByID(Integer userID);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param name
     */
	User findByUserName(String userName);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ���û����֤�����ȡһ�����ݿ��¼
     *
     * @param name
     */
	User findByUserIdentify(String userIdentify);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,manager
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	Manager findByManagerName(String managerName);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,administrator
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	Administrator findByAdminName(String adminName);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,message
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	Integer countMsg(Integer userID);
	

	/**
     * �˷�����Ӧ�����ݿ��еı� ,message
     * ����ָ����Ϣid��ȡmessage����Ϣ
     *
     * @param id
     */
	Message findMsgByID(Integer msgID);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,message
     * ����ָ���û�id��ȡmessage����Ϣ
     *
     * @param id
     */
	List<Message> findAllMsg(Integer userID);

	/**
     * �˷�����Ӧ�����ݿ��еı� ,message
     * ����ָ��message��id����״̬��ʾΪ�Ѷ�
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

