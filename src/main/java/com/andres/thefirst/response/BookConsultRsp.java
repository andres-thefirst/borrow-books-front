package com.andres.thefirst.response;

import java.util.List;

import com.andres.thefirst.dto.BookDto;

public class BookConsultRsp {
	private long total;
	private int pages;
	private List<BookDto> listBook;
	
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public List<BookDto> getListBooks() {
		return listBook;
	}
	public void setListBooks(List<BookDto> listBooks) {
		this.listBook = listBooks;
	}
	
	@Override
	public String toString() {
		return "BookConsultRsp [total=" + total + ", pages=" + pages + ", listBook=" + listBook + "]";
	}
	
	
}
