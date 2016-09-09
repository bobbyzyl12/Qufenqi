package com.ssss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Administrator;
import com.ssss.entity.Manager;
import com.ssss.entity.Message;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
import com.ssss.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private StageDao stageDao;
	public User checkLogin(String userName, String userPwd) {
        User user = userDao.findByUserName(userName);
        if (user != null && user.getUserPwd().equals(userPwd)) {
            return user;
        }
        return null;
    }
	
	public Manager checkManagerLogin(String managerName,String managerPwd){
		Manager manager= userDao.findByManagerName(managerName);
        if (manager != null && manager.getManagerPwd().equals(managerPwd)) {
            return manager;
        }
        return null;
	}
	
	public Administrator checkAdminLogin(String adminName,String adminPwd){
		Administrator admin= userDao.findByAdminName(adminName);
        if (admin!= null && admin.getAdminPwd().equals(adminPwd)){
            return admin;
        }
        return null;
	}
	
	
	public String signin(User user) {
		User sameuser = userDao.findByUserName(user.getUserName());
		if(user.getUserIdentify().equals("none")){
			if(sameuser == null){
				userDao.addAll(user);
				return "success";
			}
			else 
			{
				return "repeat";
			}
		}
		else{
			User sameIdentify =userDao.findByUserIdentify(user.getUserIdentify());
			if(sameuser == null && sameIdentify==null){
				userDao.addAll(user);
				return "success";
			}
			else if(sameuser != null){
				return "repeat";
			}
			else if(sameIdentify!=null){
				return "repeatIdentify";
			}
			else {return "fail";}
		}
		
	}

	public Integer countMsgNum(Integer userID){
		Integer res=userDao.countMsg(userID);
		return res;
	}
	
	public User findByID(Integer userID){
		User temp =userDao.findByID(userID);
		return temp;
	}
	
	//加密用户信息
	public User encryptUserMsg(User user){
		//处理密码
		String pwd =user.getUserPwd();
		String resPwd ="";
		for(int i=0;i<pwd.length();++i){
			resPwd=resPwd+"*";
		}
		user.setUserPwd(resPwd);
		
		//处理手机号
		String phone =user.getUserPhone();
		if(!phone.equals("none")){
			String newPhone=""; 
			for (int i=0; i< phone.length(); ++i) {
				char temp =  phone.charAt(i);
		        if(i>4&&i<8){
		        	temp='*';
		        }
				newPhone = newPhone+temp;
			}
			user.setUserPhone(newPhone);
		}
		
		//处理邮箱
		String email =user.getUserEmail();
		if(!email.equals("none")){
			String newEmail="";
			Boolean reached=false;
			for (int i=0; i< email.length(); i++) {
				char temp = email.charAt(i);
		        if(temp=='@'){
		        	reached=true;
		        }
				
		        if(reached==false&&i>2&&i<7){
		        	temp='*';
		        }
				
		        newEmail = newEmail+temp;
			}
			user.setUserEmail(newEmail);
		}
		
		//处理身份证
		String identify =user.getUserIdentify();
		if(!identify.equals("none")){
			String newIdentify=""; 
			for (int i=0; i<identify.length(); i++) {
				char temp =  identify.charAt(i);
		        if(i>4&&i<15){
		        	temp='*';
		        }
		        newIdentify = newIdentify+temp;
			}
			user.setUserIdentify(newIdentify);
		}
		return user;
	}
	
	public String update(User user){
		userDao.update(user);
		return "success";
	}
	
	public User findSameName(String userName){
		if(userDao.findByUserName(userName)==null)
			return null;
		else return userDao.findByUserName(userName);
	}
	
	public User findSameIdentify(String userIdentify){
		if(userDao.findByUserIdentify(userIdentify)==null)
			return null;
		else return userDao.findByUserIdentify(userIdentify);
	}
	
	public List<Message> findAllMsg(Integer userID){
		return userDao.findAllMsg(userID);
	}
	
	public Message findMsgByID(Integer msgID){
		return userDao.findMsgByID(msgID);
	}
	
	public String readMsg(Integer msgID){
		Message msg = userDao.findMsgByID(msgID);
		if(msg.getMsgState().equals("1"))
		{
			userDao.readMsg(msgID);
			return "success";
		}
		else return "read";	
	}
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<User> findAll(PageModel<User> pageModel) {
		return userDao.findAll(pageModel);
	}
	
	@Transactional
	public Integer findAllCount(PageModel<User> pageModel) {
		return userDao.findAllCount(pageModel);
	}
	
	public String updateUser(User user){
		Integer userID =user.getUserID();
		User oldUser = userDao.findByID(userID);
		
		String userName = user.getUserName();
		String userPwd = user.getUserPwd();
		String userPhone = user.getUserPhone();
		String userEmail = user.getUserEmail();
		String userIdentify = user.getUserIdentify();
		String userState = user.getUserState();
		
		if(!(userName.equals(oldUser.getUserName()))){
			if(userDao.findByUserName(userName)==null)
			{
				oldUser.setUserName(userName);
			}
			else
			{
				return "repeat";
			}
		}
		
		if(!(userIdentify.equals(oldUser.getUserIdentify()))){
			if(userDao.findByUserIdentify(userIdentify)==null)
			{
				oldUser.setUserIdentify(userIdentify);
				if(oldUser.getUserIdentify()==null){
					oldUser.setUserCredit(3);
				}
			}
			else
			{
				return "repeatIdentify";
			}
		}
		
		if(!(userPwd.equals(oldUser.getUserPwd()))){
			oldUser.setUserPwd(userPwd);
		}
		
		if(!(userPhone.equals(oldUser.getUserPhone()))){
			oldUser.setUserPhone(userPhone);
		}
		
		if(!(userEmail.equals(oldUser.getUserEmail()))){
			oldUser.setUserEmail(userEmail);
		}
		
		if(userState!=null){
		if(!(userState.equals(oldUser.getUserState()))){
			if((!userState.equals("9")))
				oldUser.setUserState(userState);
		}
		}
		userDao.update(oldUser);
		
		return "success";
	}
	
	public User findUserToCheck(){
		return userDao.findUserToCheck();
	}
	
	public void passCheck(Integer userID){
		User user = userDao.findByID(userID);
		user.setUserCredit(user.getUserCredit()+1);
		user.setUserState("1");
		userDao.update(user);
		
		//给用户发送消息告知订单审核通过
		String str=(user.getUserName())+"，您好。<br>恭喜您,您已通过了信用审核。现在您的信用等级为"+stageDao.findCreditNameByID(user.getUserCredit())+"。<br>祝您购物愉快！";
		Message msg =new Message();
		msg.setMsgClass("1");
		msg.setMsgState("1");
		msg.setMsgTitle("您的信用等级已经提升");
		msg.setUserID(userID);
		msg.setMsgContent(str);
		userDao.addMsg(msg);
	}
	
	public void rejectCheck(Integer userID,String reason){
		User user = userDao.findByID(userID);
		user.setUserState("1");
		userDao.update(user);
		
		reason.replace("\n", "、");
		String str=(user.getUserName())+"，您好。<br>很抱歉,由于"+reason+"您并未通过通过了信用审核。";
		Message msg =new Message();
		msg.setMsgClass("1");
		msg.setMsgState("1");
		msg.setMsgTitle("您的信用等级提升的请求未通过审核");
		msg.setUserID(userID);
		msg.setMsgContent(str);
		userDao.addMsg(msg);
	}
}