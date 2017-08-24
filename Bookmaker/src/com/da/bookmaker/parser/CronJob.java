package com.da.bookmaker.parser;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.support.ClassPathXmlApplicationContext;

@WebListener
public class CronJob implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("resource")
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		new ClassPathXmlApplicationContext("springCron.xml");
	}
}
