package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class MainPageController {

	@RequestMapping("/MainList.spr")
	public ModelAndView getMainList() throws DaoException {
		List<BookmakerBean> bookmakerList = DaoFactory.getBookmakerDao().getAllBookmakers();
		ExpressBean myExpress = DaoFactory.getExpressDao().getMyExpresses();

		Map<String, Object> params = new HashMap<>();
		params.put("bookmakerList", bookmakerList);
		params.put("myExpress", myExpress);

		return new ModelAndView("mainPageTest", params);
	}
}
