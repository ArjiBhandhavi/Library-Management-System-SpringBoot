package com.library.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.dtos.TransactionDTO;
import com.library.entities.Book;
import com.library.entities.Student;
import com.library.services.BookService;
import com.library.services.StudentService;
import com.library.services.TransactionService;
import com.library.services.UserService;

@Controller
public class AdminController {

	@Autowired private BookService bservice;
	@Autowired private UserService uservice;
	@Autowired private StudentService sservice;
	@Autowired private TransactionService tservice;
	
	@GetMapping("/dashboard")
	public String adminhome() {
		return "adminhome";
	}
	
	@GetMapping("books")
	public String books(Model model) {
		model.addAttribute("list", bservice.listall());
		return "books";
	}
	
	@GetMapping("/addbook")
	public String addbook() {
		return "addbook";
	}
	
	@PostMapping("/addbook")
	public String savebook(Book book,RedirectAttributes ra) {
		bservice.save(book);
		ra.addFlashAttribute("msg", "Book added successfully");
		return "redirect:/books";
	}
	
	@GetMapping("/users")
	public String users(Model model) {
		model.addAttribute("list", uservice.listall());
		return "users";
	}
	
	@GetMapping("/editbook/{id}")
	public String editBook(@PathVariable("id") int id,Model model) {
		model.addAttribute("bk", bservice.findById(id));
		return "editbook";
	}
	
	@PostMapping("/editbook/{id}")
	public String savebook(@PathVariable("id") int id,Book book,RedirectAttributes ra) {
		book.setId(id);
		bservice.save(book);
		ra.addFlashAttribute("msg", "Book updated successfully");
		return "redirect:/books";
	}
	
	@GetMapping("/issue")
	public String issueBok(Optional<Integer> bookid,Optional<Integer> stdid,Model model) {
		if(bookid.isPresent()) {
			Book bk=bservice.findById(bookid.get());
			if(bk==null) {
				model.addAttribute("binvalid", true);				
			}else if(!bk.isIsavailable())
				model.addAttribute("bunavailable", true);
			else {
				model.addAttribute("bk", bk);
				model.addAttribute("bfound", true);
			}
			
		}
		if(stdid.isPresent()) {
			Student std=sservice.findById(stdid.get());
			if(std==null)
				model.addAttribute("sinvalid", true);
			else {
				model.addAttribute("std", std);
				model.addAttribute("sfound", true);
			}
		}
		
		return "issuebook";
	}
	
	@PostMapping("/issue")
	public String processissue(TransactionDTO dto,RedirectAttributes ra) {
		tservice.issuebook(dto);
		ra.addFlashAttribute("msg", "Book issued");
		return "redirect:/books";
	}
	
	@GetMapping("/report")
	public String report(Optional<Integer> stdid, Model model) {
		model.addAttribute("list",tservice.report(stdid));
		return "report";
	}
	
	@GetMapping("/return")
	public String returnBook(Optional<Integer> stdid,Model model) {
		if(stdid.isPresent()) {
			Student std=sservice.findById(stdid.get());
			if(std!=null) {
				model.addAttribute("sfound", true);
				model.addAttribute("std",std );			
				model.addAttribute("hadbooks", true);
				model.addAttribute("books", tservice.issuedBook(stdid.get()));
			}else
				model.addAttribute("sinvalid", true);
		}
		return "returnbook";
	}
	
	@PostMapping("/return")
	public String processreturn(TransactionDTO dto,RedirectAttributes ra) {
		tservice.returnbook(dto);
		ra.addFlashAttribute("msg", "Book returned");
		return "redirect:/books";
	}
}
