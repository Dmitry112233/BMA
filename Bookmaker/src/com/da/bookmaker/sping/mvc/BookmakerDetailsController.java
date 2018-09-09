package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerDetailsController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/Bookmaker_{id}")
	public ModelAndView getBookmaker(@PathVariable("id") int id) throws DaoException, IOException {
		Map<String, Object> map = new HashMap<>();
		BookmakerBean bean = DaoFactory.getBookmakerDao().getById(id);
		map.put("bookmaker", bean);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			if (id == 1) {
				map.put("Bookmaker_T", property.getProperty("1xBet_T"));
				map.put("Bookmaker_H1", property.getProperty("1xBet_H1"));
				map.put("Bookmaker_D", property.getProperty("1xBet_D"));
			}
			if (id == 2) {
				map.put("Bookmaker_T", property.getProperty("Leon_T"));
				map.put("Bookmaker_H1", property.getProperty("Leon_H1"));
				map.put("Bookmaker_D", property.getProperty("Leon_D"));
			}
			if (id == 3) {
				map.put("Bookmaker_T", property.getProperty("LigaStavok_T"));
				map.put("Bookmaker_H1", property.getProperty("LigaStavok_H1"));
				map.put("Bookmaker_D", property.getProperty("LigaStavok_D"));
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}

		return new ModelAndView("bkDescriptionPage", map);
	}
}
