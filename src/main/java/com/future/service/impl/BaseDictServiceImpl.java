package com.future.service.impl;

import java.util.List;

import com.future.dao.BaseDictDao;
import com.future.domain.BaseDict;
import com.future.service.BaseDictService;

/**
 * @Package com.future.service.impl
 * 
 * @Title: BaseDictServiceImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月8日 下午4:58:43
 * 
 * @Description:  
 *   
 */
public class BaseDictServiceImpl implements BaseDictService{
   
	private  BaseDictDao baseDictDao;
	
	
	@Override
	public List<BaseDict> getListByTypeCode(String dict_type_code) {
	
		return baseDictDao.getListByTypeCode(dict_type_code);
	}


	public void setBaseDictDao(BaseDictDao baseDictDao) {
		this.baseDictDao = baseDictDao;
	}


}
