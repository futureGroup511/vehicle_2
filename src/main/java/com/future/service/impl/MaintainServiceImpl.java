package com.future.service.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.MaintainDao;
import com.future.domain.Maintain;
import com.future.domain.User;

import com.future.service.MaintainService;
import com.future.utils.PageBean;

/**
 * @Package com.future.service.impl
 * 
 * @Title: MaintainServiceImpl.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月12日 下午8:12:15
 * 
 * @Description:  
 *   
 */
@Transactional(isolation=Isolation.REPEATABLE_READ,readOnly=false,propagation=Propagation.REQUIRED)
public class MaintainServiceImpl implements MaintainService {

    private MaintainDao maintainDao;
   
	@Override
	public void saveMaintain(Maintain maintain) {
         maintainDao.save(maintain);		
	}

	public void setMaintainDao(MaintainDao maintainDao) {
		this.maintainDao = maintainDao;
	}

	@Transactional(isolation=Isolation.REPEATABLE_READ,readOnly=true,propagation=Propagation.REQUIRED)
	public PageBean getPageBean(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		
		//1.调用dao查询总记录
       
        Integer totalCount=maintainDao.getTotalCount(dc);
        
		//2.创建pageBean对象
		PageBean pb=new PageBean(currentPage,totalCount,pageSize);
        
		//3.调用dao查询分页列表数据
		List<Maintain> list=maintainDao.getPageList(dc, pb.getStart(), pb.getPageSize());
		
		pb.setList(list);
		
		return pb;
	}

	@Override
	@Transactional(isolation=Isolation.REPEATABLE_READ,readOnly=true,propagation=Propagation.REQUIRED)
	public Date getMaintainDateById() {
         Integer minId = maintainDao.getMinId();
	     Maintain maintain = maintainDao.getById(minId);
	     return maintain.getDate();
	}

	@Override
	public List<Maintain> get() {
		List<Maintain> m=maintainDao.get();
		return m;
	}

	@Override
	public void updateMaintain(Maintain maintain) {
		maintainDao.update(maintain);
	}

	@Override
	public Maintain getById(int id) {
		Maintain m=maintainDao.getById(id);
		return m;
	}                         
}
