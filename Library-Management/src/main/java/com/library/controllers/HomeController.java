package com.library.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.dtos.LoginDTO;
import com.library.dtos.PasswordResetDTO;
import com.library.dtos.RegisterDTO;
import com.library.entities.User;
import com.library.services.StudentService;
import com.library.services.UserService;

@Controller
public class HomeController {
	
	@Autowired private HttpSession session;
	@Autowired private UserService uservice;
	@Autowired private StudentService sservice;
	
	@GetMapping("/")
	public String homepage() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/students")
	public String studentpage() {
		return "studentpage";
	}
	
	@PostMapping("/validate")
	public String validate(LoginDTO dto,RedirectAttributes ra) {
		User user=uservice.validate(dto);
		if(user==null) {
			ra.addFlashAttribute("error", "Invalid username or password");
			return "redirect:/";
		}else {
			session.setAttribute("uname", user.getUname());
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("role", user.isIsadmin()?"Admin":"Student");
			session.setAttribute("id",user.isIsadmin()? null : user.getStudent().getId());
			if(user.isIsadmin())
				return "redirect:/dashboard";
			else
				return "redirect:/studenthome";
		}
	}
	
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/register")
	public String register(RegisterDTO dto,RedirectAttributes ra) {
		String userid= sservice.saveStudent(dto);
		ra.addFlashAttribute("msg", "Student registered with id "+userid);
		return "redirect:/students";
	}
	
	@GetMapping("/ChangePwd")
	public String changepassword() {
		return "ChangePwd";
	}
	
	@PostMapping("/ChangePwd")
	public String updatePwd(PasswordResetDTO dto, RedirectAttributes ra) {
		dto.setUserid(session.getAttribute("userid").toString());
		if(uservice.verifyUser(dto)) {
			uservice.updatePassword(dto);
			ra.addFlashAttribute("msg", "Password updated");
		}else {
			ra.addFlashAttribute("error", "Invalid current password");
		}
		return "redirect:/ChangePwd";
	}
}
