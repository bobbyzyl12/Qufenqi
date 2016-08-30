package com.ssss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Credit;
import com.ssss.entity.User;
import com.ssss.service.StageService;

@Controller
@RequestMapping(value="/stage")
public class StageController {
	@Autowired
	private StageService stageService;
	
	/**
     * ����µ��û����õȼ�
     * @param user
     * @return
     */
	@RequestMapping(value = "/addCredit")
	@ResponseBody
	public String addCredit(Credit credit){
		return stageService.addCredit(credit);
	}
	
	/**
     * �����µ��û����õȼ�
     * @param user
     * @return
     */
	@RequestMapping(value = "/updateCredit")
	@ResponseBody
	public String updateCredit(Credit tempCredit){
		return stageService.updateCredit(tempCredit);
	}
	
	/**
     * ͨ��ID��ȡһ��credit����Ϣ
     * @param user
     * @return
     */
	@RequestMapping(value = "/getCredit")
	@ResponseBody
	public Credit getCredit(Integer creditID){
		return stageService.findCreditByID(creditID);
	}
}
