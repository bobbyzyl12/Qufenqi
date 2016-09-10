package com.ssss.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ssss.service.OrderService;

@Component
public class TimerTask {

	@Autowired
	private OrderService orderService;
	
	/**
	* ÿ��22��30��������
	*/
	@Scheduled(cron = "0 0 12 * * ?")
	public void test1()
	{
		orderService.updateData();
	} 

}
