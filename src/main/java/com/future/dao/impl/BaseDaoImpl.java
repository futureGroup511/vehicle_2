 package com.future.dao.impl;

import java.io.Serializable;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.future.dao.BaseDao;
import com.future.domain.Maintain;
import com.future.domain.User;
import com.future.domain.Vehicle;

/**
 * @Package com.future.dao.impl
 * 
 * @Title: BaseDaoImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年7月31日 下午9:19:01
 * 
 * @Description:  
 *   
 */
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
   
	//接收泛型类型
	private Class clazz;
	
	
	public BaseDaoImpl() {
     //获取当前类型的带有泛型类的父类
	 ParameterizedType ptClass=(ParameterizedType) this.getClass().getGenericSuperclass();
	 
	 //获取运行期的泛型类型
	 clazz = (Class) ptClass.getActualTypeArguments()[0];
	}
	
	@Override
	public void save(T t) {
       getHibernateTemplate().save(t);		
	}

	@Override
	public void delete(T t) {
	  getHibernateTemplate().delete(t); 	
	}

	@Override
	public void delete(Serializable id) {
     //先取后删
	  T t=this.getById(id);
      getHibernateTemplate().delete(t); 	
	}

	@Override
	public void update(T t) {
      getHibernateTemplate().update(t);		
	}

	@Override
	public T getById(Serializable id) {
   
		return (T) getHibernateTemplate().get(clazz, id);
	}

	//DAO中查询所有部门
	@Override
	public List<Vehicle> findAll() {
		return (List<Vehicle>) this.getHibernateTemplate().find("from Vehicle");
	}
		
	@Override
	public List<Maintain> get() {
		return (List<Maintain>) this.getHibernateTemplate().find("from Maintain");
	}
		
	@Override
	public List<User> getAllUser() {
		return (List<User>)this.getHibernateTemplate().find("from User");
	}
	
	@Override
	public Integer getTotalCount(DetachedCriteria dc) {
        //设置查询聚合函数,总记录数
		dc.setProjection(Projections.rowCount());
		
		List<Long> list=(List<Long>) getHibernateTemplate().findByCriteria(dc);
        
		//清空之前设置的聚合函数
		dc.setProjection(null);
		
		if(list!=null && list.size()>0) {
		  Long count=list.get(0);
		  return count.intValue();
		}else {
		   return null;
		}
	}

	@Override
	public List<T> getPageList(DetachedCriteria dc, Integer start, Integer pageSize) {
		
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(dc,start,pageSize);
		
		return list;
	}



}

