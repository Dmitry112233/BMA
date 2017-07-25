package com.da.bookmaker.sping.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class BookmakerController {

	@RequestMapping("/BookmakerList.spr")
	public ModelAndView getBookmakerList() throws DaoException {
		List<BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();

		return new ModelAndView("parts/bmList", "bookmakerList", bookmakerList);
	}

}
