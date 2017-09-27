package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.NewsBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.NewsDao;

public class NewsDaoTemplateImpl implements NewsDao {

	
	private DataSource dataSource;
	
	private final static String GET_ALL_NEWS = "SELECT ID, SPORT, COMPETITION, DESCRIPTION, IMAGE, TITLE FROM SPORT_NEWS";
	
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
				return bean;
			}
		});	
		return list;
	}


}
