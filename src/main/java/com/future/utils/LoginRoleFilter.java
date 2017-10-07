package com.future.utils;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.future.domain.User;


/**
 * @Package com.future.utils
 * 
 * @Title: LoginRoleFilter.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月1日 下午5:41:12
 * 
 * @Description:  Servlet Filter implementation class LoginRoleFilter
 *   
 */
public class LoginRoleFilter implements Filter {

    private FilterConfig fconfig;

	/**
     * Default constructor. 
     */
    public LoginRoleFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		// 转码
		response.setContentType("text/html; charset=UTF-8");
		HttpServletRequest HRequest = (HttpServletRequest) request;		
		// 获得登陆用户
		User admin = (User) HRequest.getSession().getAttribute("admin");
		// 获得登陆用户
		User administrator = (User) HRequest.getSession().getAttribute("administrator");
		String returnUrl = HRequest.getContextPath() + "/index.jsp";
		String path = HRequest.getRequestURI();
		//进行登录判断
		if(admin!=null&&path.indexOf("admin")!=-1){	
			chain.doFilter(request, response);
		} else if(administrator!=null&&path.indexOf("administrator")!=-1){
			chain.doFilter(request, response);
		} else {		
			//当用户为登录或登录超时时提醒并跳转到登录界面
			response.getWriter()
					.println("<script language=\"javascript\">" +"alert(\"登录失效！请重新登录\");"+ "if(window.opener==null){window.top.location.href=\""
							+ returnUrl + "\";}else{window.opener.top.location.href=\"" + returnUrl
							+ "\";window.close();}</script>");
			return;
		}  	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.fconfig=fconfig;
	}

}