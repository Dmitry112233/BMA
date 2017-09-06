package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.SportNewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class SportNewsController extends BookmakerController{

	@RequestMapping("/SportNewsList.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getSportNewsList();
		map.putAll(getBookmakerList());
		return new ModelAndView("testNews", map);
	}
	
	private Map<String, Object> getSportNewsList() throws DaoException {
		List<SportNewsBean> sportNewsList = DaoFactory.SportNewsDao().getAllSportNews();

		Map<String, Object> map = new HashMap<>();
		map.put("sportNewsList", sportNewsList);
	
		return map;
	}
	
}
