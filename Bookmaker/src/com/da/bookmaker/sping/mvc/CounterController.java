package com.da.bookmaker.sping.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CounterController {

	@RequestMapping("/Counter")
	public String setBookmakerCounter(@RequestParam("id") long id) throws DaoException {
		
		BookmakerBean bean = DaoFactory.getBookmakerDao().getById(id);
		DaoFactory.getBookmakerDao().updBookmakerById(id);
		return "redirect:" + bean.getLink();
	}
}
