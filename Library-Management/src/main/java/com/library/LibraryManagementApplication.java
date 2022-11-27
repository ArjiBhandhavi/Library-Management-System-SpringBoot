package com.library;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.library.entities.User;
import com.library.repository.UserRepository;

@SpringBootApplication
public class LibraryManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(LibraryManagementApplication.class, args);
	}
	
	@Bean
	public CommandLineRunner demo(UserRepository repo) {
	    return (args) -> {
	    	if(repo.count()==0) {
	    		User user=new User();
	    		user.setUserid("admin");
	    		user.setPwd("admin");
	    		user.setUname("Administrator");
	    		user.setIsadmin(true);
	    		repo.save(user);
	    	}
	    };
	}

}
