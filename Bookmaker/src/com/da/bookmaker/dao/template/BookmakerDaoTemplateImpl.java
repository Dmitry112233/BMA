package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.BookmakerDao;
import com.da.bookmaker.dao.DaoException;

public class BookmakerDaoTemplateImpl implements BookmakerDao{

	private final static String GET_ALL_BOOKMAKERS = "SELECT ID, NAME, LINK, IMAGE, DESCRIPTION FROM BOOKMAKERS";
	
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<BookmakerBean> getAllBookmakers() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<BookmakerBean> list = template.query(GET_ALL_BOOKMAKERS , new RowMapper<BookmakerBean>() {

			@Override
			public BookmakerBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				BookmakerBean bookmaker = new BookmakerBean();
				bookmaker.setBookMakerId(rs.getLong("ID"));
				bookmaker.setName(rs.getString("NAME"));
				bookmaker.setLink(rs.getString("LINK"));
				bookmaker.setImage(rs.getString("IMAGE"));
				bookmaker.setDescription(rs.getString("DESCRIPTION"));
				return bookmaker;
			}
		}); 
		return list;
	}
}
