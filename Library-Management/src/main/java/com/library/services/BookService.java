package com.library.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.entities.Book;
import com.library.repository.BookRepository;

@Service
public class BookService {

	@Autowired private BookRepository repo;
	
	public void save(Book book) {
		repo.save(book);
	}
	
	public List<Book> listall(){
		return repo.findAll();
	}
	
	public void deleteBook(int id) {
		repo.deleteById(id);
	}
	
	public List<Book> availableBooks(){
		return repo.findByIsavailable(true);
	}
	
	public Book findById(int id) {
		return repo.findById(id).orElse(null);
	}
	
	public List<Book> searchbooks(String search){
		return repo.findByBnameContaining(search);
	}
}
