package com.felixlaura.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.Blog;
import com.felixlaura.java.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer>{
	
	List<Blog> findByUser(User user);
}
