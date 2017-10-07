package com.future.dao;

import com.future.domain.User;

/**
 * @Package com.future.dao
 * 
 * @Title: UserDao.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年7月31日 下午9:05:51
 * 
 * @Description:  
 *   
 */
public interface UserDao extends BaseDao<User> {
	
	//查  根据账户查询用户对象
  	User getUserByCode(String code);
	
	
}
