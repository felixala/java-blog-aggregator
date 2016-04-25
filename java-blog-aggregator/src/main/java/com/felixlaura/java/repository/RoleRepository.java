package com.felixlaura.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.felixlaura.java.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByName(String name);

}
