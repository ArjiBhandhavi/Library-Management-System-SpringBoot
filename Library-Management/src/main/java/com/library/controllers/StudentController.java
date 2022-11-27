package com.library.controllers;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.library.services.BookService;
import com.library.services.StudentService;
import com.library.services.TransactionService;

@Controller
public class StudentController {
	
	@Autowired private StudentService service;
	@Autowired private BookService bservice;
	@Autowired private HttpSession session;
	@Autowired private TransactionService tservice;
	
	@GetMapping("/studenthome")
	public String studenthome(Model model) {
		int id=(int)session.getAttribute("id");
		model.addAttribute("s", service.findById(id));
		return "studenthome";
	}
	
	@GetMapping("/mybooks")
	public String report(Model model) {
		int id=(int)session.getAttribute("id");
		model.addAttribute("list",tservice.report(Optional.of(id)));
		return "mybooks";
	}
	
	@GetMapping("/history")
	public String history(Model model) {
		int id=(int)session.getAttribute("id");
		model.addAttribute("list",tservice.history(id));
		return "history";
	}
	
	@GetMapping("/checkbooks")
	public String searchbooks(Optional<String> search, Model model) {
		if(search.isPresent())
			model.addAttribute("list",bservice.searchbooks(search.get()));
		else
			model.addAttribute("list", bservice.listall());
		return "checkbooks";
	}
}
