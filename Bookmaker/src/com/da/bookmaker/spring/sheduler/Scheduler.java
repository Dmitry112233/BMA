package com.da.bookmaker.spring.sheduler;

import org.springframework.scheduling.annotation.Scheduled;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class Scheduler {

	@Scheduled(fixedDelay = 14400000)
	public void parseVprognoze() {

		WebClient webClient = new WebClient(BrowserVersion.CHROME);
		  try {
		         String url = "https://vprognoze.ru/express/";
		   webClient.getOptions().setThrowExceptionOnScriptError(false);
		         HtmlPage page = webClient.getPage(url);
		  
		         List<ExpressBean> beans = new ArrayList<>();
		         for (DomElement newsBox : page.getElementById("dle-content").getChildElements()){
		          if (!newsBox.getAttribute("class").equals("news_boxing")){
		           continue;
		          }
		          Iterator<DomElement> newsBoxChildren = newsBox.getChildElements().iterator();
		          newsBoxChildren.next(); //title_news
		          DomElement news = newsBoxChildren.next(); // news
		          
		          Iterator<DomElement> newsChildren = news.getFirstElementChild().getChildElements().iterator();
		          newsChildren.next();
		          newsChildren.next();
		          DomElement expressList = newsChildren.next();
		          newsChildren.next();
		          DomElement blockMatch =  newsChildren.next();
		          newsChildren.next();
		          DomElement description =  newsChildren.next();
		          
		          ExpressBean bean = new ExpressBean();
		          bean.setIventList(createEvents(expressList));
		          bean.setDescription(description.getTextContent());
		          bean.setDate(getDate(blockMatch));
		       
		          beans.add(bean);
		         }
		  }catch ( Exception ex ) {
		      ex.printStackTrace();
		  }finally {
		   webClient.closeAllWindows();
		  }
		 }

		 private Date getDate(DomElement blockMatch) throws ParseException {
		  String str = blockMatch.getTextContent();
		  str = str.substring(str.indexOf("(") + 1);
		  str = str.substring(0, str.indexOf(")"));
		  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  
		  return format.parse(str);
		 }

		 private ArrayList<IventBean> createEvents(DomElement expressList) {
		  ArrayList<IventBean> list = new ArrayList<>();
		  
		  String competition = null;
		  
		  for (DomElement row : expressList.getFirstElementChild()
		    .getFirstElementChild().getChildElements()){
		   if (row.getChildElementCount() == 1){
		    competition = row.getTextContent();
		    continue;
		   } else {
		    IventBean bean = new IventBean();
		    
		    String data = row.getTextContent();
		    String[] datas = data.split("\n");
		    
		    bean.setName(datas[2].trim());
		    bean.setBet(datas[3].trim());
		    bean.setCoefficient(Double.parseDouble(datas[6].trim()));
		    bean.setCompetition(competition);
		    
		    list.add(bean);
		   }
		  }	  
		  return null;
	}
}
