package com.library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.library.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

	List<User> findByIsadmin(boolean admin);
}
