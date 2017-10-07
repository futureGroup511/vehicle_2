package com.future.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateCallback;

import com.future.dao.VehicleDao;
import com.future.domain.User;
import com.future.domain.Vehicle;

/**
 * @Package com.future.dao.impl
 * 
 * @Title: VehicleDaoImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月11日 下午9:59:28
 * 
 * @Description:  
 *   
 */
public class VehicleDaoImpl extends BaseDaoImpl<Vehicle> implements VehicleDao {

	@Override
	public Vehicle getVehicleByPlateId(String plateId) {
	  return getHibernateTemplate().execute(new HibernateCallback<Vehicle>() {

			@Override
		    public Vehicle doInHibernate(Session session) throws HibernateException {
				String hql = "from Vehicle where plateId = ? ";
				Query query=session.createQuery(hql);
				query.setParameter(0,plateId);
			    Vehicle vehicle=(Vehicle) query.uniqueResult();
				return vehicle;
			}
		 });
		
	}

}
