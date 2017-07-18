package com.da.bookmaker.dao.template;

import javax.sql.DataSource;

import com.da.bookmaker.dao.QuestionDao;

public class QuestionDaoTemplateImpl implements QuestionDao{

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
