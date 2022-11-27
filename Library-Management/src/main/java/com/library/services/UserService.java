package com.library.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.dtos.LoginDTO;
import com.library.dtos.PasswordResetDTO;
import com.library.entities.User;
import com.library.repository.UserRepository;


@Service
public class UserService {

	@Autowired private UserRepository repo;
	
	public void saveUser(User user) {
		repo.save(user);
	}
	
	public List<User> listall(){
		return repo.findByIsadmin(false);
	}
	
	public User validate(LoginDTO dto) {
		User user=repo.findById(dto.getUserid()).orElse(null);
		if(user!=null && user.getPwd().equals(dto.getPwd()) && user.isIsactive())
			return user;
		return null;
	}
	
	public boolean verifyUser(PasswordResetDTO dto) {
		User user=repo.findById(dto.getUserid()).orElse(null);
		return user.getPwd().equals(dto.getCurrent());
	}
	
	public void updatePassword(PasswordResetDTO dto) {
		User user=repo.findById(dto.getUserid()).orElse(null);
		user.setPwd(dto.getNewpwd());
		repo.save(user);
	}
}
