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

	@RequestMapping("/faq_list_{id}_details")
	public ModelAndView getMainList(@PathVariable("id") int id) throws DaoException, IOException {
		Map<String, Object> map = getQuestionByID(id);
		map.putAll(getBookmakerList());
		try {
			if (property == null) {
				property = new Properties();
				fis = Thread.currentThread().getContextClassLoader().getResourceAsStream("copies.properties");
				property.load(fis);
			}
			switch (id) {
			case 1:
				map.put("Question_T", property.getProperty("Question1_T"));
				map.put("Question_H1", property.getProperty("Question1_H1"));
				map.put("Question_D", property.getProperty("Question1_D"));
				map.put("Question_Txt", property.getProperty("Question1_Txt"));
				break;
			case 2:
				map.put("Question_T", property.getProperty("Question2_T"));
				map.put("Question_H1", property.getProperty("Question2_H1"));
				map.put("Question_D", property.getProperty("Question2_D"));
				map.put("Question_Txt", property.getProperty("Question2_Txt"));
				break;
			case 3:
				map.put("Question_T", property.getProperty("Question3_T"));
				map.put("Question_H1", property.getProperty("Question3_H1"));
				map.put("Question_D", property.getProperty("Question3_D"));
				map.put("Question_Txt", property.getProperty("Question3_Txt"));
				break;
			case 4:
				map.put("Question_T", property.getProperty("Question4_T"));
				map.put("Question_H1", property.getProperty("Question4_H1"));
				map.put("Question_D", property.getProperty("Question4_D"));
				map.put("Question_Txt", property.getProperty("Question4_Txt"));
				break;
			case 5:
				map.put("Question_T", property.getProperty("Question5_T"));
				map.put("Question_H1", property.getProperty("Question5_H1"));
				map.put("Question_D", property.getProperty("Question5_D"));
				map.put("Question_Txt", property.getProperty("Question5_Txt"));
				break;
			case 6:
				map.put("Question_T", property.getProperty("Question6_T"));
				map.put("Question_H1", property.getProperty("Question6_H1"));
				map.put("Question_D", property.getProperty("Question6_D"));
				map.put("Question_Txt", property.getProperty("Question6_Txt"));
				break;
			case 7:
				map.put("Question_T", property.getProperty("Question7_T"));
				map.put("Question_H1", property.getProperty("Question7_H1"));
				map.put("Question_D", property.getProperty("Question7_D"));
				map.put("Question_Txt", property.getProperty("Question7_Txt"));
				break;
			case 8:
				map.put("Question_T", property.getProperty("Question8_T"));
				map.put("Question_H1", property.getProperty("Question8_H1"));
				map.put("Question_D", property.getProperty("Question8_D"));
				map.put("Question_Txt", property.getProperty("Question8_Txt"));
				break;
			case 9:
				map.put("Question_T", property.getProperty("Question9_T"));
				map.put("Question_H1", property.getProperty("Question9_H1"));
				map.put("Question_D", property.getProperty("Question9_D"));
				map.put("Question_Txt", property.getProperty("Question9_Txt"));
				break;
			case 10:
				map.put("Question_T", property.getProperty("Question10_T"));
				map.put("Question_H1", property.getProperty("Question10_H1"));
				map.put("Question_D", property.getProperty("Question10_D"));
				map.put("Question_Txt", property.getProperty("Question10_Txt"));
				break;
			}
		} catch (IOException e) {
			System.err.println("Файл отсутствует");
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		return new ModelAndView("questionDescription", map);
	}

	private Map<String, Object> getQuestionByID(int id) throws DaoException {
		QuestionBean bean = DaoFactory.getQuestionDao().getQuestionById(id);
		String str = bean.getAnswer();
		BookmakerBean xBet = getBookmakerList().get("bookmakerList").get("1xBet");
		if (str.contains("BKLINKBET")) {
			String replaceString = str.replace("BKLINKBET", "counter?id=" + xBet.getBookMakerId());
			bean.setAnswer(replaceString);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("question", bean);
		return map;
	}
}
