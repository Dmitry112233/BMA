package com.da.bookmaker.sping.mvc;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.CommentBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;
import static java.nio.charset.StandardCharsets.*;

@Controller
public class CommentController {
	
	@RequestMapping("/save_comment")
	public ModelAndView saveComment(@RequestParam("name") String name, @RequestParam("email") String email
			, @RequestParam("comment") String comment, @RequestParam("level") String level, @RequestParam("id") long id) throws DaoException, IOException {
		CommentBean bean = new CommentBean();
		bean.setEmail(email);
		bean.setName(getStringUtf8(name));
		bean.setLevel(getStringUtf8(level));
		bean.setComment(getStringUtf8(comment));
		bean.setVisible(0);
		bean.setBookmakerID(id);
		DaoFactory.getCommentDao().addComment(bean);
		
		return new ModelAndView("redirect:/bookmaker_" + id);
	}
	
	public String getStringUtf8(String name){		
		byte[] ptext = name.getBytes(ISO_8859_1); 
		name = new String(ptext, UTF_8); 
		return name;
	}
}
