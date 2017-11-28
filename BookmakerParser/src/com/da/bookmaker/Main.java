package com.da.bookmaker;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws InterruptedException {
		new Thread(new Runnable() {
			@Override
			public void run() {
				new ClassPathXmlApplicationContext("springCron.xml");
			}
		}).start();
		

	}

}
