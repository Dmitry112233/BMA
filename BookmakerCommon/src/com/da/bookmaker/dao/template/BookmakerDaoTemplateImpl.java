package com.da.bookmaker.dao.template;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.dao.BookmakerDao;
import com.da.bookmaker.dao.DaoException;

public class BookmakerDaoTemplateImpl implements BookmakerDao{

	private final static String GET_ALL_BOOKMAKERS = "SELECT ID, NAME, LINK, IMAGE, BONUS_INT, PLUSES, MINUSES, " + 
	"CURRENCY, PAYMENTS, RELIABILITY, LINE, USABILITY, RESULT, WEIGHT, BONUS FROM BOOKMAKERS";


	private static final String GET_BY_NAME = "SELECT ID, NAME, LINK, IMAGE, BONUS_INT, PLUSES, MINUSES, " + 
	"CURRENCY, PAYMENTS, RELIABILITY, LINE, USABILITY, RESULT, WEIGHT, BONUS FROM BOOKMAKERS WHERE NAME = ?";
	
	private static final String UPDATE_BOOKMAKER_BY_ID = "UPDATE BOOKMAKERS SET COUNTER = COUNTER + 1 WHERE ID = ?";
	
	
	private static final String GET_BY_ID = "SELECT ID, NAME, LINK, IMAGE, BONUS_INT, PLUSES, MINUSES, " + 
			"CURRENCY, PAYMENTS, RELIABILITY, LINE, USABILITY, RESULT, WEIGHT, COUNTER, BONUS FROM BOOKMAKERS WHERE ID = ?";
	
	
	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public Map<String, BookmakerBean> getAllBookmakers() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<BookmakerBean> list = template.query(GET_ALL_BOOKMAKERS , new RowMapper<BookmakerBean>() {

			@Override
			public BookmakerBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				BookmakerBean bookmaker = new BookmakerBean();
				bookmaker.setBookMakerId(rs.getLong("ID"));
				bookmaker.setName(rs.getString("NAME"));
				bookmaker.setLink(rs.getString("LINK"));
				bookmaker.setImage(rs.getString("IMAGE"));
				bookmaker.setBonus_int(rs.getString("BONUS_INT"));
				bookmaker.setPluses(rs.getString("PLUSES"));
				bookmaker.setMinuses(rs.getString("MINUSES"));
				bookmaker.setCurrency(rs.getString("CURRENCY"));
				bookmaker.setPayments(rs.getString("PAYMENTS"));
				bookmaker.setReliability(rs.getShort("RELIABILITY"));
				bookmaker.setLine(rs.getInt("LINE"));
				bookmaker.setUsability(rs.getInt("USABILITY"));
				bookmaker.setResult(rs.getInt("RESULT"));
				bookmaker.setWeight(rs.getInt("WEIGHT"));
				bookmaker.setBonus(rs.getString("BONUS"));
				return bookmaker;
			}
		}); 
		
		Map<String, BookmakerBean> map = new HashMap<>();
		for (BookmakerBean bean : list){
			map.put(bean.getName(), bean);
		}
		return map;
	}

	@Override
	public BookmakerBean getByName(String name) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<BookmakerBean> list = template.query(GET_BY_NAME , new Object[]{name}, new RowMapper<BookmakerBean>() {

			@Override
			public BookmakerBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				BookmakerBean bookmaker = new BookmakerBean();
				bookmaker.setBookMakerId(rs.getLong("ID"));
				bookmaker.setName(rs.getString("NAME"));
				bookmaker.setLink(rs.getString("LINK"));
				bookmaker.setImage(rs.getString("IMAGE"));
				bookmaker.setBonus_int(rs.getString("BONUS_INT"));
				bookmaker.setPluses(rs.getString("PLUSES"));
				bookmaker.setMinuses(rs.getString("MINUSES"));
				bookmaker.setCurrency(rs.getString("CURRENCY"));
				bookmaker.setPayments(rs.getString("PAYMENTS"));
				bookmaker.setReliability(rs.getShort("RELIABILITY"));
				bookmaker.setLine(rs.getInt("LINE"));
				bookmaker.setUsability(rs.getInt("USABILITY"));
				bookmaker.setResult(rs.getInt("RESULT"));
				bookmaker.setWeight(rs.getInt("WEIGHT"));
				bookmaker.setBonus(rs.getString("BONUS"));
				return bookmaker;
			}
		}); 
		if (list.size() >0){
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public BookmakerBean getById(long id) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<BookmakerBean> list = template.query(GET_BY_ID , new Object[]{id}, new RowMapper<BookmakerBean>() {

			@Override
			public BookmakerBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				BookmakerBean bookmaker = new BookmakerBean();
				bookmaker.setBookMakerId(rs.getLong("ID"));
				bookmaker.setName(rs.getString("NAME"));
				bookmaker.setLink(rs.getString("LINK"));
				bookmaker.setImage(rs.getString("IMAGE"));
				bookmaker.setBonus_int(rs.getString("BONUS_INT"));
				bookmaker.setPluses(rs.getString("PLUSES"));
				bookmaker.setMinuses(rs.getString("MINUSES"));
				bookmaker.setCurrency(rs.getString("CURRENCY"));
				bookmaker.setPayments(rs.getString("PAYMENTS"));
				bookmaker.setReliability(rs.getShort("RELIABILITY"));
				bookmaker.setLine(rs.getInt("LINE"));
				bookmaker.setUsability(rs.getInt("USABILITY"));
				bookmaker.setResult(rs.getInt("RESULT"));
				bookmaker.setWeight(rs.getInt("WEIGHT"));
				bookmaker.setCounter(rs.getInt("COUNTER"));
				bookmaker.setBonus(rs.getString("BONUS"));
				return bookmaker;
			}
		}); 
		if (list.size() >0){
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public void updBookmakerById(long id) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		int count = template.update(UPDATE_BOOKMAKER_BY_ID, id);
		if (count == 0) {
			throw new DaoException("Bookmaker ID hasn't founded");
		}
	}
}
