package com.andres.thefirst.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.andres.thefirst.books.service.IUserBo;
import com.andres.thefirst.dto.ResponseDto;
import com.andres.thefirst.request.UserRqt;

@Controller
public class SignUp {
	
	private static final Logger logger = LoggerFactory.getLogger(SignUp.class);

	@Autowired
	private IUserBo userBo;
	
	/*@RequestMapping(value="/signUp", method= RequestMethod.POST)
	public String signUp(Model model, UserRqt rqt){
		boolean success = true;
		try{
			userBo.save(rqt.getEmail(), rqt.getPassword());
		}catch(Exception e){
			success = false;
		}
		
		model.addAttribute("success", success);
		
		return "/signUp/result";
	}*/
	
	@RequestMapping(value="/signUp", method= RequestMethod.POST)
	public @ResponseBody ResponseDto signUp(@RequestBody UserRqt rqt){
		
		boolean success = true;
		ResponseDto response = new ResponseDto();
		
		logger.info("::signUp::Inicio");
		
		try{
			logger.info("::signUp::Salvando");
			userBo.save(rqt.getEmail(), rqt.getPassword());
		}catch(Exception e){
			response.setCode(-1);
			logger.info("::signUp::No se ha podido guardar el usuario");
			e.printStackTrace();
		}
		
		logger.info("::signUp::Fin");
		return response;
	}
}
