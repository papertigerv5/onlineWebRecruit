package com.onlinehr.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 监听器
 * @author tuyanwei
 */
public class ApplicationInitListener implements ServletContextListener {
	
	private String contextPath;
	
	private String realPath;
	
	private ServletContext application;
	
	/**
	 * 销毁操作
	 */
	public void contextDestroyed(ServletContextEvent arg0) {}

	/**
	 * 初始化参数
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		 application = arg0.getServletContext();
		 
		 contextPath = application.getContextPath();
		 realPath = application.getRealPath("");
		 
		 application.setAttribute("contextPath", contextPath);
		 application.setAttribute("realPath", realPath);
	}

}
