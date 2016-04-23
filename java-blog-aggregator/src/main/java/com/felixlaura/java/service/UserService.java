package com.felixlaura.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.felixlaura.java.entity.User;
import com.felixlaura.java.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	protected UserRepository userRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}
}
