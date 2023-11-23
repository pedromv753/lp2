package com.hotel.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class habitaciones {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int numero;
	private String tipo;
	private double precio;
	
	public habitaciones(int id, int numero, String tipo, double precio) {
		this.id = id;
		this.numero = numero;
		this.tipo = tipo;
		this.precio = precio;
	}
	
	public habitaciones() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "habitaciones [id=" + id + ", numero=" + numero + ", tipo=" + tipo + ", precio=" + precio + "]";
	}
}