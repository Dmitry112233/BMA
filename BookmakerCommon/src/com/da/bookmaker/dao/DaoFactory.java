package com.da.bookmaker.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.da.bookmaker.dao.template.BookmakerDaoTemplateImpl;
import com.da.bookmaker.dao.template.CommentsDaoTemplateImpl;
import com.da.bookmaker.dao.template.ExpressDaoTemplateImpl;
import com.da.bookmaker.dao.template.GroupDaoTemplateImpl;
import com.da.bookmaker.dao.template.IventDaoTemplateImpl;
import com.da.bookmaker.dao.template.LeagueTableDaoTemplateImpl;
import com.da.bookmaker.dao.template.MatchDetailsDaoTemplateImpl;
import com.da.bookmaker.dao.template.NewsDaoTemplateImpl;
import com.da.bookmaker.dao.template.PremierLeagueDaoTemplateImpl;
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

	public static NewsDao getNewsDao() {

		return context.getBean(NewsDaoTemplateImpl.class);
	}

	public static PremierLeagueDao getPremierLeagueDao() {

		return context.getBean(PremierLeagueDaoTemplateImpl.class);
	}

	public static MatchDetailsDao getMatchDetailsDao() {

		return context.getBean(MatchDetailsDaoTemplateImpl.class);
	}

	public static LeagueTableDao getLeaguTableDao() {

		return context.getBean(LeagueTableDaoTemplateImpl.class);
	}

	public static GroupDao getGroupDao() {

		return context.getBean(GroupDaoTemplateImpl.class);
	}
	
	public static CommentDao getCommentDao() {

		return context.getBean(CommentsDaoTemplateImpl.class);
	}
}
