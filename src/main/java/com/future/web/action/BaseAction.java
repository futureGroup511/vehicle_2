package com.future.web.action;





import com.future.domain.User;

import com.future.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @Package com.future.web.action
 * 
 * @Title: BaseAction.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月20日 上午9:32:10
 * 
 * @Description: 登录，注销 ，改密  ，找回密码 ，关于系统 ，通知 ，帮助
 *   
 */
public class BaseAction  extends  BaseData  implements ModelDriven<User>{
    
	private static final long serialVersionUID = 1L;
	
	private  User user=new User();
	
	private  UserService userService;
   
	private  String identity;
	
	//登录方法
	public String login() throws Exception {
		
        //1.调用service执行登录逻辑
		User existU=userService.getUserByCodePassword(user);
	    
		//2.判断用户是否存在 ，不存在抛出异常       判断密码是否正确，不正确抛出异常
	    if(existU == null) {
	    	request.put("login", "账号输入错误！");
	    }else if(!existU.getPassword().equals(user.getPassword())) {
	    	request.put("login", "密码错误！！"); 
	    }else {
	        //3.将返回的User对象放入session域中
	    	ActionContext.getContext().getSession().put("User", existU);
	    	
	    	//4.重定向到项目主页
	    	if(existU.getRole().equals("admin")) {
	            ActionContext.getContext().getSession().put("admin", existU);           
	            return "admin";
	 	    }else if(existU.getRole().equals("administrator")) {
	 	       ActionContext.getContext().getSession().put("administrator", existU);
	 	       return "administrator";
	        }else {
	             return "error";    	
	        }
	    }
	    
	     return "error";
	}
	
	//退出登录后,防倒退再次进入	
	public String logOff(){
		request.put("identity", identity);
		return "logOff";
	}
		
	
	//注销登录
	public String logout() throws Exception {
		//清除session中的user信息
		if(identity.equals("admin")){
			ActionContext.getContext().getSession().remove("admin");
		}else if(identity.equals("administrator")){
			ActionContext.getContext().getSession().remove("administrator");
		}	
		ActionContext.getContext().getSession().remove("User");
		return "logout";
	}
	
	//登录界面跳转
	public  String loginJump() throws  Exception{

		return "loginJump";
	}
	
	
	public User getModel() {
		return user;
	}
	
	public void setUserService(UserService userService) {
		
		this.userService = userService;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

}

