package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class MainPageController extends BookmakerController{
	
	@RequestMapping("Index.spr")
	public ModelAndView index() throws DaoException{
		Map<String, Object> params = getMainList();
		params.putAll(getBookmakerList());
		return new ModelAndView("index", params);
	}

	public Map<String, Object> getMainList() throws DaoException {
		ExpressBean myExpress = DaoFactory.getExpressDao().getMyExpresses();

		Map<String, Object> params = new HashMap<>();
		params.put("myExpress", myExpress);

		return params;
	}
}
