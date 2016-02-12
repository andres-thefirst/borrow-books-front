package com.andres.thefirst.controllers;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andres.thefirst.books.entity.BookGenre;
import com.andres.thefirst.books.service.IBookGenreBo;
import com.andres.thefirst.dto.BookGenreDto;
import com.andres.thefirst.dto.ResponseDto;

@Controller
public class BookGenreController {

	private static final Logger logger = LoggerFactory.getLogger(BookGenreController.class);
	
	@Autowired
	private IBookGenreBo bookGenreBo;
	
	@RequestMapping( value = "/book/share", method=RequestMethod.POST)
	public @ResponseBody ResponseDto getListGenre(){
		ResponseDto response =  new ResponseDto();
		
		try{
			List<BookGenre> listBookGenre = bookGenreBo.findAll();
			List<BookGenreDto> listDto = new ArrayList<>();
			
			
			
		}catch(Exception e){
			logger.info("::getListGenre:: Error consult list genre");
		}
		
		return response;
			
	}
}
