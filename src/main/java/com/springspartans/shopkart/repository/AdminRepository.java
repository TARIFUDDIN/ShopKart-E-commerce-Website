package com.springspartans.shopkart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springspartans.shopkart.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer>
{
	
}