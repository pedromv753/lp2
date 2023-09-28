package com.farmacia.reporsitorio;

import org.springframework.data.jpa.repository.JpaRepository;
import com.farmacia.modelo.farmacia;

public interface JfarmaciaRepositorio extends JpaRepository<farmacia, Integer> {
	

}
