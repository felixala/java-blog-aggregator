package com.felixlaura.java.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.Blog;
import com.felixlaura.java.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer>{
	
	List<Item> findByBlog(Blog blog);
}
