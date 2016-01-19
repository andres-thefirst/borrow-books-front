package com.andres.thefirst.request;

public class UserRqt {
	String email;
	String password;
	
	public UserRqt() {
		// TODO Auto-generated constructor stub
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "UserRqt [email=" + email + ", password=" + password + "]";
	}
	
	
}
