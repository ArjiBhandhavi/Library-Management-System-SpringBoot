package com.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.library.entities.Book;
import com.library.entities.BookTransaction;
import com.library.entities.Student;

@Repository
public interface BookTransactionRepository extends JpaRepository<BookTransaction, Integer> {
	
	@Query(value = "select book from BookTransaction where student_id=?1 and isreturned=0")
	List<Book> findIssueBook(int stdid);
	
	@Query(value = "from BookTransaction where student_id=?1 and isreturned=0")
	List<BookTransaction> findIssueBookTransactions(int stdid);
	
	BookTransaction findByBookAndStudent(Book book,Student student);
	
	List<BookTransaction> findByStudent(Student student);
} 
