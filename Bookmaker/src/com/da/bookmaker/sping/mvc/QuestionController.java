package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.da.bookmaker.bean.BookmakerBean;
import com.da.bookmaker.bean.QuestionBean;
import com.da.bookmaker.dao.DaoException;
import com.da.bookmaker.dao.DaoFactory;

@Controller
public class QuestionController extends BookmakerController {

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/FAQList")
	public ModelAndView getMainList() throws DaoException, IOException {
		Map<String, Object> map = getFAQList();
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			map.put("FAQ_T", property.getProperty("FAQ_T"));
			map.put("FAQ_H1", property.getProperty("FAQ_H1"));
			map.put("FAQ_D", property.getProperty("FAQ_D"));
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("lessons", map);
	}

	private Map<String, Object> getFAQList() throws DaoException {
		List<QuestionBean> questionsList = DaoFactory.getQuestionDao().getAllQuestions();

		for (QuestionBean bean : questionsList) {
			String str = bean.getAnswer();
			BookmakerBean xBet = getBookmakerList().get("bookmakerList").get("1xBet");
			if (str.contains("BKLINKBET")) {
				String replaceString = str.replace("BKLINKBET", "Counter.spr?id=" + xBet.getBookMakerId());
				bean.setAnswer(replaceString);
			} else {
				continue;
			}
		}

		Map<String, Object> map = new HashMap<>();
		map.put("questionsList", questionsList);
		return map;
	}
}
