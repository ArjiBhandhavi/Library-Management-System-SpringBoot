package com.library.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.library.dtos.TransactionDTO;
import com.library.entities.Book;
import com.library.entities.BookTransaction;
import com.library.entities.Student;
import com.library.repository.BookTransactionRepository;

@Service
public class TransactionService {

	@Autowired private BookTransactionRepository repo;
	@Autowired private StudentService sservice;
	@Autowired private BookService bservice;
	
	public void issuebook(TransactionDTO dto) {
		Book book=bservice.findById(dto.getBookid());
		Student std=sservice.findById(dto.getStdid());
		BookTransaction bt=new BookTransaction();
		bt.setBook(book);
		bt.setStudent(std);
		bt.setIsissued(true);
		repo.save(bt);
		
		book.setIsavailable(false);
		bservice.save(book);
		
	}
	
	public void returnbook(TransactionDTO dto) {
		Book book=bservice.findById(dto.getBookid());
		Student std=sservice.findById(dto.getStdid());
		BookTransaction bt=repo.findByBookAndStudent(book, std);
		bt.setIsreturned(true);
		repo.save(bt);
		
		book.setIsavailable(true);
		bservice.save(book);
		
	}
	
	public List<BookTransaction> history(int stdid){
		return repo.findByStudent(sservice.findById(stdid));
	}
	
	public List<BookTransaction> report(Optional<Integer> stdid){
		if(stdid.isPresent()) {
			return repo.findIssueBookTransactions(stdid.get());
		}else {
			return repo.findAll(Sort.by(Direction.DESC,"id"));
		}
	}
	
	public List<Book> issuedBook(int stdid){
		return repo.findIssueBook(stdid);
	}
}
