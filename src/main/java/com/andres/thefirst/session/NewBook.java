package com.andres.thefirst.session;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


public class NewBook {
	Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
