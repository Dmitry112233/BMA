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
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class ExpressController extends BookmakerController {

	private InputStream fis;
	static private Properties property;
	
	private static Map<String, String> linkMap = new HashMap<>();

	static {
		linkMap.put("главная", "expresses_list_0");
		linkMap.put("тест2", "expresses1_list_0");
		linkMap.put("тест3", "expresses2_list_0");
		linkMap.put("тест4", "expresses3_list_0");
		linkMap.put("тест5", "expresses4_list_0");
		linkMap.put("тест6", "expresses5_list_0");
		linkMap.put("тест7", "expresses6_list_0");
		linkMap.put("тест8", "expresses7_list_0");
		linkMap.put("тест9", "expresses8_list_0");
		linkMap.put("тест10", "expresses9_list_0");
		linkMap.put("тест11", "expresses10_list_0");
		linkMap.put("тест12", "expresses11_list_0");
		linkMap.put("тест13", "expresses12_list_0");
	}

	@RequestMapping("/expresses{page}_list_{offset}")
	public ModelAndView getMainList(@PathVariable("offset") int offset, @PathVariable("page") String page) throws DaoException, IOException {
		ArrayList<Integer> pageMass = getPageMass(offset);
		int currentPage = getCurrentPage(offset);
		int limit = 20;
		Map<String, Object> map = getExpressListForPage(limit, offset);
		map.put("pageMass", pageMass);
		map.put("currentPage", currentPage);
		map.putAll(getBookmakerList());
		map.putAll(getBookmakerWeight());
		map.put("linkMap", linkMap);
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			String title = "Express" + page + "_T";
			String h1 = "Express" + page + "_H1";
			String description = "Express" + page + "_D";
			String txt = "Express" + page + "_Txt";
			map.put("Express_T", property.getProperty(title));
			map.put("Express_H1", property.getProperty(h1));
			map.put("Express_D", property.getProperty(description));
			if (currentPage == 1) {
				map.put("Express_Txt", property.getProperty(txt));
			}
		} catch (IOException e) {
			System.err.println("Ð¤Ð°Ð¹Ð» Ð¾Ñ‚Ñ�ÑƒÑ‚Ñ�Ñ‚Ð²ÑƒÐµÑ‚");
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
		ArrayList<ExpressBean> list = (ArrayList<ExpressBean>) mapSize.get("expressList");
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
		List<ExpressBean> allExpressList = DaoFactory.getExpressDao().getAllExpresses();
		List<ExpressBean> expressList = new ArrayList<>();
		int size = getSizeForCycle(offset, limit, allExpressList.size());
		for (int i = offset; i <= size; i++) {
			expressList.add(allExpressList.get(i));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("expressList", expressList);
		return map;
	}

	private int getSizeForCycle(int offset, int limit, int listSize) {
		int size;
		if (offset + limit - 1 >= listSize) {
			size = listSize - 1;
		} else {
			size = offset + limit - 1;
		}
		return size;
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
