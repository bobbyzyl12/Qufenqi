package com.ssss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.service.StageService;

@Service(value = "stageService")
@Transactional
public class StageServiceImpl  implements StageService{
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private StageDao stageDao;
	
	public String findCreditNameByID(Integer creditID){
		String creditName = stageDao.findCreditNameByID(creditID); 
		return creditName;
	}
}
