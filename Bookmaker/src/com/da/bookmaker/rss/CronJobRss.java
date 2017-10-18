package com.da.bookmaker.rss;

import java.io.IOException;
import java.net.UnknownHostException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.beans.BeansException;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@WebListener
public class CronJobRss implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("resource")
	@Override
	public void contextInitialized(ServletContextEvent event) {
		new Thread( new Runnable() {
			
			@Override
			public void run() {
				try {
					new ClassPathXmlApplicationContext("springCron.xml").getBean(EurosportXmlImpl.class).parseRss();
				} catch (BeansException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}).start();
		
	}
}
