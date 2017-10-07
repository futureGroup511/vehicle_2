package com.future.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.future.dao.MaintainDao;
import com.future.domain.Maintain;

/**
 * @Package com.future.dao.impl
 * 
 * @Title: MaintainDaoImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月16日 下午9:13:03
 * 
 * @Description:  
 *   
 */
public class MaintainDaoImpl extends BaseDaoImpl<Maintain> implements MaintainDao{

	@Override
	public Integer getMinId() {

	   return getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
	            String hql="SELECT min(maintainId) FROM Maintain";
	            Query query=session.createQuery(hql);
	            Integer minId=(Integer) query.uniqueResult();
				return minId;
			}
			
       }); 		
        		 
	}

}
