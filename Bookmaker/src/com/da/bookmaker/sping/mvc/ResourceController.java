package com.da.bookmaker.sping.mvc;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourceController {

	@RequestMapping("{fileName}.txt")
	public void getTxtResource(@PathVariable("fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("");
		returnFile(fileName + ".txt", request, response);
	}
	
	@RequestMapping("{fileName}.xml")
	public void getXmlResource(@PathVariable("fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException{
		returnFile(fileName + ".xml", request, response);
	}
	
	@RequestMapping("{fileName}.html")
	public void getHtmlResource(@PathVariable("fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException{
		returnFile(fileName + ".html", request, response);
	}

	private void returnFile(String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {
		try (InputStream inputStream = request.getServletContext().getResourceAsStream(fileName)){
			if (inputStream == null){
				request.getRequestDispatcher("Error404Page").forward(request, response);
				return;
			}
			File file = new File(request.getServletContext().getResource(fileName).getFile());
			String mime = Files.probeContentType(file.toPath());
			response.setContentLengthLong(file.length());
			response.setContentType(mime);
			byte[] buffer = new byte[(int) file.length()];
			inputStream.read(buffer);
			response.getOutputStream().write(buffer);
		} catch (IOException | ServletException e) {
			throw new RuntimeException(e);
		}
	}
}
