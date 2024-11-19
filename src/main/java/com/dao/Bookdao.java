package com.dao;

import java.util.List;

import com.entity.BookAdd;

public interface Bookdao {
	public boolean addBook(BookAdd b);
	List<BookAdd> viewBook(BookAdd b);
	public BookAdd editBook(int id);
	public void delBook(int id);
	public List<BookAdd> showBookHome();
	public List<BookAdd> getRecentBook();
	
	public List<BookAdd> allNewBook();
	
	public List<BookAdd> allRecentBook();
	
	public BookAdd viewDetails(int id);
}
