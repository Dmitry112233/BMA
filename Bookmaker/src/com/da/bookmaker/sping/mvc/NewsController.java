package com.da.bookmaker.sping.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class NewsController extends BookmakerController {

	@RequestMapping("/News_{offset}")
	public ModelAndView getMainList(@PathVariable("offset") int offset) throws DaoException {
		ArrayList<Integer> pageMass = getPageMass(offset);
		int currentPage = getCurrentPage(offset);
		int limit = 10;
		
		Map<String, Object> map = getNewsListForPage(limit, offset);
		
		map.putAll(getBookmakerList());
		map.put("pageMass", pageMass);
		map.put("currentPage", currentPage);
		return new ModelAndView("news", map);
	}

	private int getCurrentPage(int offset) {
		int currentPage;
		if (offset == 0) {
			currentPage = 1;
		} else {
			currentPage = offset / 10 + 1;
		}
		return currentPage;
	}

	private ArrayList<Integer> getPageMass(int offset) throws DaoException {
		Map<String, Object> mapSize = getNewsListAll();
		ArrayList<NewsBean> list = (ArrayList<NewsBean>) mapSize.get("newsListSize");
		ArrayList<Integer> pageMass = new ArrayList<>();
		int quantity = list.size();
		int pageCount = quantity / 10;
		if (pageCount % 10 != 0) {
			pageCount += 1;
		}
		for (int i = 0; i < pageCount; i++) {
			pageMass.add(i);
		}
		return pageMass;
	}

	private Map<String, Object> getNewsListAll() throws DaoException {
		List<NewsBean> newsListSize = DaoFactory.getNewsDao().getAllNews();
		Map<String, Object> map = new HashMap<>();
		map.put("newsListSize", newsListSize);
		return map;
	}

	private Map<String, Object> getNewsListForPage(int limit, int offset) throws DaoException {
		List<NewsBean> newsList = DaoFactory.getNewsDao().getNewsForPage(limit, offset);
		Map<String, Object> map = new HashMap<>();
		map.put("newsList", newsList);
		return map;
	}

}
