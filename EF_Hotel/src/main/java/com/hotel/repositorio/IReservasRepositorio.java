package com.hotel.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.modelos.reservas;

public interface IReservasRepositorio extends JpaRepository<reservas, Integer>{

}
