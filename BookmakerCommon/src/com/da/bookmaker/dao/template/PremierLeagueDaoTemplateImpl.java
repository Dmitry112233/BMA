package com.da.bookmaker.dao.template;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.PremierLeagueBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.PremierLeagueDao;

public class PremierLeagueDaoTemplateImpl implements PremierLeagueDao{

	private DataSource dataSource;
	
	private final static String INSERT_MATCHES_LIST = "INSERT INTO PREMIER_LEAGUE (DATE, TEAM1, TEAM2, WIN1, WIN2, X, X1, X2, X12, " +
	"TOTAL, LESS_TOTAL, MORE_TOTAL, HAND, HAND1, HAND2, LEAGUE, BOOKMAKER_ID) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	private final static String DELETE_MATCHES_LIST = "DELETE FROM PREMIER_LEAGUE";
	
	//Расставить алиасы для повторяющихся полей, также алиасы в мапинге и имена таблиц перед поялми. 
	private final static String GET_APL_MATCHES_LIST = "SELECT PL.ID PL_ID, PL.DATE, PL.TEAM1, PL.TEAM2, PL.WIN1, PL.WIN2, " + 
	"PL.X, PL.X1, PL.X2, PL.X12, PL.TOTAL, PL.LESS_TOTAL, PL.MORE_TOTAL, PL.HAND, PL.HAND1, PL.HAND2, PL.LEAGUE, B.ID B_ID, B.NAME, " +
	"B.LINK, B.IMAGE"
	+ " FROM PREMIER_LEAGUE PL "
	+ " JOIN BOOKMAKERS B "
	+ " ON B.ID = PL.BOOKMAKER_ID"
	+ " WHERE LEAGUE = 'Чемпионат Англии'";
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addMatchesList(List<PremierLeagueBean> matches) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.batchUpdate(INSERT_MATCHES_LIST, matches, matches.size(), new ParameterizedPreparedStatementSetter<PremierLeagueBean>() {
			@Override
			public void setValues(PreparedStatement statement, PremierLeagueBean bean) throws SQLException {
				statement.setTimestamp(1, new Timestamp(bean.getDate().getTime()));
				statement.setString(2, bean.getTeam1());
				statement.setString(3, bean.getTeam2());
				statement.setDouble(4, bean.getWin1());
				statement.setDouble(5, bean.getWin2());
				statement.setDouble(6, bean.getX());
				statement.setDouble(7, bean.getX1());
				statement.setDouble(8, bean.getX2());
				statement.setDouble(9, bean.getX12());
				statement.setDouble(10, bean.getTotal());
				statement.setDouble(11, bean.getLessTotal());
				statement.setDouble(12, bean.getMoreTotal());
				statement.setString(13, bean.getHand());
				statement.setDouble(14, bean.getHand1());
				statement.setDouble(15, bean.getHand2());
				statement.setString(16, bean.getLeague());
				statement.setLong(17, bean.getBookmakerId());
			}
		});
	}

	@Override
	public void deleteMatchesList() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		template.update(DELETE_MATCHES_LIST);
	}

	@Override
	public List<PremierLeagueBean> getAllMatchesForAPL() throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<PremierLeagueBean> list = template.query(GET_APL_MATCHES_LIST, new RowMapper<PremierLeagueBean>() {
			@Override
			public PremierLeagueBean mapRow(ResultSet rs, int rowNum) throws SQLException {
				PremierLeagueBean bean = new PremierLeagueBean();
				bean.setId(rs.getLong("PL_ID"));
				bean.setDate(rs.getTimestamp("DATE"));
				bean.setTeam1(rs.getString("TEAM1"));
				bean.setTeam2(rs.getString("TEAM2"));
				bean.setWin1(rs.getDouble("WIN1"));
				bean.setX(rs.getShort("X"));
				bean.setWin1(rs.getDouble("WIN2"));
				bean.setX1(rs.getDouble("X1"));
				bean.setX2(rs.getDouble("X2"));
				bean.setX12(rs.getDouble("X12"));
				bean.setTotal(rs.getDouble("TOTAL"));
				bean.setLessTotal(rs.getDouble("LESS_TOTAL"));
				bean.setMoreTotal(rs.getDouble("MORE_TOTAL"));
				bean.setHand(rs.getString("HAND"));
				bean.setLessTotal(rs.getDouble("HAND1"));
				bean.setLessTotal(rs.getDouble("HAND2"));
				bean.setLeague(rs.getString("LEAGUE"));
				
				// засетить параметры для букмекера
				BookmakerBean bookmakerBean = new BookmakerBean();
				bookmakerBean.setBookMakerId(rs.getLong("B_ID"));
				bookmakerBean.setName(rs.getString("NAME"));
				bookmakerBean.setLink(rs.getString("LINK"));
				bookmakerBean.setImage(rs.getString("IMAGE"));
				bean.setBookmakerBean(bookmakerBean);
				return bean;
			}
		});
		return list;
		
	}	
}
