package com.da.bookmaker.sping.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.ExpressBean;
import com.da.bookmaker.bean.UserBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
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
			return new ModelAndView("admin/expressAddPage", "myExpress", myExpress);
		}
	}

	@RequestMapping("/AddMyExpress.spr")
	public ModelAndView addMyExpress(@RequestParam("name") String name, @RequestParam("date") String date,
			@RequestParam("description") String description) throws DaoException {
		try {
			ExpressBean myExpress = new ExpressBean();
			myExpress.setDateStr(date);
			myExpress.setName(name);
			myExpress.setDescription(description);
			DaoFactory.getExpressDao().addMyExpress(myExpress);
			return new ModelAndView("eventAddPage", "myExpress", myExpress);
		} catch (java.text.ParseException e) {
			throw new DaoException();
		}
	}
}
