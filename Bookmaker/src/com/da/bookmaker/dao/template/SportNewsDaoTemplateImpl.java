package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.SportNewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.SportNewsDao;

public class SportNewsDaoTemplateImpl implements SportNewsDao {

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private final static String INSERT_NEWS = "INSERT INTO SPORT_NEWS (SPORT, COMPETITION, DESCRIPTION, DATA, IMAGE, TITLE) VALUES (?,?,?,?,?,?)";

	private final static String GET_ALL_NEWS = "SELECT SPORT, COMPETITION, DESCRIPTION, DATA, IMAGE, TITLE FROM SPORT_NEWS";

	@Override
	public List<SportNewsBean> getAllSportNews() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<SportNewsBean> list = template.query(GET_ALL_NEWS, new RowMapper<SportNewsBean>() {
			@Override
			public SportNewsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				SportNewsBean news = new SportNewsBean();
				news.setSport(rs.getString("SPORT"));
				news.setCompetition(rs.getString("COMPETITION"));
				news.setDescription(rs.getString("DESCRIPTION"));
				news.setImage(rs.getString("IMAGE"));
				news.setDate(rs.getString("DATA"));
				news.setTitle(rs.getString("TITLE"));
				
				return news;
			}
		});
		return list;
	}

	@Override
	public void addSportNewsList(List<SportNewsBean> list) throws DaoException {
		for (SportNewsBean news : list) {
			addSportNews(news);
		}

	}

	private void addSportNews(SportNewsBean news) {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(INSERT_NEWS,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setString(1, news.getSport());
				statement.setString(2, news.getCompetition());
				statement.setString(3, news.getDescription());
				statement.setString(4, news.getDate());
				statement.setString(5, news.getImage());
				statement.setString(6, news.getTitle());
				return statement;
			}
		}, holder);
		news.setSportNewsID(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
	}
}
