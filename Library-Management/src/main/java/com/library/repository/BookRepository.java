package com.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.library.entities.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {

	List<Book> findByIsavailable(boolean status);
	List<Book> findByBnameContaining(String search);
}
