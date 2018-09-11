package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class ExpressController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/ExpressesList_{offset}")
	public ModelAndView getMainList(@PathVariable("offset") int offset) throws DaoException, IOException {
		ArrayList<Integer> pageMass = getPageMass(offset);
		int currentPage = getCurrentPage(offset);
		int limit = 20;
		Map<String, Object> map = getExpressListForPage(limit, offset);
		map.put("pageMass", pageMass);
		map.put("currentPage", currentPage);
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("Express_T", property.getProperty("Express_T"));
			map.put("Express_H1", property.getProperty("Express_H1"));
			map.put("Express_D", property.getProperty("Express_D"));
			map.put("Express_Txt", property.getProperty("Express_Txt"));
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("allExpresses", map);
	}

	private int getCurrentPage(int offset) {
		int currentPage;
		if (offset == 0) {
			currentPage = 1;
		} else {
			currentPage = offset / 20 + 1;
		}
		return currentPage;
	}

	private ArrayList<Integer> getPageMass(int offset) throws DaoException {
		Map<String, Object> mapSize = getExpressList();
		ArrayList<NewsBean> list = (ArrayList<NewsBean>) mapSize.get("expressList");
		ArrayList<Integer> pageMass = new ArrayList<>();
		int quantity = list.size();
		int pageCount = quantity / 20;
		if (pageCount % 20 != 0) {
			pageCount += 1;
		}
		for (int i = 0; i < pageCount; i++) {
			pageMass.add(i);
		}
		return pageMass;
	}

	private Map<String, Object> getExpressList() throws DaoException {
		List<ExpressBean> expressList = DaoFactory.getExpressDao().getAllExpresses();
		Map<String, Object> map = new HashMap<>();
		map.put("expressList", expressList);
		return map;
	}

	private Map<String, Object> getExpressListForPage(int limit, int offset) throws DaoException {
		List<ExpressBean> expressList = DaoFactory.getExpressDao().getExpressesForPage(limit, offset);
		Map<String, Object> map = new HashMap<>();
		map.put("expressList", expressList);
		return map;
	}

	private Map<String, ArrayList<BookmakerBean>> getBookmakerWeight() throws DaoException {
		Map<String, BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();
		Map<String, ArrayList<BookmakerBean>> mapWeight = new HashMap<>();
		ArrayList<BookmakerBean> bookmakerWeightList = new ArrayList<>();

		for (BookmakerBean bean : bookmakerList.values()) {
			for (int i = 0; i <= bean.getWeight() - 1; i++) {
				bookmakerWeightList.add(bean);
			}
		}
		mapWeight.put("BookmakerWeightList", bookmakerWeightList);
		return mapWeight;
	}
}
