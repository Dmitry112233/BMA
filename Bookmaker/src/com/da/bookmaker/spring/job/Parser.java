package com.da.bookmaker.spring.job;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.da.bookmaker.bean.ExpressBean;

public class Parser {

	public static void main(String[] args) {

		parseAllExpress();

	}

	public static List<ExpressBean> parseAllExpress() {
		Document html;
		try {
			html = Jsoup.connect("https://vprognoze.ru/express/").get();
			List<Element> list = html.body().getAllElements();
			for (Element element : list){
				System.out.println(element);
			}
		
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
