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
	
	public static void main(String[] args) {
		new VprognozeParser().parseVprognoze();
	}

	@SuppressWarnings("resource")
	@Override
	public void contextInitialized(ServletContextEvent event) {
		/*new Thread( new Runnable() {
			
			@Override
			public void run() {
				new ClassPathXmlApplicationContext("springCron.xml").getBean(VprognozeParser.class).parseVprognoze();
			}
		}).start();*/
		
		new Thread( new Runnable() {
			
			@Override
			public void run() {	
				try {
					new ClassPathXmlApplicationContext("springCron.xml").getBean(BetFaqParser.class).parseBetFaq();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}).start();
		
		event.getServletContext().setAttribute("cssVersion", "0001");
	}
}
