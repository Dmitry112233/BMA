package com.da.bookmaker.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WwwRedirect implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if (request instanceof HttpServletRequest){
			HttpServletRequest httpServletRequest = (HttpServletRequest) request;
			String url = httpServletRequest.getRequestURL().toString();
			if (url.contains("www.")){
				((HttpServletResponse)response).sendRedirect(url.replace("www.", ""));
			}
			else if(httpServletRequest.getServletPath().equals("/index.html")){
				httpServletRequest.getRequestDispatcher("bookmakers").forward(request, response);
			} 
			else {
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}
	}
	
}
