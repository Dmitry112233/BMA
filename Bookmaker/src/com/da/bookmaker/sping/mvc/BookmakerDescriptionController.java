package com.da.bookmaker.sping.mvc;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;

@Controller
public class BookmakerDescriptionController extends BookmakerController{

	@RequestMapping("/Bookmakers.spr")
	public ModelAndView getBmkList() throws DaoException {
		Map<String, Map<String, BookmakerBean>> map = getBookmakerList();
		return new ModelAndView("bkDescription", map);
	}
}
