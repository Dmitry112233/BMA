package com.da.bookmaker.sping.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class QuestionController {

	@RequestMapping("/QuestionList.spr")
	public ModelAndView getMainList() throws DaoException {
		List<QuestionBean> questionsList = DaoFactory.getQuestionDao().getAllQuestions();

		return new ModelAndView("parts/textLessons", "questionsList", questionsList);
	}
}
