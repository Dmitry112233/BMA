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
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerDescriptionController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	private static Map<String, String> linkMap = new HashMap<>();

	static {
		linkMap.put("Букмекер без идентификации", "bookmakers1");
		linkMap.put("Букмекерские конторы", "bookmakers2");
		linkMap.put("Букмекеры онлайн", "bookmakers3");
		linkMap.put("Официальные сайты букмекеров", "bookmakers4");
		linkMap.put("Лучшие букмекеры 2018", "bookmakers5");
		linkMap.put("Букмекеры Москвы", "bookmakers6");
		linkMap.put("Букмекеры РФ", "bookmakers7");
		linkMap.put("Данные букмекеров", "bookmakers8");
		linkMap.put("Интернет букмекеры", "bookmakers9");
		linkMap.put("Лучшие букмекеры", "bookmakers10");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMainStat() throws DaoException {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, BookmakerBean>> mapBokmakers = getBookmakerList();
		map.putAll(mapBokmakers);
		Map<String, Object> mapEvents = DaoFactory.getIventDao().getEvents();
		map.put("football", getMainList(((ArrayList<IventBean>) mapEvents.get("футбол"))));
		map.put("hockey", getMainList(((ArrayList<IventBean>) mapEvents.get("хоккей"))));
		map.put("tennis", getMainList(((ArrayList<IventBean>) mapEvents.get("теннис"))));
		map.put("basketball", getMainList(((ArrayList<IventBean>) mapEvents.get("баскетбол"))));
		map.put("news", DaoFactory.getNewsDao().getNewsForMainPage());
		map.put("linkMap", linkMap);
		return map;
	}

	@RequestMapping("/bookmakers{page}")
	public ModelAndView getBmkListNew(@PathVariable String page) throws DaoException, IOException {
		Map<String, Object> map = getMainStat();
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			String title = "bookmakers" + page + "_T";
			String h1 = "bookmakers" + page + "_H1";
			String description = "bookmakers" + page + "_D";
			String txt = "bookmakers" + page + "_Txt";
			if (page.equals("")) {
				map.put("relCanonical", "<link rel='canonical' href='https://5bets.ru'/>");
			}
			map.put("bookmakers_T", property.getProperty(title));
			map.put("bookmakers_H1", property.getProperty(h1));
			map.put("bookmakers_D", property.getProperty(description));
			map.put("bookmakers_Txt", property.getProperty(txt));
		} catch (IOException e) {
			System.err.println("Файл с проперти не найден");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("bkComparison", map);
	}

	private ArrayList<IventBean> getMainList(ArrayList<IventBean> list) {
		ArrayList<IventBean> newList = new ArrayList<>();
		if (list != null) {
			if (list.size() >= 9) {
				for (int i = 0; i < 9; i++) {
					newList.add(list.get(i));
				}
			} else {
				for (IventBean bean : list) {
					newList.add(bean);
				}
			}
		}
		return newList;
	}
}
