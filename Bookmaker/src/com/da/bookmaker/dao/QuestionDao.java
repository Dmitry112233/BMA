package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.QuestionBean;

public interface QuestionDao {

	List<QuestionBean> getAllQuestions() throws DaoException;
}
