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

	@RequestMapping("/bookmakers")
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
			map.put("bookmakers_T", property.getProperty("bookmakers_T"));
			map.put("bookmakers_H1", property.getProperty("bookmakers_H1"));
			map.put("bookmakers_D", property.getProperty("bookmakers_D"));
			map.put("bookmakers_Txt", property.getProperty("bookmakers_Txt"));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkDescription", map);
	}

	// Букмекер без
	@RequestMapping("/bookmakers1")
	public ModelAndView getBmkList1() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(mapBokmakers);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers1_T", property.getProperty("bookmakers1_T"));
			map.put("bookmakers1_H1", property.getProperty("bookmakers1_H1"));
			map.put("bookmakers1_D", property.getProperty("bookmakers1_D"));
			map.put("bookmakers1_Txt", property.getProperty("bookmakers1_Txt"));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkDescription", map);
	}

	// Букмекер контора
	@RequestMapping("/bookmakers2")
	public ModelAndView getBmkList2() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(mapBokmakers);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers2_T", property.getProperty("bookmakers2_T"));
			map.put("bookmakers2_H1", property.getProperty("bookmakers2_H1"));
			map.put("bookmakers2_D", property.getProperty("bookmakers2_D"));
			map.put("bookmakers2_Txt", property.getProperty("bookmakers2_Txt"));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkDescription", map);
	}

	// Букмекер онлайн
	@RequestMapping("/bookmakers3")
	public ModelAndView getBmkList3() throws DaoException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(mapBokmakers);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers3_T", property.getProperty("bookmakers3_T"));
			map.put("bookmakers3_H1", property.getProperty("bookmakers3_H1"));
			map.put("bookmakers3_D", property.getProperty("bookmakers3_D"));
			map.put("bookmakers3_Txt", property.getProperty("bookmakers3_Txt"));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkDescription", map);
	}
	
	// Букмекер офицальный сайт
		@RequestMapping("/bookmakers4")
		public ModelAndView getBmkList4() throws DaoException, IOException {
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
			map.putAll(mapBokmakers);
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers4_T", property.getProperty("bookmakers4_T"));
				map.put("bookmakers4_H1", property.getProperty("bookmakers4_H1"));
				map.put("bookmakers4_D", property.getProperty("bookmakers4_D"));
				map.put("bookmakers4_Txt", property.getProperty("bookmakers4_Txt"));
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
	public ModelAndView getBmk() throws DaoException {
		Map<String, Map<String, BookmakerBean>> map = getBookmakerList();
		return new ModelAndView("bkDescription", map);
	}
}
