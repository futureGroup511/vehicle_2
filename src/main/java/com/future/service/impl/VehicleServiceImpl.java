package com.future.service.impl;

import java.text.DecimalFormat;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.VehicleDao;
import com.future.domain.User;
import com.future.domain.Vehicle;
import com.future.service.VehicleService;
import com.future.utils.PageBean;
/**
 * @Package com.future.service.impl
 * 
 * @Title: VehicleServiceImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月12日 下午5:54:25
 * 
 * @Description:  
 *   
 */
@Transactional(isolation=Isolation.REPEATABLE_READ,readOnly=false,propagation=Propagation.REQUIRED)
public class VehicleServiceImpl implements  VehicleService {
   
	private VehicleDao vehicleDao;	
	private static int totalCount = 0;  
	private int customerID;  
	private String customerIDS;
	
    @Override
	public String getVehicleId() {
		//封装离线查询对象
		DetachedCriteria dc=DetachedCriteria.forClass(Vehicle.class);
        //获取Vehicle表的总记录数
		Integer totalCount = vehicleDao.getTotalCount(dc);
		//赋值
	    customerID=++totalCount;
	    
	    DecimalFormat decimalFormat = new DecimalFormat("00000");  
	    	    
	    //判断存不存在该用户
	    customerIDS=decimalFormat.format(customerID);   
	    Vehicle vehicle = vehicleDao.getById(customerIDS);	    
         
	    while(vehicle!=null) {
           customerID++;	    		   
           customerIDS=decimalFormat.format(customerID);   
           vehicle = vehicleDao.getById(customerIDS);	    
        } 	    
	    
	    
	    return decimalFormat.format(customerID);
	}
	
	@Override
	public void saveVehicle(Vehicle vehicle) {
         vehicleDao.save(vehicle);   
	}

	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,readOnly=true,propagation=Propagation.REQUIRED)
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		//1.调用dao查询总记录
        	
		Integer totalCount=vehicleDao.getTotalCount(dc);
		//2.创建pageBean对象
		PageBean pb=new PageBean(currentPage,totalCount,pageSize);
		//3.调用dao查询分页列表数据
		List<Vehicle> list=vehicleDao.getPageList(dc, pb.getStart(), pb.getPageSize());
				
		pb.setList(list);
				
		return pb;	
	}


	@Override
	public Vehicle getVehicleJudge(Vehicle v) {
		Vehicle judgeV =vehicleDao.getVehicleByPlateId(v.getPlateId());  
		return judgeV;
	}


	public void setVehicleDao(VehicleDao vehicleDao) {
		this.vehicleDao = vehicleDao;
	}

	
	@Override
	public Vehicle getVehicleId(String vehicleId) {
		return vehicleDao.getById(vehicleId);
	}
    
	
	@Override
	public void updateVehicleMaintain(String vehicleId) {
		Vehicle vehicle = vehicleDao.getById(vehicleId);		
	    Integer maintainNumber = vehicle.getMaintainNumber();
	    if(maintainNumber==null) {
			 maintainNumber=0;
		 }
	    maintainNumber++;
	    vehicle.setMaintainNumber(maintainNumber);
	    vehicleDao.save(vehicle);
		
	}
	@Override
	public void updateVehicle(Vehicle vehicle) {
		vehicleDao.update(vehicle);
	}

	@Override
	public List<Vehicle> getAll() {
		List<Vehicle> v=vehicleDao.findAll();
		return v;
	}

	@Override
	public Vehicle select(int id) {
		Vehicle v=vehicleDao.getById(id);
		return v;
	}
	

}
