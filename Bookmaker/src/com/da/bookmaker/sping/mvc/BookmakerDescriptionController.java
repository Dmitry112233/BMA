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
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerDescriptionController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	public Map<String, Object> getMainStat() throws DaoException{
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(DaoFactory.getIventDao().getEvents());
		map.putAll(mapBokmakers);
		return map;
	}

	@RequestMapping("/bookmakers")
	public ModelAndView getBmkList() throws DaoException, IOException {
		Map<String, Object> map = getMainStat();
		map.put("relCanonical", "<link rel='canonical' href='https://findbestbet.ru'/>");
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
		Map<String, Object> map = getMainStat();
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers_T", property.getProperty("bookmakers1_T"));
			map.put("bookmakers_H1", property.getProperty("bookmakers1_H1"));
			map.put("bookmakers_D", property.getProperty("bookmakers1_D"));
			map.put("bookmakers_Txt", property.getProperty("bookmakers1_Txt"));
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
		Map<String, Object> map = getMainStat();
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers_T", property.getProperty("bookmakers2_T"));
			map.put("bookmakers_H1", property.getProperty("bookmakers2_H1"));
			map.put("bookmakers_D", property.getProperty("bookmakers2_D"));
			map.put("bookmakers_Txt", property.getProperty("bookmakers2_Txt"));
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
		Map<String, Object> map = getMainStat();
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("bookmakers_T", property.getProperty("bookmakers3_T"));
			map.put("bookmakers_H1", property.getProperty("bookmakers3_H1"));
			map.put("bookmakers_D", property.getProperty("bookmakers3_D"));
			map.put("bookmakers_Txt", property.getProperty("bookmakers3_Txt"));
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
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers4_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers4_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers4_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers4_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
		
		
		@RequestMapping("/bookmakers5")
		public ModelAndView getBmkList5() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers5_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers5_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers5_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers5_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
		
		@RequestMapping("/bookmakers6")
		public ModelAndView getBmkList6() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers6_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers6_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers6_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers6_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
		
		@RequestMapping("/bookmakers7")
		public ModelAndView getBmkList7() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers7_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers7_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers7_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers7_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
		
		@RequestMapping("/bookmakers8")
		public ModelAndView getBmkList8() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers8_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers8_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers8_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers8_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
		
		@RequestMapping("/bookmakers9")
		public ModelAndView getBmkList9() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers9_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers9_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers9_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers9_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}

		@RequestMapping("/bookmakers10")
		public ModelAndView getBmkList10() throws DaoException, IOException {
			Map<String, Object> map = getMainStat();
			try {
				if (property == null) {
					property = new Properties();
					fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
					property.load(fis);
				}
				map.put("bookmakers_T", property.getProperty("bookmakers10_T"));
				map.put("bookmakers_H1", property.getProperty("bookmakers10_H1"));
				map.put("bookmakers_D", property.getProperty("bookmakers10_D"));
				map.put("bookmakers_Txt", property.getProperty("bookmakers10_Txt"));
			} catch (IOException e) {
				System.err.println("Файл с проперти не найден");
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
			return new ModelAndView("bkDescription", map);
		}
}
