package com.future.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @Package com.future.utils
 * 
 * @Title: PathListener.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月9日 上午11:21:59
 * 
 * @Description: 路径监听 
 *  Application Lifecycle Listener implementation class PathListener 
 *   
 */
public class PathListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public PathListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	String path = arg0.getServletContext().getContextPath()+"/";
    	arg0.getServletContext().setAttribute("path",path);
    	
    	
    }
	
}
