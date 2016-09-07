package com.ssss.service;

import java.util.List;

import com.ssss.entity.Credit;
import com.ssss.entity.PageModel;

public interface StageService {
	public String findCreditNameByID(Integer creditID); 
	
	public List<Credit> findAllCredit(PageModel<Credit> pageModel);

	public Integer findAllCreditCount(PageModel<Credit> pageModel);
	
	public Credit findCreditByID(Integer creditID);
	
	public String addCredit(Credit credit);
	
	public String updateCredit(Credit credit);
	
	public List<Float> findStageChargeByCreditID(Integer creditID);
	
	public Float findCharge(Integer creditID,Integer stageID);
	
}
