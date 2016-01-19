package com.andres.thefirst.dto;

import com.andres.thefirst.books.entity.Book;

public class BookDto {
	
	private int id;
	private String book;
	private String author;
	private String editorial;
	private String isbn;
	private String resume;
	private String image;
	
	public BookDto(){}
	
	public BookDto(Book that){
		this.book = that.getBook();
		this.id = that.getId();
		this.author = that.getAuthor();
		this.editorial = that.getEditorial();
		this.isbn = that.getIsbn();
		this.resume = that.getResume();
		this.image = that.getImage();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getEditorial() {
		return editorial;
	}
	public void setEditorial(String editorial) {
		this.editorial = editorial;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
