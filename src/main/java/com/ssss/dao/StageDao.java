package com.ssss.dao;



public interface StageDao {
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
	String findCreditNameByID(Integer creditID);
	
}
