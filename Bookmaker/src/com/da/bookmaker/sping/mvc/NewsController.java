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

	@RequestMapping("/News_{offset}.spr")
	public ModelAndView getMainList(@PathVariable("offset") int offset) throws DaoException {
		
		Map<String, Object> mapSize = getNewsListAll();
		ArrayList<NewsBean> list = (ArrayList<NewsBean>) mapSize.get("newsListSize");
		int quantity = list.size();
		int limit = 10;
		int pageCount = quantity / 10;
		if (pageCount % 10 != 0){
			pageCount += 1;
		}
		ArrayList<Integer> pageMass = new ArrayList<>();
		for (int i = 0; i < pageCount; i++){
			pageMass.add(i);
		}
		Map<String, Object> map = getNewsListForPage(limit, offset);
		map.putAll(getBookmakerList());
		map.put("pageMass", pageMass);
		return new ModelAndView("news", map);
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
