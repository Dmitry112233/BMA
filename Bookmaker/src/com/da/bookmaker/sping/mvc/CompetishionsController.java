package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.dao.DaoException;

@Controller
public class CompetishionsController extends BookmakerController {

	@RequestMapping("/Competishions.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = new HashMap<>();
		map.putAll(getBookmakerList());
		return new ModelAndView("sports", map);
	}
}
