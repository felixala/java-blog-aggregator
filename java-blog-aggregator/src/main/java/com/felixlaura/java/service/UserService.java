package com.felixlaura.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.felixlaura.java.entity.Blog;
import com.felixlaura.java.entity.Item;
import com.felixlaura.java.entity.User;
import com.felixlaura.java.repository.BlogRepository;
import com.felixlaura.java.repository.ItemRepository;
import com.felixlaura.java.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	@Transactional
	public User findOneWithBlogs(int id) {
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findByUser(user);
		for(Blog blog : blogs){
			List<Item> items = itemRepository.
					findByBlog(blog, new PageRequest(0, 10, Direction.DESC, "published"));
			blog.setItems(items);
		}
		user.setBlogs(blogs);
		return user;
	}
}
