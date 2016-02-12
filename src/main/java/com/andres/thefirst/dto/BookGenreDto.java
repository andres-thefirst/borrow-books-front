package com.andres.thefirst.dto;

import com.andres.thefirst.books.entity.BookGenre;

public class BookGenreDto {
	private int id;
	private String genre;
	
	
	public BookGenreDto(BookGenre that){
		this.id = that.getId();
		this.genre = that.getGenre();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	
	@Override
	public String toString() {
		return "BookGenreDto [id=" + id + ", genre=" + genre + "]";
	}
	
}
