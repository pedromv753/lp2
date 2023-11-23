package com.hotel.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.modelos.clientes;

public interface IClientesRepositorio extends JpaRepository<clientes,Integer>{

}
