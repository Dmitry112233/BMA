package com.da.bookmaker.parser;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.da.bookmaker.bean.SportNewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import com.gargoylesoftware.htmlunit.javascript.host.Node;

public class SportNewsXmlParser {

	public static void main(String[] args)
			throws ParserConfigurationException, SAXException, IOException, DOMException, ParseException, DaoException {
		File inputFile = new File("d://rss.xml");
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(inputFile);
		doc.getDocumentElement().normalize();
		System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
		NodeList nList = doc.getElementsByTagName("item");

		List<SportNewsBean> newsList = new ArrayList<>();

		for (int temp = 0; temp < nList.getLength(); temp++) {
			Element element = (Element) nList.item(temp);
			SportNewsBean bean = new SportNewsBean();
			if (element.getNodeType() == Node.ELEMENT_NODE) {
				NodeList propertyList = element.getChildNodes();
				for (int j = 0; j < propertyList.getLength(); j++) {
					if (element.getNodeType() == Node.ELEMENT_NODE) {

						switch (propertyList.item(j).getNodeName()) {
						case "category":
							if (j == 0){
							bean.setSport(propertyList.item(j).getTextContent());
							break;
							} 
							if (j == 1){
							bean.setCompetition(propertyList.item(j).getTextContent());
							break;
							}
						case "title":
							bean.setTitle(propertyList.item(j).getTextContent());
							break;
						case "description":
							bean.setDescription(propertyList.item(j).getTextContent());
							break;
						case "enclosure":
							Element element1 = (Element) propertyList.item(j);
							bean.setImage(element1.getAttribute("url"));
							break;

						case "pubDate":
							String data = propertyList.item(j).getTextContent();
							bean.setDate(data);
							System.out.println(bean.getDate());
						}
					}
				}
			}
			newsList.add(bean);
		}
		DaoFactory.SportNewsDao().addSportNewsList(newsList);
	}
}
