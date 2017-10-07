package com.future.service;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.future.domain.Maintain;
import com.future.utils.PageBean;

/**
 * @Package com.future.service
 * 
 * @Title: MaintainService.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月12日 下午8:11:28
 * 
 * @Description:  
 *   
 */
public interface MaintainService {
   
	//录入维护信息
	void  saveMaintain(Maintain maintain);
	
	//分页方法
	PageBean getPageBean(DetachedCriteria dc,Integer currentPage,Integer pageSize);
	
	//查询的开始时间
	Date getMaintainDateById();
	
	//查询所有的维护信息
	List<Maintain> get();

	//修改维护信息
	void updateMaintain(Maintain maintain);
		
	//根据id查询维护信息
	Maintain getById(int id);
}
