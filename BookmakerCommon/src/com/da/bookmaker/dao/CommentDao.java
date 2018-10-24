package com.da.bookmaker.dao;

import java.util.List;

import com.da.bookmaker.bean.CommentBean;

public interface CommentDao {

	void addComment(CommentBean bean) throws DaoException;
	
	List<CommentBean> getCommentsForBookmaker(long id) throws DaoException;
	
}
