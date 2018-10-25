package com.da.bookmaker.sping.mvc;

import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.UTF_8;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.da.bookmaker.bean.CommentBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class CommentController {

	@RequestMapping(value = "/save_comment", method = RequestMethod.GET)
	public @ResponseBody void saveComment(@RequestParam("id") long id, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("comment") String comment,  @RequestParam("level") String level) throws DaoException, IOException {
		CommentBean bean = new CommentBean();
		bean.setBookmakerID(id);
		bean.setComment(comment);
		bean.setEmail(email);
		bean.setLevel(level);
		bean.setName(name);
		bean.setVisible(0);
		DaoFactory.getCommentDao().addComment(bean);
	}

	public String getStringUtf8(String name) {
		byte[] ptext = name.getBytes(ISO_8859_1);
		name = new String(ptext, UTF_8);
		return name;
	}
}
