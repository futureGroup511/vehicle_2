package com.future.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.future.domain.Vehicle;
import com.future.utils.PageBean;

/**
 * @Package com.future.service
 * 
 * @Title: VehicleService.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月12日 下午5:42:48
 * 
 * @Description:  
 *   
 */
public interface VehicleService {
	
	//保存车辆信息
   void saveVehicle(Vehicle vehicle);
	    
   //车辆列表
    PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize);

   //获取车辆id
   String getVehicleId();
	    
   //判断车辆是否存在
   Vehicle getVehicleJudge(Vehicle v);

   //通过档案号查询车辆对象
   Vehicle getVehicleId(String vehicleId);
   
   //为车辆列表插入信息数据
   void updateVehicleMaintain(String vehicleId);
   
   //修改车辆信息
   void updateVehicle(Vehicle vehicle);
 	
   //查询所有车辆信息
   List<Vehicle> getAll();

   //根据id来查询车辆信息
   Vehicle select(int id);
}
