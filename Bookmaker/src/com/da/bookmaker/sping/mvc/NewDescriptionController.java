package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

public class NewDescriptionController extends BookmakerController {

	@RequestMapping("/NewsDescription_{id}_details.spr")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException {
		Map<String, Object> map = getNewsList(id);

		map.putAll(getBookmakerList());
		return new ModelAndView("newsDescriptionPage", map);
	}
	
	private Map<String, Object> getNewsList(int id) throws DaoException{
		NewsBean news = DaoFactory.getNewsDao().getNewsById(id);
		Map<String, Object> map = new HashMap<>();
		map.put("news", news);	
		return map;
	}	
}
