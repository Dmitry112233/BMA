package com.da.bookmaker.sping.mvc;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.IventBean;
import com.da.bookmaker.bean.UserBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/Authenticate.spr")
	public ModelAndView authenticatete(HttpServletRequest request, @RequestParam("login") String login,
			@RequestParam("password") String password) throws DaoException {

		UserBean user = DaoFactory.getUserDao().checkUser(login, password);
		if (user == null) {
			return new ModelAndView("login", "message", "User doesn't exist");
		} else {
			request.getSession().setAttribute("user", user);
			ExpressBean myExpress = DaoFactory.getExpressDao().getMyExpresses();
			return new ModelAndView("admin/adminMain", "myExpress", myExpress);
		}
	}

	@RequestMapping("/AddMyExpress.spr")
	public ModelAndView addMyExpress(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("description") String description) throws DaoException, ParseException {
		ExpressBean myExpress = new ExpressBean();
		myExpress.setDateStr(date);
		myExpress.setName(name);
		myExpress.setDescription(description);
		DaoFactory.getExpressDao().addMyExpress(myExpress);
		ExpressBean myExpress1 = DaoFactory.getExpressDao().getMyExpresses();
		return new ModelAndView("admin/adminMain", "myExpress", myExpress1);
	}

	@RequestMapping("/AddMyIvent.spr")
	public ModelAndView addMyIvent(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("bet") String bet, @RequestParam("competition") String competition,
			@RequestParam("coefficient") Double coefficient) throws DaoException, ParseException {

		IventBean myIvent = new IventBean();
		myIvent.setName(name);
		myIvent.setBet(bet);
		myIvent.setCoefficient(coefficient);
		myIvent.setCompetition(competition);
		myIvent.setDateStr(date);
		DaoFactory.getIventDao().linkMyIvent(myIvent);
		ExpressBean myExpress1 = DaoFactory.getExpressDao().getMyExpresses();
		return new ModelAndView("admin/adminMain", "myExpress", myExpress1);
	}
}
