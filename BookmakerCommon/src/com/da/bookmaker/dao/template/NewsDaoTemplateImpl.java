package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.NewsDao;

public class NewsDaoTemplateImpl implements NewsDao {

	private DataSource dataSource;

	private final static String GET_ALL_NEWS = "SELECT ID, SPORT, COMPETITION, DESCRIPTION, IMAGE, TITLE, DATE  FROM SPORT_NEWS";

	private final static String INSERT_NEWS_LIST = "INSERT INTO SPORT_NEWS (SPORT, COMPETITION, TITLE, DESCRIPTION, IMAGE, DATE) VALUES (?,?,?,?,?,?)";

	private final static String DELETE_ALL_NEWS = "DELETE FROM SPORT_NEWS";

	private final static String GET_NEWS_BY_ID = "SELECT ID, SPORT, COMPETITION, DESCRIPTION, IMAGE, TITLE, DATE FROM SPORT_NEWS WHERE ID = ?";
	
	private final static String GET_NEWS_FOR_PAGE = "SELECT ID, SPORT, COMPETITION, DESCRIPTION, IMAGE, TITLE, DATE FROM SPORT_NEWS " +
	"ORDER BY ID LIMIT ? OFFSET ?";
	
	private final static String GET_NEWS_FOR_MAIN_PAGE = "SELECT ID, SPORT, COMPETITION, DESCRIPTION, IMAGE, TITLE, DATE FROM SPORT_NEWS LIMIT 2";

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<NewsBean> getAllNews() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<NewsBean> list = template.query(GET_ALL_NEWS, new RowMapper<NewsBean>() {

			@Override
			public NewsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				NewsBean bean = new NewsBean();
				bean.setId(rs.getLong("ID"));
				bean.setSport(rs.getString("SPORT"));
				bean.setCompetition(rs.getString("COMPETITION"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setImage(rs.getString("IMAGE"));
				bean.setTitle(rs.getString("TITLE"));
				bean.setSport(rs.getString("DATE"));
				return bean;
			}
		});
		return list;
	}

	@Override
	public void addNewsList(List<NewsBean> newsList) throws DaoException {

		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		for (NewsBean news : newsList) {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement statement = con.prepareStatement(INSERT_NEWS_LIST,
							PreparedStatement.RETURN_GENERATED_KEYS);
					statement.setString(1, news.getSport());
					statement.setString(2, news.getCompetition());
					statement.setString(3, news.getTitle());
					statement.setString(4, news.getDescription());
					statement.setString(5, news.getImage());
					statement.setString(6, news.getDate());
					return statement;
				}
			}, holder);
			news.setId(Long.parseLong(holder.getKeys().get("GENERATED_KEY").toString()));
		}

	}

	public void deleteAllNews() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_ALL_NEWS);
	}

	@Override
	public NewsBean getNewsById(int id) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<NewsBean> list = template.query(GET_NEWS_BY_ID, new Object[] { id }, new RowMapper<NewsBean>() {
			@Override
			public NewsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				NewsBean bean = new NewsBean();
				bean.setId(rs.getLong("ID"));
				bean.setSport(rs.getString("SPORT"));
				bean.setCompetition(rs.getString("COMPETITION"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setImage(rs.getString("IMAGE"));
				bean.setTitle(rs.getString("TITLE"));
				bean.setSport(rs.getString("DATE"));
				return bean;
			}
		});
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<NewsBean> getNewsForPage(int limit, int offset) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<NewsBean> list = template.query(GET_NEWS_FOR_PAGE, new Object[] {limit, offset}, new RowMapper<NewsBean>() {

			@Override
			public NewsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				NewsBean bean = new NewsBean();
				bean.setId(rs.getLong("ID"));
				bean.setSport(rs.getString("SPORT"));
				bean.setCompetition(rs.getString("COMPETITION"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setImage(rs.getString("IMAGE"));
				bean.setTitle(rs.getString("TITLE"));
				bean.setSport(rs.getString("DATE"));
				return bean;
			}
		});
		return list;
	}

	@Override
	public List<NewsBean> getNewsForMainPage() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<NewsBean> list = template.query(GET_NEWS_FOR_MAIN_PAGE, new RowMapper<NewsBean>() {
			@Override
			public NewsBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				NewsBean bean = new NewsBean();
				bean.setId(rs.getLong("ID"));
				bean.setSport(rs.getString("SPORT"));
				bean.setCompetition(rs.getString("COMPETITION"));
				bean.setDescription(rs.getString("DESCRIPTION"));
				bean.setImage(rs.getString("IMAGE"));
				bean.setTitle(rs.getString("TITLE"));
				bean.setSport(rs.getString("DATE"));
				return bean;
			}
		});
		return list;
	}
}
