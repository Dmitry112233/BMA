package com.da.bookmaker.sping.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class FootballExpressController {
	
	@RequestMapping("/FootballExpressesList.spr")
	public ModelAndView getMainList() throws DaoException {
		List<ExpressBean> expressList = DaoFactory.getExpressDao().getAllExpresses();

		return new ModelAndView("parts/expresses", "expressList", expressList);
	}
}
