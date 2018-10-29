package com.da.bookmaker.dao.template;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.da.bookmaker.bean.CommentBean;
import com.da.bookmaker.dao.CommentDao;
import com.da.bookmaker.dao.DaoException;

public class CommentsDaoTemplateImpl implements CommentDao {

	private final static String SAVE_COMMENT = "INSERT INTO COMMENTS (NAME, EMAIL, COMMENT, LEVEL, BOOKMAKER_ID, VISIBLE, DATE) VALUES (?,?,?,?,?,?,?)";

	private final static String GET_COMMENTS_FOR_BOOKMAKER = "SELECT NAME, EMAIL, COMMENT, LEVEL, ID, DATE FROM COMMENTS WHERE BOOKMAKER_ID = ? AND VISIBLE = 1 ORDER BY DATE DESC";

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void addComment(CommentBean comment) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		GeneratedKeyHolder holder = new GeneratedKeyHolder();
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement statement = con.prepareStatement(SAVE_COMMENT,
						PreparedStatement.RETURN_GENERATED_KEYS);
				statement.setString(1, comment.getName());
				statement.setString(2, comment.getEmail());
				statement.setString(3, comment.getComment());
				statement.setString(4, comment.getLevel());
				statement.setLong(5, comment.getBookmakerID());
				statement.setInt(6, comment.getVisible());
				statement.setTimestamp(7, new Timestamp(comment.getDate().getTime()));
				return statement;
			}
		}, holder);
	}

	@Override
	public List<CommentBean> getCommentsForBookmaker(long id) throws DaoException {
		JdbcTemplate template = new JdbcTemplate(dataSource);
		List<CommentBean> list = template.query(GET_COMMENTS_FOR_BOOKMAKER, new Object[] { id },
				new RowMapper<CommentBean>() {
					@Override
					public CommentBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						CommentBean bean = new CommentBean();
						bean.setName(rs.getString("NAME"));
						bean.setEmail(rs.getString("EMAIL"));
						bean.setComment(rs.getString("COMMENT"));
						bean.setLevel(rs.getString("LEVEL"));
						bean.setId(rs.getLong("ID"));
						bean.setDate(rs.getTimestamp("DATE"));
						return bean;
					}
				});
		return list;
	}
}
