package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.QuestionDao;

public class QuestionDaoTemplateImpl implements QuestionDao {

	private final static String GET_ALL_QUESTIONS = "SELECT ID, QUESTION, ANSWER FROM QUESTIONS";
	
	private final static String GET_ALL_VIDEOS = "SELECT ID, QUESTION, VIDEO FROM QUESTIONS WHERE VIDEO IS NOT NULL";

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<QuestionBean> getAllQuestions() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<QuestionBean> list = template.query(GET_ALL_QUESTIONS, new RowMapper<QuestionBean>() {

			@Override
			public QuestionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				QuestionBean question = new QuestionBean();
				question.setQuestionID(rs.getLong("ID"));
				question.setQuestion(rs.getString("QUESTION"));
				question.setAnswer(rs.getString("ANSWER"));
				return question;
			}
		});
		return list;
	}

	@Override
	public List<QuestionBean> getAllVideos() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<QuestionBean> list = template.query(GET_ALL_VIDEOS, new RowMapper<QuestionBean>() {

			@Override
			public QuestionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				QuestionBean question = new QuestionBean();
				question.setQuestionID(rs.getLong("ID"));
				question.setQuestion(rs.getString("QUESTION"));
				question.setVideo(rs.getString("VIDEO"));
				return question;
			}
		});
		return list;
	}
}
