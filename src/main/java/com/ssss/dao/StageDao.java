package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Credit;
import com.ssss.entity.CreditStage;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface StageDao {
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ��������ȡһ�����ݿ��¼
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
