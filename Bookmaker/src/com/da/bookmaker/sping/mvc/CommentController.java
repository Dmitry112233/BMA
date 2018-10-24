package com.da.bookmaker.sping.mvc;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.CommentBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CommentController {
	
	@RequestMapping("/save_comment")
	public ModelAndView saveComment(@ModelAttribute("comment") CommentBean bean) throws DaoException, IOException {
		bean.setVisible(0);
		DaoFactory.getCommentDao().addComment(bean);
		return new ModelAndView("redirect:/bookmakers" + "_" + bean.getBookmakerID());
	}
}
