package com.andres.thefirst.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andres.thefirst.books.entity.User;
import com.andres.thefirst.books.service.IUserBo;
import com.andres.thefirst.dto.ResponseDto;
import com.andres.thefirst.request.UserExistRqt;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	IUserBo userBo;
	
	@RequestMapping(value="/user/isUserExist")
	public @ResponseBody ResponseDto isUserExist(@RequestBody UserExistRqt rqt){
		ResponseDto responseDto = new ResponseDto();
		
		try{
			User user = userBo.findByUser(rqt.getEmail());
			if(user!=null)
				responseDto.setContent(true);
			else
				responseDto.setContent(false);
		}catch(Exception e){
			responseDto.setCode(-1);
			responseDto.setMessage("Error al consultar el usuario");
		}
		
		return responseDto;
	}
}
