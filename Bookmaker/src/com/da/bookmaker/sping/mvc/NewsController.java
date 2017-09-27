package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller 
public class NewsController extends BookmakerController {

	@RequestMapping("/News.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getNewsList();

		map.putAll(getBookmakerList());
		return new ModelAndView("news", map);
	}
	
	private Map<String, Object> getNewsList() throws DaoException{
		List<NewsBean> newsList = DaoFactory.getNewsDao().getAllNews();

		Map<String, Object> map = new HashMap<>();
		map.put("newsList", newsList);
		
		return map;
	}
	
}
