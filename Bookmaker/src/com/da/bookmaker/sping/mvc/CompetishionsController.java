package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.dao.DaoException;

@Controller
public class CompetishionsController extends BookmakerController {

	private InputStream fis;
	static private Properties property;
	
	@RequestMapping("/Competishions")
	public ModelAndView getMainList() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("Competishions_T", property.get("Competishions_T"));
			map.put("Competishions_H1", property.get("Competishions_H1"));
			map.put("Competishions_D", property.get("Competishions_D"));
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}	
		return new ModelAndView("sports", map);
	}
}
