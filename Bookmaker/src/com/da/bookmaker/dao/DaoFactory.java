package com.da.bookmaker.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.da.bookmaker.dao.template.BookmakerDaoTemplateImpl;
import com.da.bookmaker.dao.template.ExpressDaoTemplateImpl;
import com.da.bookmaker.dao.template.Express_IventDaoTemplateImpl;
import com.da.bookmaker.dao.template.IventDaoTemplateImpl;
import com.da.bookmaker.dao.template.QuestionDaoTemplateImpl;
import com.da.bookmaker.dao.template.UserDaoTemplateImpl;

public class DaoFactory {

	private static ApplicationContext context = new ClassPathXmlApplicationContext("springDao.xml");

	private static BookmakerDao getBookmakerDao() {

		return context.getBean(BookmakerDaoTemplateImpl.class); 
	}

	private static ExpressDao getExpressDao() {

		return context.getBean(ExpressDaoTemplateImpl.class);
	}

	private static IventDao getIventDao() {

		return context.getBean(IventDaoTemplateImpl.class);
	}

	private static Express_IventDao getExpress_IventDao() {

		return context.getBean(Express_IventDaoTemplateImpl.class);
	}

	private static UserDao getUserDao() {

		return context.getBean(UserDaoTemplateImpl.class);
	}

	private static QuestionDao getQuestionDao() {

		return context.getBean(QuestionDaoTemplateImpl.class);
	}
}
