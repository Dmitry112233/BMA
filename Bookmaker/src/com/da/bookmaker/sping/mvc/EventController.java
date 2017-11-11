package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class EventController extends BookmakerController{

	@RequestMapping("/EventsList.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getIventList();
		ModelAndView modelAndView = new ModelAndView("allEvents");
		modelAndView.addAllObjects(getBookmakerList());
		modelAndView.addObject("allEvents", map);
		return modelAndView;
	}
	
	private Map<String, Object> getIventList() throws DaoException {
		Map<String, Object> map = DaoFactory.getIventDao().getEvents();
	
		return map;
	}
}
