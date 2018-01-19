package com.da.bookmaker;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.da.bookmaker.parser.BetFaqParser;
import com.da.bookmaker.parser.VprognozeParser;
import com.da.bookmaker.rss.EurosportXmlImpl;

public class Main {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws Exception {
		new Thread(new Runnable() {
			@Override
			public void run() {
				new ClassPathXmlApplicationContext("springCron.xml");
			}
		}).start();
		
		new EurosportXmlImpl().parseRss();
		new VprognozeParser().parseVprognoze();
		new BetFaqParser().parseBetFaq();
		
	}

}
