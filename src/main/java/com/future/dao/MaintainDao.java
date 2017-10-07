package com.future.dao;

import com.future.domain.Maintain;

/**
 * @Package com.future.dao
 * 
 * @Title: MaintainDao.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月16日 下午9:12:54
 * 
 * @Description:  
 *   
 */
public interface MaintainDao extends BaseDao<Maintain>{
	
	//查询最小id
	Integer getMinId();

}
