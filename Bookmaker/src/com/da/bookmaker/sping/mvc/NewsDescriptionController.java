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
public class NewsDescriptionController extends BookmakerController {

	@RequestMapping("/{id}_news_{currentPage}")
	public ModelAndView getMainList(@PathVariable("id") int id, @PathVariable("currentPage") int currentPage) throws DaoException {
		Map<String, Object> map = getNewsList(id);
		map.put("popularNews", getPopularNews());
		map.put("offset", getOffset(currentPage));
		map.putAll(getBookmakerList());
		return new ModelAndView("newsDescription", map);
	}
	
	// Ð¸Ð· currentPage Ð¿Ð¾Ð»ÑƒÑ‡Ð¸Ñ‚ offset Ð¸ Ð¾Ñ‚Ð¿Ñ€Ð°Ð²Ð¸Ñ‚ÑŒ Ð¿Ð¾ ÐºÐ½Ð¾Ð¿ÐºÐµ Ð½Ð°Ð·Ð°Ð´ Ð½Ð° ÐºÐ¾Ð½Ñ‚Ñ€Ð¾Ð»Ð»ÐµÑ€ Ð²Ñ‹Ð´Ð°Ñ‡Ð¸ Ð²Ñ�ÐµÑ… ÐºÐ½Ð¾Ð²Ð¾Ñ�Ñ‚ÐµÐ¹
	public int getOffset(int currentPage){
		int offset = (currentPage - 1) * 10;	
		return offset;
	}
	
	private Map<String, Object> getNewsList(int id) throws DaoException{
		NewsBean news = DaoFactory.getNewsDao().getNewsById(id);
		Map<String, Object> map = new HashMap<>();
		map.put("news", news);	
		return map;
	}
		
	private List<NewsBean> getPopularNews() throws DaoException {
	List<NewsBean> allNews = DaoFactory.getNewsDao().getAllNews();
	List<NewsBean> list = new ArrayList<>();
		for (int i = 0; i < allNews.size(); i++) {
			if(i == 0 || i % 5 == 0) {
				list.add(allNews.get(i));
			}
		}
		return list;
	}

	
	
	
}
