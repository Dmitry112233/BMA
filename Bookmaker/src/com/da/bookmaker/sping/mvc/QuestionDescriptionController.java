package com.da.bookmaker.sping.mvc;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

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

	private InputStream fis;
	static private Properties property;

	@RequestMapping("/FAQList_{id}_details")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException, IOException {
		Map<String, Object> map = getQuestionByID(id);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			if (id == 1) {
				map.put("Question1_T", property.getProperty("Question1_T"));
				map.put("Question1_T", property.getProperty("Question1_T"));
				map.put("Question1_T", property.getProperty("Question1_T"));
			}
			if (id == 6) {
				map.put("Question6_T", property.getProperty("Question6_T"));
				map.put("Question6_T", property.getProperty("Question6_T"));
				map.put("Question6_T", property.getProperty("Question6_T"));
			}
			if (id == 10) {
				map.put("Question10_T", property.getProperty("Question10_T"));
				map.put("Question10_T", property.getProperty("Question10_T"));
				map.put("Question10_T", property.getProperty("Question10_T"));
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("lessonsDescriptionPage", map);
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
