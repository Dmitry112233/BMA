package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerDetailsController extends BookmakerController {

	@RequestMapping("/Bookmaker_{id}")
	public ModelAndView getBmkList(@PathVariable("id") int id) throws DaoException {
		Map<String, Object> map = new HashMap<>();
		BookmakerBean bean = DaoFactory.getBookmakerDao().getById(id);
		map.put("Bookmaker", bean);
		return new ModelAndView("bkDescriptionPage", map);
	}
}
