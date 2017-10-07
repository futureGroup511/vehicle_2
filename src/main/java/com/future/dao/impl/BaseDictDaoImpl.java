package com.future.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.future.dao.BaseDictDao;
import com.future.domain.BaseDict;
import com.future.domain.User;

/**
 * @Package com.future.dao.impl
 * 
 * @Title: BaseDictDaoImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月8日 下午5:05:05
 * 
 * @Description:  
 *   
 */
public class BaseDictDaoImpl extends BaseDaoImpl<BaseDict> implements BaseDictDao {

	
	@Override
	public List<BaseDict> getListByTypeCode(String dict_type_code) {
       //创建离线查询对象
	   DetachedCriteria dc=DetachedCriteria.forClass(BaseDict.class);
		
	   //封装条件
	   dc.add(Restrictions.eq("dict_type_code", dict_type_code));
	  
	   //执行查询
	   
	   List<BaseDict> list = (List<BaseDict>) getHibernateTemplate().findByCriteria(dc);
	  
	   return list;
	}

	

}
