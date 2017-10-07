package com.future.service;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.future.domain.User;
import com.future.utils.PageBean;

/**
 * @ProjectName vehicle 
 * 
 * @ClassName UserService
 *     
 * @author   孤城落寞  
 * 
 * @DateTime 2017年7月26日 上午10:53:18          
 */
public interface UserService {
    
	//添加用户
	void  saveUser(User u);
	
	//登录方法
	User getUserByCodePassword(User  u);
    
	//分页方法
	PageBean getPageBean(DetachedCriteria dc,Integer currentPage,Integer pageSize);
		
	//用户验证
    User getUserJudge(User u);
    
    //插入信息数据
    void updateUserMaintain(Integer userId);
	
    //插入车辆数量
    void updateUserVehicle(Integer userId);
    
    //通过id获取user对象
	User getUserById(Integer userId);
    
	//通过账号查询对象
	User getUserByCode(User user);
	
	//修改用户信息
	void updateUser(User user);
	
	//查询该条用户信息
	User select(int id);
	
	//查询所有用户信息
	List<User> getAll();
}
