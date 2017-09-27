package com.da.bookmaker.sping.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class QuestionController extends BookmakerController{

	@RequestMapping("/FAQList.spr")
	public ModelAndView getMainList() throws DaoException {
		Map<String, Object> map = getFAQList();

		
		map.putAll(getBookmakerList());
		return new ModelAndView("lessons", map);
	}
	
	private Map<String, Object> getFAQList() throws DaoException{
		List<QuestionBean> questionsList = DaoFactory.getQuestionDao().getAllQuestions();
		BookmakerBean xbet = (BookmakerBean) getBookmakerList().get("1xBET");
		for(QuestionBean bean : questionsList){			
			String str = bean.getAnswer();
			str = str.replaceAll("%{1xBet_link}", "${" + xbet.getLink() + "}");
			bean.setAnswer(str);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("questionsList", questionsList);
		return map;
	}
}
