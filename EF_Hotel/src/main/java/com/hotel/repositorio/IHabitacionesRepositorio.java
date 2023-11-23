package com.hotel.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hotel.modelos.habitaciones;

public interface IHabitacionesRepositorio extends JpaRepository<habitaciones, Integer>{

}
