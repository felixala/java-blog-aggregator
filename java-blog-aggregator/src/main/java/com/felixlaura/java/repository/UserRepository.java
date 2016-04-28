package com.felixlaura.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
