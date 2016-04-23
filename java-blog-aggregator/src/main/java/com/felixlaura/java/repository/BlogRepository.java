package com.felixlaura.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer>{

}
