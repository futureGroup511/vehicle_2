package com.future.dao;

import java.io.Serializable;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.future.domain.Maintain;
import com.future.domain.User;
import com.future.domain.Vehicle;

/**
 * @Package com.future.dao
 * 
 * @Title: BaseDao.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年7月31日 下午9:05:45
 * 
 * @Description:  
 *   
 */
public interface BaseDao<T> {
  
	//增
	void save(T t);
	
	//删
	void delete(T t);
	
	//删  用户序列化的id修改
	void delete(Serializable id);
	
	//改
	void update(T t);

    //查  根据ID查询
    T  getById(Serializable id);
	
    //查  符合条件的总记录
    Integer getTotalCount(DetachedCriteria dc);
    
	//查  查询分页列表数据
    List<T> getPageList(DetachedCriteria dc,Integer start,Integer pageSize); 
    
    //查询整个车辆集合
  	List<Vehicle> findAll(); 
    //查询整个车辆维护信息集合  
  	List<Maintain> get();
  	
  	//查询整个用户集合
  	List<User> getAllUser();
  	//查询整个通知信息集合

  	
    
} 
