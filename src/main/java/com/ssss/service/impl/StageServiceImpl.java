package com.ssss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Credit;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
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
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<Credit> findAllCredit(PageModel<Credit> pageModel) {
		return stageDao.findAllCredit(pageModel);
	}
	
	@Transactional
	public Integer findAllCreditCount(PageModel<Credit> pageModel) {
		return stageDao.findAllCreditCount(pageModel);
	}
	
	public String addCredit(Credit credit){
		Credit sameName = stageDao.findCreditByName(credit.getCreditName());
		Credit sameLevelUp = stageDao.findCreditByMinLevelUp(credit.getMinLevelUp());
		if(sameName != null){
			return "repeat";
		}
		else if(sameLevelUp != null){
			return "repeatMinLevelUp";
		}
		else{
			stageDao.addCredit(credit);
			return "success";
		}
	}
	
	public String updateCredit(Credit credit){
			stageDao.updateCredit(credit);
			return "success";
	}
	
	public Credit findCreditByID(Integer creditID){
		return stageDao.findCreditByID(creditID);
	}
	
	public List<Float> findStageChargeByCreditID(Integer creditID){
		return stageDao.findStageChargeByCreditID(creditID);
	}
}
