package com.felixlaura.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.felixlaura.java.entity.Blog;
import com.felixlaura.java.entity.User;
import com.felixlaura.java.repository.BlogRepository;
import com.felixlaura.java.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository UserRepository;
	
	public void save(Blog blog, String name){
		User user = UserRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}
}
