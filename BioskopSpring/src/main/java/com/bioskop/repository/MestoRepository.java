package com.bioskop.repository;



import org.springframework.data.jpa.repository.JpaRepository;


import model.Mesta;

public interface MestoRepository extends JpaRepository<Mesta, Integer>{
	
}
