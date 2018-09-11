package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;

@Controller
public class BookmakerDescriptionController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/Bookmakers")
	public ModelAndView getBmkList() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(mapBokmakers);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("Bookmakers_T", property.getProperty("Bookmakers_T"));
			map.put("Bookmakers_H1", property.getProperty("Bookmakers_H1"));
			map.put("Bookmakers_D", property.getProperty("Bookmakers_D"));
			map.put("Bookmakers_Txt", property.getProperty("Bookmakers_Txt"));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkDescription", map);
	}

	@RequestMapping("/index.spr")
	public ModelAndView getBmkList1() throws DaoException {
		Map<String, Map<String, BookmakerBean>> map = getBookmakerList();
		return new ModelAndView("bkDescription", map);
	}
}
