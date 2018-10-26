package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.CommentBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerDetailsController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/bookmaker_{id}")
	public ModelAndView getBookmaker(@PathVariable("id") int id) throws DaoException, IOException {
		Map<String, Object> map = new HashMap<>();
		BookmakerBean bean = DaoFactory.getBookmakerDao().getById(id);
		ArrayList<CommentBean> comments = (ArrayList<CommentBean>) DaoFactory.getCommentDao().getCommentsForBookmaker(id);
		map.put("comments", comments);
		map.put("bookmaker", bean);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch(id){
			case 1:	
				map.put("Bookmaker_T", property.getProperty("1xBet_T"));
				map.put("Bookmaker_H1", property.getProperty("1xBet_H1"));
				map.put("Bookmaker_D", property.getProperty("1xBet_D"));
				map.put("Bookmaker_Txt", property.getProperty("1xBet_Txt"));
				break;
			case 2:
				map.put("Bookmaker_T", property.getProperty("Leon_T"));
				map.put("Bookmaker_H1", property.getProperty("Leon_H1"));
				map.put("Bookmaker_D", property.getProperty("Leon_D"));
				map.put("Bookmaker_Txt", property.getProperty("Leon_Txt"));
				break;
			case 3:
				map.put("Bookmaker_T", property.getProperty("LigaStavok_T"));
				map.put("Bookmaker_H1", property.getProperty("LigaStavok_H1"));
				map.put("Bookmaker_D", property.getProperty("LigaStavok_D"));
				map.put("Bookmaker_Txt", property.getProperty("LigaStavok_Txt"));
				break;
			}			
		} catch (IOException e) {
			System.err.println("Ð¤Ð°Ð¹Ð» Ð¾Ñ‚Ñ�ÑƒÑ‚Ñ�Ñ‚Ð²ÑƒÐµÑ‚");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}

		return new ModelAndView("bkDescriptionPage", map);
	}
}
