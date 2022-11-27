package com.library.dtos;

import com.library.entities.Student;

public class RegisterDTO extends Student {

	private String pwd;

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
}
