package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Credit;
import com.ssss.entity.CreditStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface StageDao {
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
	String findCreditNameByID(Integer creditID);
	
	List<Credit> findAllCredit(PageModel<Credit> t);
		
	Integer findAllCreditCount(PageModel<Credit> pageModel);
	
	Credit findCreditByID(Integer creditID);
	
	Credit findCreditByName(String creditName);
	
	Integer findCreditCountByName(String creditName);
	
	Credit findCreditByMinLevelUp(Float minLevelUp);
	
	Integer findCreditCountByMinLevelUp(Float minLevelUp);
	
	void addCredit(Credit credit);

	void updateCredit(Credit credit);
	
	List<Float> findStageChargeByCreditID(Integer creditID);
	
	Float findStageChargeByID(CreditStage creditStage);
	
	Float findMaxCredit(Float temp);
}
