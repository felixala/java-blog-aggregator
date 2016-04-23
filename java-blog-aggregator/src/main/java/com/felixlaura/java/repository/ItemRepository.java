package com.felixlaura.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer>{

}
