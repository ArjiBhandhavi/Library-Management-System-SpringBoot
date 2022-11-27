package com.library.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
public class BookTransaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	@Column(nullable = true)
	private boolean isissued;
	@Column(nullable = true)
	private boolean isreturned;
	private LocalDate trandate;
	
	public BookTransaction() {
		this.trandate=LocalDate.now();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public boolean isIsissued() {
		return isissued;
	}

	public void setIsissued(boolean isissued) {
		this.isissued = isissued;
	}

	public boolean isIsreturned() {
		return isreturned;
	}

	public void setIsreturned(boolean isreturned) {
		this.isreturned = isreturned;
	}

	public LocalDate getTrandate() {
		return trandate;
	}

	public void setTrandate(LocalDate trandate) {
		this.trandate = trandate;
	}
	
	
}
