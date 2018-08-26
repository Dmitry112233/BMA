package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class NewDescriptionController extends BookmakerController {

	@RequestMapping("/NewsDescription_{id}_details_{currentPage}")
	public ModelAndView getMainList(@PathVariable("id") int id, @PathVariable("currentPage") int currentPage) throws DaoException {
		Map<String, Object> map = getNewsList(id);
		map.put("offset", getOffset(currentPage));
		map.putAll(getBookmakerList());
		return new ModelAndView("newsDescriptionPage", map);
	}
	
	// из currentPage получит offset и отправить по кнопке назад на контроллер выдачи всех кновостей
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
	
	
	
	
}
