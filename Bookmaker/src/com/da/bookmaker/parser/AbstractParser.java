package com.da.bookmaker.parser;

public abstract class AbstractParser {

	private static final String PROXY_PREFIX = "http://sss.";
	
	private static final String PROXY_SUFFIX = ".ru2.gsr.awhoer.net";

	protected final String getProxyUrl(String url, String params){
		return new StringBuilder(PROXY_PREFIX)
				.append(url)
				.append(PROXY_SUFFIX)
				.append(params)
				.toString();
	}
	
}
