package com.future.web.action;

import java.util.Date;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.future.domain.User;
import com.future.service.MaintainService;
import com.future.service.UserService;
import com.future.service.VehicleService;
import com.opensymphony.xwork2.ActionContext;
public class BaseData implements RequestAware{

	/**
	 * 
	 */
	
	protected Map<String,Object> request;
	
	protected HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
		
	protected ServletContext getContext(){
		return ServletActionContext.getServletContext();
	}
	
	public Map<String, Object> getRequest() {
		return request;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public StringBuffer url(){
		HttpServletRequest request = ServletActionContext.getRequest(); 
		StringBuffer url =request.getRequestURL(); 
		return url;
	}
	public Date date(){
		Date d=new Date();
		return d;
	}
	
	public String role(){
		Map session = ActionContext.getContext().getSession();
	  	User u = (User) session.get("User");
	  	String str=u.getRole();
	  	return str;
	}
	
	public String informName(){
		Map session = ActionContext.getContext().getSession();
	  	User u = (User) session.get("User");
	  	String str=u.getName();
	  	return str;
	}
}
