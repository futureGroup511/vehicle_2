package com.future.dao;

import com.future.domain.Vehicle;

/**
 * @Package com.future.dao
 * 
 * @Title: VehicleDao.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月11日 下午9:58:01
 * 
 * @Description:  
 *   
 */
public interface VehicleDao extends BaseDao<Vehicle>{
    
	//通过车牌号判断车辆是否存在
	Vehicle getVehicleByPlateId(String plateId);
}
