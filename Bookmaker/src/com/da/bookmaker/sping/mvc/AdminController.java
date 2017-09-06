package com.da.bookmaker.sping.mvc;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
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

	@RequestMapping("/login.spr")
	public ModelAndView login() {
		return new ModelAndView("admin/login");
	}

	@RequestMapping("/Authenticate.spr")
	public ModelAndView authenticatete(HttpServletRequest request, @RequestParam("login") String login,
			@RequestParam("password") String password) throws DaoException {

		UserBean user = DaoFactory.getUserDao().checkUser(login, password);
		if (user == null) {
			return new ModelAndView("login", "message", "User doesn't exist");
		} else {
			request.getSession().setAttribute("user", user);
			ExpressBean myExpress = DaoFactory.getExpressDao().getMyExpress();
			return new ModelAndView("admin/adminMain", "myExpress", myExpress);
		}
	}

	@RequestMapping("/MyExpressForm.spr")
	public ModelAndView myExpressForm() {
		return new ModelAndView("admin/expressAddPage");
	}

	@RequestMapping("/AddMyExpress.spr")
	public ModelAndView addMyExpress(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("description") String description) throws DaoException, ParseException, UnsupportedEncodingException {
		ExpressBean myNewExpress = new ExpressBean();
		myNewExpress.setDateStr(date);
		myNewExpress.setName(StringEscapeUtils.unescapeHtml4(name));
		myNewExpress.setDescription(StringEscapeUtils.unescapeHtml4(description));
		ExpressBean myCurrentExpress = DaoFactory.getExpressDao().getMyExpress();
		if (myCurrentExpress.getDate().equals(myNewExpress.getDate())) {
			throw new DaoException("Express with this date has already existed");
		} else {
			DaoFactory.getExpressDao().addMyExpress(myNewExpress);
		}
		return new ModelAndView("admin/adminMain", "myExpress", myNewExpress);
	}

	@RequestMapping("/MyIventForm.spr")
	public ModelAndView myIventForm() {
		return new ModelAndView("admin/eventAddPage");
	}

	@RequestMapping("/AddMyIvent.spr")
	public ModelAndView addMyIvent(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("bet") String bet, @RequestParam("competition") String competition,
			@RequestParam("coefficient") Double coefficient) throws DaoException, ParseException {

		ExpressBean myExpress1;
		IventBean myIvent = new IventBean();
		myIvent.setName(StringEscapeUtils.unescapeHtml4(name));
		myIvent.setBet(StringEscapeUtils.unescapeHtml4(bet));
		myIvent.setCoefficient(coefficient);
		myIvent.setCompetition(StringEscapeUtils.unescapeHtml4(competition));
		if (date.equals("") || date == "") {
			Date today = new Date();
			myIvent.setDate(today);
		} else {
			myIvent.setDateStr(date);
		}
		DaoFactory.getIventDao().linkMyIvent(myIvent);
		myExpress1 = DaoFactory.getExpressDao().getMyExpress();
		return new ModelAndView("admin/adminMain", "myExpress", myExpress1);
	}
}
