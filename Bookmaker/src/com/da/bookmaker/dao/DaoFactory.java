package com.da.bookmaker.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.da.bookmaker.dao.template.BookmakerDaoTemplateImpl;
import com.da.bookmaker.dao.template.ExpressDaoTemplateImpl;
import com.da.bookmaker.dao.template.IventDaoTemplateImpl;
import com.da.bookmaker.dao.template.QuestionDaoTemplateImpl;
import com.da.bookmaker.dao.template.UserDaoTemplateImpl;

public class DaoFactory {

	private static ApplicationContext context = new ClassPathXmlApplicationContext("springDao.xml");

	public static BookmakerDao getBookmakerDao() {

		return context.getBean(BookmakerDaoTemplateImpl.class); 
	}

	public static ExpressDao getExpressDao() {

		return context.getBean(ExpressDaoTemplateImpl.class);
	}

	public static IventDao getIventDao() {

		return context.getBean(IventDaoTemplateImpl.class);
	}

	public static UserDao getUserDao() {

		return context.getBean(UserDaoTemplateImpl.class);
	}

	public static QuestionDao getQuestionDao() {

		return context.getBean(QuestionDaoTemplateImpl.class);
	}
}
