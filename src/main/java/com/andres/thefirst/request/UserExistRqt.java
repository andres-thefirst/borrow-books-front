package com.andres.thefirst.request;

public class UserExistRqt {
	
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserExistRqt [email=" + email + "]";
	}
	
}
