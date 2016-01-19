package com.andres.thefirst.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class home {
	
	@RequestMapping(value = "/login")
	public String login(){
		return "login";
	}
}
