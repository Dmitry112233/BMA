package com.da.bookmaker.util;

import java.util.Map;
import java.util.Map.Entry;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class TranslationUtils {

	private final static Map<Character, Character> RUS_TO_TRANSLIT_DICTIONARY = 
			new ImmutableMap.Builder<Character, Character>()
				.put('й', 'j').put('ц', 'c').put('у', 'q').put('к', 'k').put('е', 'e')
				.put('н', 'n').put('г', 'g').put('ш', 'w').put('щ', 'x').put('з', 'z')
				.put('х', 'h').put('ъ', '[').put('ф', 'f').put('ы', 'y').put('в', 'v')
				.put('а', 'a').put('п', 'p').put('р', 'r').put('о', 'o').put('л', 'l')
				.put('д', 'd').put('ж', '*').put('э', '<').put('я', '~').put('ч', '>')
				.put('с', 's').put('ё', '^').put('м', 'm').put('и', 'i').put('т', 't')
				.put('ь', ']').put('б', 'b').put('ю', 'u').put(' ', '+').build();
	
	private final static Map<Character, Character> TRANSLIT_TO_RUS_DICTIONARY;
	
	static {
		Builder<Character, Character> builder = new Builder<>();
		for (Entry<Character, Character> entry : RUS_TO_TRANSLIT_DICTIONARY.entrySet()){
			builder.put(entry.getValue(), entry.getKey());
		}
		TRANSLIT_TO_RUS_DICTIONARY = builder.build();
		if (RUS_TO_TRANSLIT_DICTIONARY.size() != TRANSLIT_TO_RUS_DICTIONARY.size()){
			throw new RuntimeException("Dictionaries have different sizes");
		}
	}
	
	public static final String toTranslit(String word){
		StringBuilder builder = new StringBuilder();
		for (char c : word.toLowerCase().toCharArray()){
			builder.append(RUS_TO_TRANSLIT_DICTIONARY.getOrDefault(c, c));
		}
		return builder.toString();
	}
	
	public static final String toRus(String word){
		StringBuilder builder = new StringBuilder();
		for (char c : word.toLowerCase().toCharArray()){
			builder.append(TRANSLIT_TO_RUS_DICTIONARY.getOrDefault(c, c));
		}
		return builder.toString();
	}
}
