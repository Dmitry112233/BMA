package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class QuestionDescriptionController extends BookmakerController {

	@RequestMapping("/FAQList_{id}_details")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException {

		Map<String, Object> map = getQuestionByID(id);
		map.putAll(getBookmakerList());
		return new ModelAndView("lessonsDetails", map);
	}

	private Map<String, Object> getQuestionByID(int id) throws DaoException {
		QuestionBean bean = DaoFactory.getQuestionDao().getQuestionById(id);
		String str = bean.getAnswer();
		BookmakerBean xBet = getBookmakerList().get("bookmakerList").get("1xBet");
		if (str.contains("BKLINKBET")) {
			String replaceString = str.replace("BKLINKBET", "Counter.spr?id=" + xBet.getBookMakerId());
			bean.setAnswer(replaceString);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("question", bean);
		return map;
	}
}
