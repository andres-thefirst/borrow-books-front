package com.andres.thefirst.dto;

public class ResponseDto {
	
	private String message;
	private Integer code;
	private Object content;
	
	public ResponseDto() {
		// TODO Auto-generated constructor stub
		code = 0;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Object getContent() {
		return content;
	}
	public void setContent(Object content) {
		this.content = content;
	}
	
	
}
